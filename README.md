# Домашнее задание к занятию "`Управляющие конструкции в коде Terraform`" - `Sergey Prokofev`

---

### Задание 1

`Изучите проект.`
`Инициализируйте проект, выполните код.`
`Приложите скриншот входящих правил «Группы безопасности» в ЛК Yandex Cloud .`

![Задание-1](https://github.com/sergey-prokofev/homework/blob/terraform_03/img/1.PNG)

---

### Задание 2
1. `Создайте файл count-vm.tf. Опишите в нём создание двух одинаковых ВМ web-1 и web-2 (не web-0 и web-1) с минимальными параметрами, используя мета-аргумент count loop. Назначьте ВМ созданную в первом задании группу безопасности.(как это сделать узнайте в документации провайдера yandex/compute_instance )`
```
data "yandex_compute_image" "ubuntu" {
  family = var.default_image
}

resource "yandex_compute_instance" "platform" {
  count = 2

  depends_on = [resource.yandex_compute_instance.db]

  name        = "web-${count.index+1}" 
  platform_id = var.default_platform

  resources { 
    cores         = var.vms_resources.web.cores
    memory        = var.vms_resources.web.memory
    core_fraction = var.vms_resources.web.core_fraction
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
    }
  }

  scheduling_policy {
    preemptible = true
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    security_group_ids = [yandex_vpc_security_group.example.id]
    nat       = true
  }

  metadata = {
    user-data = "${file("user-data.yml")}"
  }

}
```
2. `Создайте файл for_each-vm.tf. Опишите в нём создание двух ВМ для баз данных с именами "main" и "replica" разных по cpu/ram/disk_volume , используя мета-аргумент for_each loop. Используйте для обеих ВМ одну общую переменную типа:`
```
variable "each_vm" {
  type = list(object({  vm_name=string, cpu=number, ram=number, disk_volume=number }))
}
```

```
data "yandex_compute_image" "ubuntu_db" {
  family = var.default_image
}

resource "yandex_compute_instance" "db" {
  for_each = { for vm in var.each_vm : vm.vm_name => vm }

  name        = "${each.key}"
  platform_id = var.default_platform

  resources { 
    cores         = each.value.cpu
    memory        = each.value.ram
    core_fraction = each.value.core_fraction
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
      size     = each.value.disk_volume
    }
  }

  scheduling_policy {
    preemptible = true
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = true
  }

  metadata = {
    user-data = "${file("user-data.yml")}"
  }

}
```

---

### Задание 3

1. `Создайте 3 одинаковых виртуальных диска размером 1 Гб с помощью ресурса yandex_compute_disk и мета-аргумента count в файле disk_vm.tf .`
```
resource "yandex_compute_disk" "disk" {
    count = 3
    name = "disk-${count.index+1}"
    type = var.default_disk_type
    size = 1
}
```
2. `Создайте в том же файле одиночную(использовать count или for_each запрещено из-за задания №4) ВМ c именем "storage" . Используйте блок dynamic secondary_disk{..} и мета-аргумент for_each для подключения созданных вами дополнительных дисков.`
```
resource "yandex_compute_instance" "storage" {

  name        = var.storage_name
  platform_id = var.default_platform

  resources { 
    cores         = var.vms_resources.storage.cores
    memory        = var.vms_resources.storage.memory
    core_fraction = var.vms_resources.storage.core_fraction
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
    }
  }

  dynamic "secondary_disk" {
    for_each = yandex_compute_disk.disk.*
    content {
      disk_id = lookup(secondary_disk.value, "id", null)
    }
  }

  scheduling_policy {
    preemptible = true
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = true
  }

  metadata = {
    user-data = "${file("user-data.yml")}"
  }

}
```
---

### Задание 4

1. `В файле ansible.tf создайте inventory-файл для ansible. Используйте функцию tepmplatefile и файл-шаблон для создания ansible inventory-файла из лекции. Готовый код возьмите из демонстрации к лекции demonstration2. Передайте в него в качестве переменных группы виртуальных машин из задания 2.1, 2.2 и 3.2, т. е. 5 ВМ.`
```
resource "local_file" "hosts_templatefile" {
  content = templatefile("${path.module}/hosts.tftpl", { webservers = yandex_compute_instance.platform,
    databases  = yandex_compute_instance.db,
    storage    = [yandex_compute_instance.storage]
  })

  filename = "${abspath(path.module)}/hosts.ini"
}
```
2. `Инвентарь должен содержать 3 группы и быть динамическим, т. е. обработать как группу из 2-х ВМ, так и 999 ВМ.`
3. `Добавьте в инвентарь переменную fqdn.`
```
[webservers]

%{~ for i in webservers ~}
%{ if try(i["network_interface"][0]["nat_ip_address"], null) != null ~}
${i["name"]}   ansible_host=${i["network_interface"][0]["nat_ip_address"]}    fqdn=${i["id"]}.auto.internal
%{ endif ~}
%{~ endfor ~}

[databases]

%{~ for i in databases ~}
%{ if try(i["network_interface"][0]["nat_ip_address"], null) != null ~}
${i["name"]}   ansible_host=${i["network_interface"][0]["nat_ip_address"]}    fqdn=${i["id"]}.auto.internal
%{ endif ~}
%{~ endfor ~}

[storage]

%{~ for i in storage ~}
%{ if try(i["network_interface"][0]["nat_ip_address"], null) != null ~}
${i["name"]}   ansible_host=${i["network_interface"][0]["nat_ip_address"]}    fqdn=${i["id"]}.auto.internal
%{ endif ~}
%{~ endfor ~} 
```
4. `Выполните код. Приложите скриншот получившегося файла.`

![Задание-4](https://github.com/sergey-prokofev/homework/blob/terraform_03/img/2.PNG)