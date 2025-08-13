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


variable "lamp_image" {
  type        = string
  default     = "lamp"
  description = "family name"
}

variable "vms_resources" {
  type       = object({
    cores    = number
    memory   = number
    core_fraction = number
  })
  description = "resources"
}