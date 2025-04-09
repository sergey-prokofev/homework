variable "vm_web_image" {
  type        = string
  default     = "ubuntu-2004-lts"
  description = "family name"
}

variable "vm_web_name" {
  type        = string
  default     = "netology-develop-platform-web"
  description = "name for yandex_compute_instance"
}

variable "vm_web_platform" {
  type        = string
  default     = "standard-v1"
  description = "platform_id"
}



variable "vm_db_name" {
  type        = string
  default     = "netology-develop-platform-db"
  description = "name for yandex_compute_instance"
}

variable "vm_db_platform" {
  type        = string
  default     = "standard-v1"
  description = "platform_id"
}