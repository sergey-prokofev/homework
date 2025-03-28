# Домашнее задание к занятию "`Практическое применение Docker`" - `Sergey Prokofev`

---

### Задание 1

---

### Задание 2

---

### Задание 3

![Задание-3](https://github.com/sergey-prokofev/homework/blob/virtd_04_docker/img/1.PNG)

---

### Задание 4

`https://github.com/sergey-prokofev/shvirtd-example-python.git`


```
#!/bin/bash

REPO_URL="https://github.com/sergey-prokofev/shvirtd-example-python.git"
TARGET_DIR="/opt/my-project"
COMPOSE_FILE="compose.yaml"


echo "Клонируем репозиторий $REPO_URL в $TARGET_DIR..."

git clone "$REPO_URL" "$TARGET_DIR"

cd "$TARGET_DIR" || { echo "Не удалось перейти в $TARGET_DIR"; exit 1; }

echo "Запускаем проект..."
docker compose -f "$COMPOSE_FILE" up -d --build

echo "Готово! Проект запущен в $TARGET_DIR"
```

![Задание-4](https://github.com/sergey-prokofev/homework/blob/virtd_04_docker/img/2.PNG)

---

### Задание 5

---

### Задание 6

![Задание-6](https://github.com/sergey-prokofev/homework/blob/virtd_04_docker/img/3.PNG)
![Задание-6.1](https://github.com/sergey-prokofev/homework/blob/virtd_04_docker/img/4.PNG)