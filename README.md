# Домашнее задание к занятию "`Название занятия`" - `Sergey Prokofev`

---

### Задание 1

4. `platform_id = "standart-v4" resources {    cores         = 1    memory        = 1    core_fraction = 5}" неверно указаны: standart вместо standard, колличество cores должно быть не менее 2`
6. `уменьшить стоимость`

![Задание-1](https://github.com/sergey-prokofev/homework/blob/terraform_02/img/1.PNG)
![Задание-1](https://github.com/sergey-prokofev/homework/blob/terraform_02/img/2.PNG)

---

### Задание 2

![Задание-2](https://github.com/sergey-prokofev/homework/blob/terraform_02/img/3.PNG)

---

### Задание 3

---

### Задание 4

![Задание-4](https://github.com/sergey-prokofev/homework/blob/terraform_02/img/4.PNG)

---

### Задание 5

```
locals {
    web = "${var.project}-${var.vpc_name}-platform-web"
    db = "${var.project}-${var.vpc_name}-platform-db"
}
```
---

### Задание 6
