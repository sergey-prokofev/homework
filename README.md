# Домашнее задание к занятию "`Оркестрация группой Docker контейнеров на примере Docker Compose`" - `Sergey Prokofev`

---

### Задание 1

`https://hub.docker.com/repository/docker/sergey282/my-nginx/general`

---

### Задание 2

![Задание-2](https://github.com/sergey-prokofev/homework/blob/virtd_03_docker/img/1.PNG)

---

### Задание 3

`3.контейнер остановился так как при помощи docker attach мы подключаетемся напрямую к основному процессу, а нажимаете Ctrl + C отправляет сигнал SIGINT основному процессу контейнера и он завершает свою работу, завершение этого процесса приводит к остановке контейнера`

`10.nginx слушает порт 81, а в контейнере мы сопоставили порт 80`

![Задание-3](https://github.com/sergey-prokofev/homework/blob/virtd_03_docker/img/2.PNG)
![Задание-3](https://github.com/sergey-prokofev/homework/blob/virtd_03_docker/img/3.PNG)
![Задание-3](https://github.com/sergey-prokofev/homework/blob/virtd_03_docker/img/4.PNG)
![Задание-3](https://github.com/sergey-prokofev/homework/blob/virtd_03_docker/img/5.PNG)

---

### Задание 4

![Задание-4](https://github.com/sergey-prokofev/homework/blob/virtd_03_docker/img/6.PNG)

---

### Задание 5


```
version: "3"
include:
  - docker-compose.yaml
services:
  portainer:
    network_mode: host
    image: portainer/portainer-ce:latest
    volumes:
      - /var/run/docker.sock:/var/run/docker.sock
```

![Задание-4](https://github.com/sergey-prokofev/homework/blob/virtd_03_docker/img/7.PNG)
![Задание-4](https://github.com/sergey-prokofev/homework/blob/virtd_03_docker/img/8.PNG)
![Задание-4](https://github.com/sergey-prokofev/homework/blob/virtd_03_docker/img/9.PNG)