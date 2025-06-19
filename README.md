# Домашнее задание к занятию "`Запуск приложений в K8S`" - `Sergey Prokofev`

---

### Задание 1. Создать Deployment и обеспечить доступ к репликам приложения из другого Pod

1. Создать Deployment приложения, состоящего из двух контейнеров — nginx и multitool. Решить возникшую ошибку.
2. После запуска увеличить количество реплик работающего приложения до 2.
3. Продемонстрировать количество подов до и после масштабирования.

![Задание-1](https://github.com/sergey-prokofev/homework/blob/kube-1.3/img/21.PNG)

4. Создать Service, который обеспечит доступ до реплик приложений из п.1.
5. Создать отдельный Pod с приложением multitool и убедиться с помощью `curl`, что из пода есть доступ до приложений из п.1.

![Задание-1](https://github.com/sergey-prokofev/homework/blob/kube-1.3/img/22.PNG)



[Deployment](https://github.com/sergey-prokofev/homework/blob/kube-1.3/deployment.yaml).
[Service](https://github.com/sergey-prokofev/homework/blob/kube-1.3/service.yaml).
[Pod](https://github.com/sergey-prokofev/homework/blob/kube-1.3/pod.yaml).

---

### Задание 2. Создать Deployment и обеспечить старт основного контейнера при выполнении условий

1. Создать Deployment приложения nginx и обеспечить старт контейнера только после того, как будет запущен сервис этого приложения.
2. Убедиться, что nginx не стартует. В качестве Init-контейнера взять busybox.

![Задание-2](https://github.com/sergey-prokofev/homework/blob/kube-1.3/img/23.PNG)
![Задание-2](https://github.com/sergey-prokofev/homework/blob/kube-1.3/img/24.PNG)

3. Создать и запустить Service. Убедиться, что Init запустился.

![Задание-2](https://github.com/sergey-prokofev/homework/blob/kube-1.3/img/25.PNG)
![Задание-2](https://github.com/sergey-prokofev/homework/blob/kube-1.3/img/26.PNG)

4. Продемонстрировать состояние пода до и после запуска сервиса.



[Deployment](https://github.com/sergey-prokofev/homework/blob/kube-1.3/deployment_2.yaml).
[Service](https://github.com/sergey-prokofev/homework/blob/kube-1.3/service_2.yaml).
