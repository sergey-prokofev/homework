# Домашнее задание к занятию "`Helm`" - `Sergey Prokofev`

---

### Задание 1. Подготовить Helm-чарт для приложения

1. Необходимо упаковать приложение в чарт для деплоя в разные окружения. 
2. Каждый компонент приложения деплоится отдельным deployment’ом или statefulset’ом.
3. В переменных чарта измените образ приложения для изменения версии.

[prometheus](https://github.com/sergey-prokofev/homework/blob/kube-2.5/prometheus).

---

### Задание 2. Запустить две версии в разных неймспейсах

1. Подготовив чарт, необходимо его проверить. Запуститe несколько копий приложения.
2. Одну версию в namespace=app1, вторую версию в том же неймспейсе, третью версию в namespace=app2.
3. Продемонстрируйте результат.

![Задание-2](https://github.com/sergey-prokofev/homework/blob/kube-2.5/img/1.PNG)
![Задание-2](https://github.com/sergey-prokofev/homework/blob/kube-2.5/img/2.PNG)
![Задание-2](https://github.com/sergey-prokofev/homework/blob/kube-2.5/img/3.PNG)
![Задание-2](https://github.com/sergey-prokofev/homework/blob/kube-2.5/img/4.PNG)