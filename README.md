# Домашнее задание к занятию "`Введение в Terraform`" - `Sergey Prokofev`


---

### Задание 1

![Задание-0](https://github.com/sergey-prokofev/homework/blob/terraform_01/img/1.PNG)

2. `personal.auto.tfvars`
3. `"result": "n4qmvb9AdZLJjYGP"`
4. `нет имени у ресурса "docker_image". Неверно имя ресурса "docker_container" "1nginx". random_password.random_string_FAKE.resulT ошибка в обращении к ресурсу`
5. ![Задание-5](https://github.com/sergey-prokofev/homework/blob/terraform_01/img/2.PNG)
6. `в чём может быть опасность применения ключа -auto-approve: сразу запуская код мы не имеем возможности ознакомится с выводом plan и отказаться от выполнения если есть ошибки (если сами изначально не запускали эту команду отдельно). Зачем может пригодиться данный ключ: для автоматизации процесса (например при написании скриптов которые будут автоматом разворачивать инфраструктуру)` ![Задание-6](https://github.com/sergey-prokofev/homework/blob/terraform_01/img/3.PNG)
7. 
```{
  "version": 4,
  "terraform_version": "1.9.3",
  "serial": 11,
  "lineage": "fcf758d2-1830-5ab5-bc1e-5f78c43ed754",
  "outputs": {},
  "resources": [],
  "check_results": null
}
```
8. `keep_locally = true` `keep_locally(Boolean) Если true, то образ Docker не будет удален при операции уничтожения. Если false, то образ будет удален из локального хранилища docker при операции уничтожения.`


```
Поле для вставки кода...
....
....
....
....
```

`При необходимости прикрепитe сюда скриншоты
![Название скриншота 1](ссылка на скриншот 1)`

