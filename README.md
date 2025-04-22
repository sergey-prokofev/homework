# Домашнее задание к занятию "`Жизненный цикл ПО`" - `Sergey Prokofev`


### Задание 1

1. `Получить бесплатную версию Jira - https://www.atlassian.com/ru/software/jira/work-management/free (скопируйте ссылку в адресную строку). Вы можете воспользоваться любым(в том числе бесплатным vpn сервисом) если сайт у вас недоступен. Кроме того вы можете скачать docker образ и запустить на своем хосте self-managed версию jira.`
2. `Настроить её для своей команды разработки.`
3. `Создать доски Kanban и Scrum.`
4. `Дополнительные инструкции от разработчика Jira.`

![Задание-2](https://github.com/sergey-prokofev/homework/blob/hw_jira/img/5.PNG)
![Задание-2](https://github.com/sergey-prokofev/homework/blob/hw_jira/img/6.PNG)

`Необходимо создать собственные workflow для двух типов задач: bug и остальные типы задач. Задачи типа bug должны проходить жизненный цикл:`
```
Open -> On reproduce.
On reproduce -> Open, Done reproduce.
Done reproduce -> On fix.
On fix -> On reproduce, Done fix.
Done fix -> On test.
On test -> On fix, Done.
Done -> Closed, Open.
Остальные задачи должны проходить по упрощённому workflow:
```
```
Open -> On develop.
On develop -> Open, Done develop.
Done develop -> On test.
On test -> On develop, Done.
Done -> Closed, Open.
Что нужно сделать
```


1. `Создайте задачу с типом bug, попытайтесь провести его по всему workflow до Done.`
![Задание-2](https://github.com/sergey-prokofev/homework/blob/hw_jira/img/1.PNG)
2. `Создайте задачу с типом epic, к ней привяжите несколько задач с типом task, проведите их по всему workflow до Done.`
![Задание-2](https://github.com/sergey-prokofev/homework/blob/hw_jira/img/2.PNG)
3. `При проведении обеих задач по статусам используйте kanban.`
4. `Верните задачи в статус Open.`
5. `Перейдите в Scrum, запланируйте новый спринт, состоящий из задач эпика и одного бага, стартуйте спринт, проведите задачи до состояния Closed. Закройте спринт.`
![Задание-2](https://github.com/sergey-prokofev/homework/blob/hw_jira/img/3.PNG)
![Задание-2](https://github.com/sergey-prokofev/homework/blob/hw_jira/img/4.PNG)
6. `Если всё отработалось в рамках ожидания — выгрузите схемы workflow для импорта в XML. Файлы с workflow и скриншоты workflow приложите к решению задания.`

