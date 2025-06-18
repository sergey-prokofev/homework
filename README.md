# Домашнее задание к занятию "`Базовые объекты K8S`" - `Sergey Prokofev`

---

### Задание 1. Создать Pod с именем hello-world

1. Создать манифест (yaml-конфигурацию) Pod.
2. Использовать image - gcr.io/kubernetes-e2e-test-images/echoserver:2.2.
3. Подключиться локально к Pod с помощью `kubectl port-forward` и вывести значение (curl или в браузере).

![Задание-1](https://github.com/sergey-prokofev/homework/blob/kube-1.2/img/21.PNG)
![Задание-1](https://github.com/sergey-prokofev/homework/blob/kube-1.2/img/24.PNG)

[Pod](https://github.com/sergey-prokofev/homework/blob/kube-1.2/pod.yaml).

---

### Задание 2. Создать Service и подключить его к Pod

1. Создать Pod с именем netology-web.
2. Использовать image — gcr.io/kubernetes-e2e-test-images/echoserver:2.2.
3. Создать Service с именем netology-svc и подключить к netology-web.
4. Подключиться локально к Service с помощью `kubectl port-forward` и вывести значение (curl или в браузере).

![Задание-2](https://github.com/sergey-prokofev/homework/blob/kube-1.2/img/22.PNG)
![Задание-2](https://github.com/sergey-prokofev/homework/blob/kube-1.2/img/23.PNG)

[Service](https://github.com/sergey-prokofev/homework/blob/kube-1.2/service.yaml).
