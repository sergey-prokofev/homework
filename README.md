# Домашнее задание к занятию "`Хранение в K8s. Часть 1`" - `Sergey Prokofev`

---

### Задание 1 

Создать Deployment приложения, состоящего из двух контейнеров и обменивающихся данными.

1. Создать Deployment приложения, состоящего из контейнеров busybox и multitool.
2. Сделать так, чтобы busybox писал каждые пять секунд в некий файл в общей директории.
3. Обеспечить возможность чтения файла контейнером multitool.
4. Продемонстрировать, что multitool может читать файл, который периодоически обновляется.
![Задание-1](https://github.com/sergey-prokofev/homework/blob/kube-2.1/img/1.PNG)
5. Предоставить манифесты Deployment в решении, а также скриншоты или вывод команды из п. 4.

[Deployment](https://github.com/sergey-prokofev/homework/blob/kube-2.1/deployment.yaml).

---

### Задание 2

Создать DaemonSet приложения, которое может прочитать логи ноды.

1. Создать DaemonSet приложения, состоящего из multitool.
2. Обеспечить возможность чтения файла `/var/log/syslog` кластера MicroK8S.
3. Продемонстрировать возможность чтения файла изнутри пода.
![Задание-1](https://github.com/sergey-prokofev/homework/blob/kube-2.1/img/2e.PNG)
4. Предоставить манифесты Deployment, а также скриншоты или вывод команды из п. 2.

[Deployment](https://github.com/sergey-prokofev/homework/blob/kube-2.1/daemonset.yaml).