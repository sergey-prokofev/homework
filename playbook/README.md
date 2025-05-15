# что делает playbook

Устанавливает на control node Clickhouse и Vector.

# group vars

`Для Clickhouse:`
1. clickhouse_version: "22.3.3.44"
2. clickhouse_packages:
     - clickhouse-client
     - clickhouse-server
     - clickhouse-common-static

`Для Vector:`
1. vector_version: "0.28.1" 
2. vector_config_dir: "/etc/vector" 
3. vector_config_file: "vector.toml"


