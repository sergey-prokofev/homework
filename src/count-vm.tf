data "yandex_compute_image" "ubuntu" {
  family = var.default_image
}

resource "yandex_compute_instance" "platform" {
  count = 2

  depends_on = [resource.yandex_compute_instance.db]

  name        = "web-${count.index+1}" 
  platform_id = var.default_platform

  resources { 
    cores         = 2
    memory        = 1
    core_fraction = 5
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