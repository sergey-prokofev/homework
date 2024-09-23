# Домашнее задание к занятию "`Отказоустойчивость в облаке`" - `Sergey Prokofev`


### Инструкция по выполнению домашнего задания

   1. Сделайте `fork` данного репозитория к себе в Github и переименуйте его по названию или номеру занятия, например, https://github.com/имя-вашего-репозитория/git-hw или  https://github.com/имя-вашего-репозитория/7-1-ansible-hw).
   2. Выполните клонирование данного репозитория к себе на ПК с помощью команды `git clone`.
   3. Выполните домашнее задание и заполните у себя локально этот файл README.md:
      - впишите вверху название занятия и вашу фамилию и имя
      - в каждом задании добавьте решение в требуемом виде (текст/код/скриншоты/ссылка)
      - для корректного добавления скриншотов воспользуйтесь [инструкцией "Как вставить скриншот в шаблон с решением](https://github.com/netology-code/sys-pattern-homework/blob/main/screen-instruction.md)
      - при оформлении используйте возможности языка разметки md (коротко об этом можно посмотреть в [инструкции  по MarkDown](https://github.com/netology-code/sys-pattern-homework/blob/main/md-instruction.md))
   4. После завершения работы над домашним заданием сделайте коммит (`git commit -m "comment"`) и отправьте его на Github (`git push origin`);
   5. Для проверки домашнего задания преподавателем в личном кабинете прикрепите и отправьте ссылку на решение в виде md-файла в вашем Github.
   6. Любые вопросы по выполнению заданий спрашивайте в чате учебной группы и/или в разделе “Вопросы по заданию” в личном кабинете.
   
Желаем успехов в выполнении домашнего задания!
   
### Дополнительные материалы, которые могут быть полезны для выполнения задания

1. [Руководство по оформлению Markdown файлов](https://gist.github.com/Jekins/2bf2d0638163f1294637#Code)

---

### Задание 1

```
terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
}

provider "yandex" {
  token = var.token
  cloud_id = "b1ge262aciffhrs6noir"
  folder_id = "b1gi9t3tdol0kf9m574t"
  zone = "ru-central1-a" 
}
```

```
#resource "yandex_vpc_network" "network-1" {
#    name = "network-1"
#}



resource "yandex_compute_disk" "disk1" {
    name = "disk1"
    size = 12
    image_id = "fd870suu28d40fqp8srr"
}

resource "yandex_compute_disk" "disk2" {
    name = "disk2"
    size = 12
    image_id = "fd870suu28d40fqp8srr"
}

resource "yandex_vpc_address" "address1" {
    name = "address1"
    external_ipv4_address {
      zone_id = "ru-central1-a"
    }
}

resource "yandex_vpc_address" "address2" {
    name = "address2"
    external_ipv4_address {
      zone_id = "ru-central1-a"
    }
}

resource "yandex_compute_instance" "host1" {
    name = "host1"
    zone = "ru-central1-a"
    resources {
      cores = 2
      memory = 2
    }

    boot_disk {
      disk_id = yandex_compute_disk.disk1.id
    }

    network_interface {
      subnet_id = "e9bkrdr2afi4mjq4lr3h"
      nat = true
      nat_ip_address = yandex_vpc_address.address1.external_ipv4_address[0].address
    }

    metadata = {
      user-data = "${file("user-data1.yml")}"
    }

    scheduling_policy {
      preemptible = true
    }
}

resource "yandex_compute_instance" "host2" {
        name = "host2"
    zone = "ru-central1-a"
    resources {
      cores = 2
      memory = 2
    }

    boot_disk {
      disk_id = yandex_compute_disk.disk2.id
    }

    network_interface {
      subnet_id = "e9bkrdr2afi4mjq4lr3h"
      nat = true
      nat_ip_address = yandex_vpc_address.address2.external_ipv4_address[0].address
    }

    metadata = {
      user-data = "${file("user-data2.yml")}"
    }

    scheduling_policy {
      preemptible = true
    }
}



resource "yandex_lb_target_group" "target-group" {
  name      = "target-group"
  
  target {
    subnet_id = yandex_compute_instance.host1.network_interface.0.subnet_id
    address   = yandex_compute_instance.host1.network_interface.0.ip_address
  }

  target {
    subnet_id = yandex_compute_instance.host2.network_interface.0.subnet_id
    address   = yandex_compute_instance.host2.network_interface.0.ip_address
  }
}


resource "yandex_lb_network_load_balancer" "balancer" {
  name = "balancer"

  listener {
    name = "my-listener"
    port = 80
    external_address_spec {
      ip_version = "ipv4"
    }
  }

  attached_target_group {
    target_group_id = yandex_lb_target_group.target-group.id

    healthcheck {
      name = "http"
      http_options {
        port = 80
        path = "/"
      }
    }
  }
}
```



```
datasource:
 Ec2:
  strict_id: false
ssh_pwauth: no
users:
- name: admin
  sudo: ALL=(ALL) NOPASSWD:ALL
  shell: /bin/bash
  ssh_authorized_keys:
  - ssh-rsa 
```



```
output "external_ipv4_address1" {
    value = yandex_vpc_address.address1.external_ipv4_address[0].address
  
}

output "external_ipv4_address2" {
    value = yandex_vpc_address.address2.external_ipv4_address[0].address
  
}
```

![Задание-1](https://github.com/sergey-prokofev/homework/blob/otazoystoi-4-md/img/1.PNG)


![Задание-1](https://github.com/sergey-prokofev/homework/blob/otazoystoi-4-md/img/2.PNG)
