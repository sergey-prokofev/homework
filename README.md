# Домашнее задание к занятию "`Сетевое взаимодействие в K8S. Часть 2`" - `Sergey Prokofev`

---


### Задание 1. Создать Deployment приложений backend и frontend

1. Создать Deployment приложения _frontend_ из образа nginx с количеством реплик 3 шт.
2. Создать Deployment приложения _backend_ из образа multitool. 
3. Добавить Service, которые обеспечат доступ к обоим приложениям внутри кластера. 
4. Продемонстрировать, что приложения видят друг друга с помощью Service.
![Задание-1](https://github.com/sergey-prokofev/homework/blob/kube-1.5/img/1.PNG)
![Задание-1](https://github.com/sergey-prokofev/homework/blob/kube-1.5/img/2.PNG)
5. Предоставить манифесты Deployment и Service в решении, а также скриншоты или вывод команды п.4.

[frontend](https://github.com/sergey-prokofev/homework/blob/kube-1.5/frontend.yaml).
[backend](https://github.com/sergey-prokofev/homework/blob/kube-1.5/backend.yaml).
[Service](https://github.com/sergey-prokofev/homework/blob/kube-1.5/service.yaml).
------

### Задание 2. Создать Ingress и обеспечить доступ к приложениям снаружи кластера

1. Включить Ingress-controller в MicroK8S.
2. Создать Ingress, обеспечивающий доступ снаружи по IP-адресу кластера MicroK8S так, чтобы при запросе только по адресу открывался _frontend_ а при добавлении /api - _backend_.
3. Продемонстрировать доступ с помощью браузера или `curl` с локального компьютера.
![Задание-2](https://github.com/sergey-prokofev/homework/blob/kube-1.5/img/3.PNG)
4. Предоставить манифесты и скриншоты или вывод команды п.2.

[Ingress](https://github.com/sergey-prokofev/homework/blob/kube-1.5/ingress.yaml).