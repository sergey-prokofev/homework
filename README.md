# Домашнее задание к занятию "`SQL. Часть 1`" - `Sergey Prokofev`


### Инструкция по выполнению домашнего задания

   1. Сделайте `fork` данного репозитория к себе в Github и переименуйте его по названию или номеру занятия, например, https://github.com/имя-вашего-репозитория/git-hw или  https://github.com/имя-вашего-репозитория/7-1-ansible-hw).
   2. Выполните клонирование данного репозитория к себе на ПК с помощью команды `git clone`.
   3. Выполните домашнее задание и заполните у себя локально этот файл README.md:
      - впишите вверху название занятия и вашу фамилию и имя
      - в каждом задании добавьте решение в требуемом виде (текст/код/скриншоты/ссылка)
      - для корректного добавления скриншотов воспользуйтесь [инструкцией "Как вставить скриншот в шаблон с решением](https://github.com/netology-code/sys-pattern-homework/blob/main/screen-instruction.md)
      - при оформлении используйте возможности языка разметки md (коротко об этом можно посмотреть в [инструкции  по MarkDown](https://github.com/netology-code/sys-pattern-homework/blob/main/md-instruction.md))
   4. После завершения работы над домашним заданием сделайте коммит (`git commit -m "comment"`) и отправьте его на Github (`git push origin`);
   5. Для проверки домашнего задания преподавателем в личном кабинете прикрепите и отправьте ссылку на решение в виде md-файла в вашем Github.
   6. Любые вопросы по выполнению заданий спрашивайте в чате учебной группы и/или в разделе “Вопросы по заданию” в личном кабинете.
   
Желаем успехов в выполнении домашнего задания!
   
### Дополнительные материалы, которые могут быть полезны для выполнения задания

1. [Руководство по оформлению Markdown файлов](https://gist.github.com/Jekins/2bf2d0638163f1294637#Code)

---

### Задание 1

```
SELECT s.first_name, s.last_name, c.city, l.cn as n_customer FROM staff s 
JOIN store s2 ON s2.store_id = s.store_id
JOIN address a ON a.address_id = s.address_id
JOIN city c ON c.city_id = a.city_id
JOIN (SELECT COUNT(c.store_id) as cn, c.store_id as id FROM customer c GROUP BY c.store_id) as l ON s.store_id = l.id
WHERE s2.store_id = (SELECT c.store_id FROM customer c GROUP BY c.store_id HAVING COUNT(c.store_id)>300)
```
---

### Задание 2

```
SELECT COUNT(*) FROM film f 
WHERE f.length>(SELECT AVG(f.length) FROM film f);
```

---

### Задание 3

```
SELECT DATE_FORMAT(p.payment_date, '%Y %m'), COUNT(p.rental_id) 
FROM payment p
GROUP BY DATE_FORMAT(p.payment_date, '%Y %m')
ORDER BY SUM(p.amount) DESC
LIMIT 1;
```

---

### Задание 4

```
SELECT s.first_name, s.last_name, COUNT(p.staff_id), 
  CASE 
  	WHEN COUNT(p.staff_id)>8000 THEN 'Да'
  	ELSE 'Нет'
  END as 'Премия'
FROM payment p 
JOIN staff s ON s.staff_id = p.staff_id 
GROUP BY p.staff_id;
```
