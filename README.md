# Домашнее задание к занятию "`Сетевое взаимодействие в K8S. Часть 1`" - `Sergey Prokofev`

---

### Задание 1. Создать Deployment и обеспечить доступ к контейнерам приложения по разным портам из другого Pod внутри кластера

1. Создать Deployment приложения, состоящего из двух контейнеров (nginx и multitool), с количеством реплик 3 шт.
2. Создать Service, который обеспечит доступ внутри кластера до контейнеров приложения из п.1 по порту 9001 — nginx 80, по 9002 — multitool 8080.
3. Создать отдельный Pod с приложением multitool и убедиться с помощью `curl`, что из пода есть доступ до приложения из п.1 по разным портам в разные контейнеры.
![Задание-1](https://github.com/sergey-prokofev/homework/blob/kube-1.4/img/1.PNG)
![Задание-1](https://github.com/sergey-prokofev/homework/blob/kube-1.4/img/2.PNG)
4. Продемонстрировать доступ с помощью `curl` по доменному имени сервиса.
![Задание-1](https://github.com/sergey-prokofev/homework/blob/kube-1.4/img/3.PNG)
5. Предоставить манифесты Deployment и Service в решении, а также скриншоты или вывод команды п.4.

[Deployment](https://github.com/sergey-prokofev/homework/blob/kube-1.4/deployment.yaml).
[Service](https://github.com/sergey-prokofev/homework/blob/kube-1.4/service.yaml).
[Pod](https://github.com/sergey-prokofev/homework/blob/kube-1.4/pod.yaml).

---

### Задание 2. Создать Service и обеспечить доступ к приложениям снаружи кластера

1. Создать отдельный Service приложения из Задания 1 с возможностью доступа снаружи кластера к nginx, используя тип NodePort.
2. Продемонстрировать доступ с помощью браузера или `curl` с локального компьютера.
![Задание-1](https://github.com/sergey-prokofev/homework/blob/kube-1.4/img/4.PNG)
3. Предоставить манифест и Service в решении, а также скриншоты или вывод команды п.2.

[Service](https://github.com/sergey-prokofev/homework/blob/kube-1.4/serviceNodePort.yaml).
