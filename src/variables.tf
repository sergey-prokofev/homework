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
  description = "VPC network & subnet name"
}

variable "vpc_db" {
  type        = string
  default     = "db"
  description = "VPC network & subnet name"
}

###ssh vars
/*
variable "vms_ssh_root_key" {
  type        = string
  default     = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCMl12S/xuyqa8R44k2GQ6bfKaEQOV4jN+gSS2uApWrfTI6P62Z906WNO4LBORVLFsvUImp0XfkH/ywiIAWcahFJgKJydJPJyVpMT0BBnTbjHkv6vFGCo8G7jC4bM9i/oq3o3w2xHoOlheFvZ0bSnmhoow3FTSRCpeFJoOP3RaZNCD657G5SRUsLqdsRJ7vaIW6V2j8vKD7EGe3XM0Nm9FlE2DCyLfI4in6ENBdjBLL62EdUJHJ0+JtbPcGhrhQ99rZToObkRg758MACBYGY3YyCvvmY8te4wadRFa77J5TtLSJi9h59m4bqH40XsrA4KmT++MIUzpYHN9UvarGXicKSNskaP3kNmNo5JvbIkKNlenTvHrLMAMnPB/Gl8vNR5gXs6TmQPNm54zBuv9l7PtqutBs9vjfK9d9rCA/dzcWUa3Ty5Q+In7JHRfNKxB8C7L7frVv1fcILg8dfWAsIJsKN+6UJers+Q7bl5u0XvJoeJtreZOYm+toZGSOYwxFrYk= admin1@Debian12"
  description = "ssh-keygen -t ed25519"
}
*/
variable "project" {
  type        = string
  default     = "netology"
  description = "project name"
}


variable "vms_resources" {
  type       = map(object({
    cores    = number
    memory   = number
    core_fraction = number
  }))
  description = "resources"
}

variable "meta" {
  type        = object({
    serial-port-enable    = number
    ssh-keys   = string
  })
  description = "metadata"
}