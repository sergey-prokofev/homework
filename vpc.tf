resource "yandex_vpc_network" "network-1" {
  name = "network1"
}

resource "yandex_vpc_subnet" "public" {
  name           = "public"
  zone           = var.default_zone
  network_id     = "${yandex_vpc_network.network-1.id}"
  v4_cidr_blocks = ["192.168.10.0/24"]
}

resource "yandex_compute_instance" "nat-instance" {
  name        = "nat-instance"
  zone        = var.default_zone
  platform_id = "standard-v1"

  resources {
    memory = var.vms_resources.memory
    cores  = var.vms_resources.cores
    core_fraction = var.vms_resources.core_fraction
  }

  boot_disk {
    initialize_params {
      image_id = "fd80mrhj8fl2oe87o4e1"
    }
  }

  scheduling_policy {
    preemptible = true
  }

  network_interface {
    subnet_id  = yandex_vpc_subnet.public.id
    ip_address = "192.168.10.254"
    nat        = true 
  }

  metadata = {
    user-data = "${file("user-data.yml")}"
  }
}

resource "yandex_compute_instance" "vm-public" {
  name        = "public"
  zone        = var.default_zone
  platform_id = "standard-v1"

  resources {
    memory = var.vms_resources.memory
    cores  = var.vms_resources.cores
    core_fraction = var.vms_resources.core_fraction
  }

  boot_disk {
    initialize_params {
      image_id = var.default_image
    }
  }

  scheduling_policy {
    preemptible = true
  }

  network_interface {
    subnet_id  = yandex_vpc_subnet.public.id
    nat        = true 
  }

  metadata = {
    user-data = "${file("user-data.yml")}"
  }
}




resource "yandex_vpc_subnet" "private" {
  name           = "private"
  zone           = var.default_zone
  network_id     = "${yandex_vpc_network.network-1.id}"
  v4_cidr_blocks = ["192.168.20.0/24"]
  route_table_id = yandex_vpc_route_table.nat-route.id
}

resource "yandex_vpc_route_table" "nat-route" {
  network_id = yandex_vpc_network.network-1.id

  static_route {
    destination_prefix = "0.0.0.0/0"
    next_hop_address   = "192.168.10.254"
  }
}

resource "yandex_compute_instance" "vm-private" {
  name        = "private"
  zone        = var.default_zone
  platform_id = "standard-v1"

  resources {
    memory = var.vms_resources.memory
    cores  = var.vms_resources.cores
    core_fraction = var.vms_resources.core_fraction
  }

  boot_disk {
    initialize_params {
      image_id = var.default_image
    }
  }

  scheduling_policy {
    preemptible = true
  }

  network_interface {
    subnet_id  = yandex_vpc_subnet.private.id
  }

  metadata = {
    user-data = "${file("user-data.yml")}"
  }
}