# Создаем сервисный аккаунт для работы с balancer
resource "yandex_iam_service_account" "balancer-sa" {
  name        = "balancer-sa"
  description = "Сервисный аккаунт для управления balancer."
}

# Назначаем права сервисному аккаунту
resource "yandex_resourcemanager_folder_iam_member" "compute_editor_bl" {
  folder_id  = var.folder_id
  role       = "compute.editor"
  member     = "serviceAccount:${yandex_iam_service_account.balancer-sa.id}"
  depends_on = [yandex_iam_service_account.balancer-sa]
}

resource "yandex_resourcemanager_folder_iam_member" "loadbalancer_admin" {
  folder_id  = var.folder_id
  role       = "load-balancer.admin"
  member     = "serviceAccount:${yandex_iam_service_account.balancer-sa.id}"
  depends_on = [yandex_iam_service_account.balancer-sa]
}

resource "yandex_resourcemanager_folder_iam_member" "vpc_user_bl" {
  folder_id  = var.folder_id
  role       = "vpc.user"
  member     = "serviceAccount:${yandex_iam_service_account.balancer-sa.id}"
  depends_on = [yandex_iam_service_account.balancer-sa]
}

# Создаем целевую группу
resource "yandex_lb_target_group" "target-group-1" {
  name      = "target-group-1"
  depends_on = [
    yandex_compute_instance_group.ig-1,
    yandex_resourcemanager_folder_iam_member.compute_editor_bl,
    yandex_resourcemanager_folder_iam_member.loadbalancer_admin,
    yandex_resourcemanager_folder_iam_member.vpc_user_bl
  ]

  target {
    subnet_id = yandex_vpc_subnet.subnet-1.id
    address   = yandex_compute_instance_group.ig-1.instances[0].network_interface.0.ip_address
  }

  target {
    subnet_id = yandex_vpc_subnet.subnet-1.id
    address   = yandex_compute_instance_group.ig-1.instances[1].network_interface.0.ip_address
  }

  target {
    subnet_id = yandex_vpc_subnet.subnet-1.id
    address   = yandex_compute_instance_group.ig-1.instances[2].network_interface.0.ip_address
  }
}

# Создаем сетевой балансировщик
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
    target_group_id = yandex_lb_target_group.target-group-1.id

    healthcheck {
      name = "http"
      http_options {
        port = 80
        path = "/"
      }
    }
  }
}