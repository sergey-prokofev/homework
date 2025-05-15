# Домашнее задание к занятию "`Работа с Playbook`" - `Sergey Prokofev`

1. * Необязательно. Изучите, что такое [ClickHouse](https://www.youtube.com/watch?v=fjTNS2zkeBs) и [Vector](https://www.youtube.com/watch?v=CgEhyffisLY).
2. Создайте свой публичный репозиторий на GitHub с произвольным именем или используйте старый.
3. Скачайте [Playbook](./playbook/) из репозитория с домашним заданием и перенесите его в свой репозиторий.
4. Подготовьте хосты в соответствии с группами из предподготовленного playbook.
```
docker run -d --name clickhouse-01 --hostname clickhouse centos:7 sleep infinity
docker run -d --name vector-01 --hostname vector centos:7 sleep infinity
```
---

### Задание 1

1. Подготовьте свой inventory-файл `prod.yml`.
2. Допишите playbook: нужно сделать ещё один play, который устанавливает и настраивает [vector](https://vector.dev). Конфигурация vector должна деплоиться через template файл jinja2. От вас не требуется использовать все возможности шаблонизатора, просто вставьте стандартный конфиг в template файл. Информация по шаблонам по [ссылке](https://www.dmosk.ru/instruktions.php?object=ansible-nginx-install). не забудьте сделать handler на перезапуск vector в случае изменения конфигурации!
3. При создании tasks рекомендую использовать модули: `get_url`, `template`, `unarchive`, `file`.
4. Tasks должны: скачать дистрибутив нужной версии, выполнить распаковку в выбранную директорию, установить vector.
5. Запустите `ansible-lint site.yml` и исправьте ошибки, если они есть.
![Задание-1](https://github.com/sergey-prokofev/homework/blob/ansible_02/img/21.PNG)
![Задание-1](https://github.com/sergey-prokofev/homework/blob/ansible_02/img/23.PNG)
6. Попробуйте запустить playbook на этом окружении с флагом `--check`.
![Задание-1](https://github.com/sergey-prokofev/homework/blob/ansible_02/img/24.PNG)
7. Запустите playbook на `prod.yml` окружении с флагом `--diff`. Убедитесь, что изменения на системе произведены.
![Задание-1](https://github.com/sergey-prokofev/homework/blob/ansible_02/img/25.PNG)
8. Повторно запустите playbook с флагом `--diff` и убедитесь, что playbook идемпотентен.
![Задание-1](https://github.com/sergey-prokofev/homework/blob/ansible_02/img/26.PNG)
9. Подготовьте README.md-файл по своему playbook. В нём должно быть описано: что делает playbook, какие у него есть параметры и теги. Пример качественной документации ansible playbook по [ссылке](https://github.com/opensearch-project/ansible-playbook). Так же приложите скриншоты выполнения заданий №5-8
https://github.com/sergey-prokofev/homework/blob/ansible_02/playbook/README.md
10. Готовый playbook выложите в свой репозиторий, поставьте тег `08-ansible-02-playbook` на фиксирующий коммит, в ответ предоставьте ссылку на него.