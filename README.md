# Домашнее задание к занятию "`Индексы`" - `Sergey Prokofev`


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
SELECT table_schema, (SUM(index_length) / SUM(data_length) * 100) as percentage FROM INFORMATION_SCHEMA.TABLES WHERE table_schema = "sakila"
```
---

### Задание 2

```
EXPLAIN ANALYZE
select distinct concat(c.last_name, ' ', c.first_name), sum(p.amount) over (partition by c.customer_id, f.title)
from payment p, rental r, customer c, inventory i, film f
where date(p.payment_date) = '2005-07-30' and p.payment_date = r.rental_date and r.customer_id = c.customer_id and i.inventory_id = r.inventory_id

-> Table scan on <temporary>  (cost=2.5..2.5 rows=0) (actual time=10113..10113 rows=391 loops=1)
    -> Temporary table with deduplication  (cost=0..0 rows=0) (actual time=10113..10113 rows=391 loops=1)
        -> Window aggregate with buffering: sum(p.amount) OVER (PARTITION BY c.customer_id,f.title )   (actual time=4499..9719 rows=642000 loops=1)
            -> Sort: c.customer_id, f.title  (actual time=4499..4696 rows=642000 loops=1)
                -> Stream results  (cost=10.5e+6 rows=16.1e+6) (actual time=1.37..3397 rows=642000 loops=1)
                    -> Nested loop inner join  (cost=10.5e+6 rows=16.1e+6) (actual time=1.36..2871 rows=642000 loops=1)
                        -> Nested loop inner join  (cost=8.86e+6 rows=16.1e+6) (actual time=1.35..2601 rows=642000 loops=1)
                            -> Nested loop inner join  (cost=7.24e+6 rows=16.1e+6) (actual time=1.34..2214 rows=642000 loops=1)
                                -> Inner hash join (no condition)  (cost=1.61e+6 rows=16.1e+6) (actual time=1.33..88.6 rows=634000 loops=1)
                                    -> Filter: (cast(p.payment_date as date) = '2005-07-30')  (cost=1.68 rows=16086) (actual time=0.315..11.3 rows=634 loops=1)
                                        -> Table scan on p  (cost=1.68 rows=16086) (actual time=0.301..5.82 rows=16044 loops=1)
                                    -> Hash
                                        -> Covering index scan on f using idx_title  (cost=103 rows=1000) (actual time=0.0561..0.344 rows=1000 loops=1)
                                -> Covering index lookup on r using rental_date (rental_date = p.payment_date)  (cost=0.25 rows=1) (actual time=0.00227..0.00308 rows=1.01 loops=634000)
                            -> Single-row index lookup on c using PRIMARY (customer_id = r.customer_id)  (cost=250e-6 rows=1) (actual time=302e-6..335e-6 rows=1 loops=642000)
                        -> Single-row covering index lookup on i using PRIMARY (inventory_id = r.inventory_id)  (cost=250e-6 rows=1) (actual time=187e-6..221e-6 rows=1 loops=642000)
```

1. лишние запросы к таблицам (rental r, inventory i, film f), оконная функция, нет необходимостив во всех условиях

2. 

```
EXPLAIN ANALYZE                        
SELECT DISTINCT CONCAT(c.last_name, ' ', c.first_name), SUM(p.amount)     
FROM payment p
JOIN customer c ON c.customer_id = p.customer_id 
WHERE date(p.payment_date) = '2005-07-30'
GROUP BY p.customer_id;                


-> Sort with duplicate removal: `CONCAT(c.last_name, ' ', c.first_name)`, `SUM(p.amount)`  (actual time=34.6..34.7 rows=391 loops=1)
    -> Table scan on <temporary>  (actual time=34.3..34.4 rows=391 loops=1)
        -> Aggregate using temporary table  (actual time=34.3..34.3 rows=391 loops=1)
            -> Nested loop inner join  (cost=5691 rows=16086) (actual time=0.224..32.8 rows=634 loops=1)
                -> Table scan on c  (cost=61.2 rows=599) (actual time=0.0716..0.398 rows=599 loops=1)
                -> Filter: (cast(p.payment_date as date) = '2005-07-30')  (cost=6.72 rows=26.9) (actual time=0.0487..0.0536 rows=1.06 loops=599)
                    -> Index lookup on p using idx_fk_customer_id (customer_id = c.customer_id)  (cost=6.72 rows=26.9) (actual time=0.0436..0.0498 rows=26.8 loops=599) 
```