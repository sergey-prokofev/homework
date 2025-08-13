# Создаем сервисный аккаунт для работы с ig
resource "yandex_iam_service_account" "ig-sa" {
  name        = "ig-sa"
  description = "Сервисный аккаунт для управления группой ВМ."
}

# Назначаем права сервисному аккаунту
resource "yandex_resourcemanager_folder_iam_member" "compute_editor" {
  folder_id  = var.folder_id
  role       = "compute.editor"
  member     = "serviceAccount:${yandex_iam_service_account.ig-sa.id}"
  depends_on = [yandex_iam_service_account.ig-sa]
}

resource "yandex_resourcemanager_folder_iam_member" "folder_viewer" {
  folder_id  = var.folder_id
  role       = "resource-manager.viewer"
  member     = "serviceAccount:${yandex_iam_service_account.ig-sa.id}"
  depends_on = [yandex_iam_service_account.ig-sa]
}

resource "yandex_resourcemanager_folder_iam_member" "vpc_user" {
  folder_id  = var.folder_id
  role       = "vpc.user"
  member     = "serviceAccount:${yandex_iam_service_account.ig-sa.id}"
  depends_on = [yandex_iam_service_account.ig-sa]
}

resource "yandex_resourcemanager_folder_iam_member" "iam_serviceAccounts_user" {
  folder_id  = var.folder_id
  role       = "iam.serviceAccounts.user"
  member     = "serviceAccount:${yandex_iam_service_account.ig-sa.id}"
  depends_on = [yandex_iam_service_account.ig-sa]
}

# образ LAMP
data "yandex_compute_image" "lamp" {
  family = var.lamp_image
}

# описание группы ВМ
resource "yandex_compute_instance_group" "ig-1" {
  name                = "my-ig"
  folder_id           = var.folder_id
  service_account_id  = "${yandex_iam_service_account.ig-sa.id}"
  deletion_protection = false
  depends_on = [
    yandex_resourcemanager_folder_iam_member.compute_editor,
    yandex_resourcemanager_folder_iam_member.folder_viewer,
    yandex_resourcemanager_folder_iam_member.vpc_user,
    yandex_resourcemanager_folder_iam_member.iam_serviceAccounts_user,
    yandex_iam_service_account.ig-sa,
    yandex_storage_object.example_image
  ]
    
  instance_template {
    platform_id = "standard-v1"
    resources {
      memory = var.vms_resources.memory
      cores  = var.vms_resources.cores
      core_fraction = var.vms_resources.core_fraction
    }

    boot_disk {
      mode = "READ_WRITE"
      initialize_params {
        image_id = data.yandex_compute_image.lamp.image_id
      }
    }

    scheduling_policy {
      preemptible = true
    }

    network_interface {
      network_id         = "${yandex_vpc_network.network-1.id}"
      subnet_ids         = ["${yandex_vpc_subnet.subnet-1.id}"]
      nat                = true
    }

    metadata = {
      user-data = "${file("user-data.yml")}"
    }
  }

  scale_policy {
    fixed_scale {
      size = 3
    }
  }

  allocation_policy {
    zones = ["ru-central1-a"]
  }

  deploy_policy {
    max_unavailable = 1
    max_expansion   = 0
  }

  health_check {
    interval = 30
    timeout  = 5
    http_options {
      path = "/index.html"
      port = 80
    }
  }
}

# Создаем vpc
resource "yandex_vpc_network" "network-1" {
  name = "network1"
}

# Создаем подсеть public
resource "yandex_vpc_subnet" "subnet-1" {
  name           = "public"
  zone           = "ru-central1-a"
  network_id     = "${yandex_vpc_network.network-1.id}"
  v4_cidr_blocks = ["192.168.10.0/24"]
}