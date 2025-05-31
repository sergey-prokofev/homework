# что делает playbook

Устанавливает на control node  ClickHouse, Vector и LightHouse.

## Roles

Используются 3 роли:

1. clickhouse

```yaml
  - src: git@github.com:AlexeySetevoi/ansible-clickhouse.git
    scm: git
    version: "1.13"
    name: clickhouse
```

2. vector

```yaml
  - src: git@github.com:sergey-prokofev/vector-role.git
    scm: git
    version: "1.0.1"
    name: vector
```

3. lighthouse
   
```yaml
  - src: git@github.com:sergey-prokofev/lighthouse-role.git
    scm: git
    version: "1.0.1"
    name: lighthouse
