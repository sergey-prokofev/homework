# Домашнее задание к занятию "`Безопасность в облачных провайдерах`" - `Sergey Prokofev`

---
## Задание 1. Yandex Cloud 


1. Создать бакет Object Storage и разместить в нём файл с картинкой:

 - Создать бакет в Object Storage с произвольным именем (например, _имя_студента_дата_).
 - Положить в бакет файл с картинкой.
 - Сделать файл доступным из интернета.

![Задание-1](https://github.com/sergey-prokofev/homework/blob/cloud-hw-02/img/5.PNG)
![Задание-1](https://github.com/sergey-prokofev/homework/blob/cloud-hw-02/img/7.PNG)
 

2. Создать группу ВМ в public подсети фиксированного размера с шаблоном LAMP и веб-страницей, содержащей ссылку на картинку из бакета:

 - Создать Instance Group с тремя ВМ и шаблоном LAMP. Для LAMP рекомендуется использовать `image_id = fd827b91d99psvq5fjit`.
 - Для создания стартовой веб-страницы рекомендуется использовать раздел `user_data` в [meta_data](https://cloud.yandex.ru/docs/compute/concepts/vm-metadata).
 - Разместить в стартовой веб-странице шаблонной ВМ ссылку на картинку из бакета.
 - Настроить проверку состояния ВМ.

![Задание-1](https://github.com/sergey-prokofev/homework/blob/cloud-hw-02/img/8.PNG)
![Задание-1](https://github.com/sergey-prokofev/homework/blob/cloud-hw-02/img/4.PNG)


3. Подключить группу к сетевому балансировщику:

 - Создать сетевой балансировщик.

![Задание-1](https://github.com/sergey-prokofev/homework/blob/cloud-hw-02/img/6.PNG)
![Задание-1](https://github.com/sergey-prokofev/homework/blob/cloud-hw-02/img/1.PNG)
![Задание-1](https://github.com/sergey-prokofev/homework/blob/cloud-hw-02/img/2.PNG)
![Задание-1](https://github.com/sergey-prokofev/homework/blob/cloud-hw-02/img/3.PNG)

 - Проверить работоспособность, удалив одну или несколько ВМ.

![Задание-1](https://github.com/sergey-prokofev/homework/blob/cloud-hw-02/img/9.PNG)
![Задание-1](https://github.com/sergey-prokofev/homework/blob/cloud-hw-02/img/10.PNG)
![Задание-1](https://github.com/sergey-prokofev/homework/blob/cloud-hw-02/img/11.PNG)
