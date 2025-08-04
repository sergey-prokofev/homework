# Домашнее задание к занятию "`Хранение в K8s. Часть 2`" - `Sergey Prokofev`

---

### Задание 1

Создать Deployment приложения, использующего локальный PV, созданный вручную.

1. Создать Deployment приложения, состоящего из контейнеров busybox и multitool.
2. Создать PV и PVC для подключения папки на локальной ноде, которая будет использована в поде.
3. Продемонстрировать, что multitool может читать файл, в который busybox пишет каждые пять секунд в общей директории. 
![Задание-1](https://github.com/sergey-prokofev/homework/blob/kube-2.2/img/1.PNG)
4. Удалить Deployment и PVC. Продемонстрировать, что после этого произошло с PV. Пояснить, почему.
![Задание-1](https://github.com/sergey-prokofev/homework/blob/kube-2.2/img/2.PNG)
`PV продолжает существовать, данные сохранились. Потому что PV не зависит ни от pod ни от PVC`
5. Продемонстрировать, что файл сохранился на локальном диске ноды. Удалить PV.  Продемонстрировать что произошло с файлом после удаления PV. Пояснить, почему.
![Задание-1](https://github.com/sergey-prokofev/homework/blob/kube-2.2/img/3.PNG)
`файл не был удален так как ReclaimPolicy не была задан явно то в этом случае она Retain`
5. Предоставить манифесты, а также скриншоты или вывод необходимых команд.

[Deployment](https://github.com/sergey-prokofev/homework/blob/kube-2.2/deployment.yaml).

[pvc](https://github.com/sergey-prokofev/homework/blob/kube-2.2/pvc.yaml).

[pv](https://github.com/sergey-prokofev/homework/blob/kube-2.2/pv.yaml).

---

### Задание 2

Создать Deployment приложения, которое может хранить файлы на NFS с динамическим созданием PV.

1. Включить и настроить NFS-сервер на MicroK8S.
2. Создать Deployment приложения состоящего из multitool, и подключить к нему PV, созданный автоматически на сервере NFS.
![Задание-1](https://github.com/sergey-prokofev/homework/blob/kube-2.2/img/4.PNG)
3. Продемонстрировать возможность чтения и записи файла изнутри пода. 
![Задание-1](https://github.com/sergey-prokofev/homework/blob/kube-2.2/img/5.PNG)
4. Предоставить манифесты, а также скриншоты или вывод необходимых команд.

[Deployment](https://github.com/sergey-prokofev/homework/blob/kube-2.2/deployment_2.yaml).

[pvc](https://github.com/sergey-prokofev/homework/blob/kube-2.2/pvc_2.yaml).