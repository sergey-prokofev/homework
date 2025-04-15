resource "yandex_compute_disk" "disk" {
    count = 3
    name = "disk-${count.index+1}"
    type = var.default_disk_type
    size = 1
}

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