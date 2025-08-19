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

#--------------------------------------------------------------------------------------------


variable "default_image" {
  type        = string
  default     = "fd82lk1p3r06f11ng8hd"
  description = "ubuntu 20.04"
}

variable "vms_resources" {
  type       = object({
    cores    = number
    memory   = number
    core_fraction = number
  })
  description = "resources"
}