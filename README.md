# Домашнее задание к занятию "`Teamcity`" - `Sergey Prokofev`


---

### Задание 1

1. `В Yandex Cloud создайте новый инстанс (4CPU4RAM) на основе образа jetbrains/teamcity-server.`
2. `Дождитесь запуска teamcity, выполните первоначальную настройку.`
3. `Создайте ещё один инстанс (2CPU4RAM) на основе образа jetbrains/teamcity-agent. Пропишите к нему переменную окружения SERVER_URL: "http://<teamcity_url>:8111".`
4. `Авторизуйте агент.`
5. `Сделайте fork репозитория.`
6. `Создайте VM (2CPU4RAM) и запустите playbook.`

![Задание-1](https://github.com/sergey-prokofev/homework/blob/teamcity/img/1.PNG)
![Задание-1](https://github.com/sergey-prokofev/homework/blob/teamcity/img/2.PNG)

---

1. `Создайте новый проект в teamcity на основе fork.`
2. `Сделайте autodetect конфигурации.`
3. `Сохраните необходимые шаги, запустите первую сборку master.`
![Задание-1](https://github.com/sergey-prokofev/homework/blob/teamcity/img/3.PNG)
4. `Поменяйте условия сборки: если сборка по ветке master, то должен происходит mvn clean deploy, иначе mvn clean test.`
![Задание-1](https://github.com/sergey-prokofev/homework/blob/teamcity/img/4.PNG)
![Задание-1](https://github.com/sergey-prokofev/homework/blob/teamcity/img/4.1.PNG)
5. `Для deploy будет необходимо загрузить settings.xml в набор конфигураций maven у teamcity, предварительно записав туда креды для подключения к nexus.`
![Задание-1](https://github.com/sergey-prokofev/homework/blob/teamcity/img/5.PNG)
6. `В pom.xml необходимо поменять ссылки на репозиторий и nexus.`
7. `Запустите сборку по master, убедитесь, что всё прошло успешно и артефакт появился в nexus.`
![Задание-1](https://github.com/sergey-prokofev/homework/blob/teamcity/img/6.PNG)
8. `Мигрируйте build configuration в репозиторий.`
![Задание-1](https://github.com/sergey-prokofev/homework/blob/teamcity/img/7.PNG)
9. `Создайте отдельную ветку feature/add_reply в репозитории.`
10. `Напишите новый метод для класса Welcomer: метод должен возвращать произвольную реплику, содержащую слово hunter.`
11. `Дополните тест для нового метода на поиск слова hunter в новой реплике.`
12. `Сделайте push всех изменений в новую ветку репозитория.`
13. `Убедитесь, что сборка самостоятельно запустилась, тесты прошли успешно.`
![Задание-1](https://github.com/sergey-prokofev/homework/blob/teamcity/img/8.PNG)
14. `Внесите изменения из произвольной ветки feature/add_reply в master через Merge.`
15. `Убедитесь, что нет собранного артефакта в сборке по ветке master.`
![Задание-1](https://github.com/sergey-prokofev/homework/blob/teamcity/img/9.PNG)
16. `Настройте конфигурацию так, чтобы она собирала .jar в артефакты сборки.`
17. `Проведите повторную сборку мастера, убедитесь, что сбора прошла успешно и артефакты собраны.`
![Задание-1](https://github.com/sergey-prokofev/homework/blob/teamcity/img/10.PNG)
18. `Проверьте, что конфигурация в репозитории содержит все настройки конфигурации из teamcity.`
![Задание-1](https://github.com/sergey-prokofev/homework/blob/teamcity/img/11.PNG)
18. `В ответе пришлите ссылку на репозиторий.`

[репозиторий](https://github.com/sergey-prokofev/example-teamcity.git).

