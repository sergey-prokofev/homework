
vms_resources = {
  web=({
    cores         = 2
    memory        = 1
    core_fraction = 5
  }),
  db=({
    cores         = 2
    memory        = 2
    core_fraction = 20
  })
}


meta = {
  serial-port-enable = 1
  ssh-keys           = "ubuntu:ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCMl12S/xuyqa8R44k2GQ6bfKaEQOV4jN+gSS2uApWrfTI6P62Z906WNO4LBORVLFsvUImp0XfkH/ywiIAWcahFJgKJydJPJyVpMT0BBnTbjHkv6vFGCo8G7jC4bM9i/oq3o3w2xHoOlheFvZ0bSnmhoow3FTSRCpeFJoOP3RaZNCD657G5SRUsLqdsRJ7vaIW6V2j8vKD7EGe3XM0Nm9FlE2DCyLfI4in6ENBdjBLL62EdUJHJ0+JtbPcGhrhQ99rZToObkRg758MACBYGY3YyCvvmY8te4wadRFa77J5TtLSJi9h59m4bqH40XsrA4KmT++MIUzpYHN9UvarGXicKSNskaP3kNmNo5JvbIkKNlenTvHrLMAMnPB/Gl8vNR5gXs6TmQPNm54zBuv9l7PtqutBs9vjfK9d9rCA/dzcWUa3Ty5Q+In7JHRfNKxB8C7L7frVv1fcILg8dfWAsIJsKN+6UJers+Q7bl5u0XvJoeJtreZOYm+toZGSOYwxFrYk= admin1@Debian12"
}