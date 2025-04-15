###cloud vars
variable "cloud_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}

variable "default_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}
variable "default_cidr" {
  type        = list(string)
  default     = ["10.0.1.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "vpc_name" {
  type        = string
  default     = "develop"
  description = "VPC network&subnet name"
}



variable "default_image" {
  type        = string
  default     = "ubuntu-2004-lts"
  description = "family name"
}

variable "default_platform" {
  type        = string
  default     = "standard-v1"
  description = "platform_id"
}

variable "default_disk_type" {
  type        = string
  default     = "network-hdd"
  description = "platform_id"
}

variable "each_vm" {
  type = list(object({vm_name=string, cpu=number, ram=number, disk_volume=number, core_fraction=number }))
  default = [
    {
      vm_name   = "main"
      cpu  = 2
      ram  = 4
      disk_volume = 20
      core_fraction = 5
    },
    {
      vm_name   = "replica"
      cpu  = 2
      ram  = 2
      disk_volume = 18
      core_fraction = 5
    }
  ]
}

variable "vms_resources" {
  type       = map(object({
    cores    = number
    memory   = number
    core_fraction = number
  }))
  description = "resources"
  default = {
  web=({
    cores         = 2
    memory        = 1
    core_fraction = 5
  }),
  storage=({
    cores         = 2
    memory        = 1
    core_fraction = 5
  })
}
}


variable "storage_name" {
  type        = string
  default     = "storage"
  description = "storage vm name"
}
