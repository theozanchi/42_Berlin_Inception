#! /usr/bin/bash

service mariadb start

# sleep infinity

mariadb -e "CREATE DATABASE IF NOT EXISTS \`${DB_NAME}\`;"

mariadb -e "CREATE USER IF NOT EXISTS \`${USER_NAME}\`@'localhost' IDENTIFIED BY '${MARIADB_PWD}';"

mariadb -e "GRANT ALL PRIVILEGES ON \`${DB_NAME}\`.* TO \`${USER_NAME}\`@'%' IDENTIFIED BY '${MARIADB_PWD}';"

mariadb -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MARIADB_ROOT_PWD}';"

mariadb -e "FLUSH PRIVILEGES;"

mysqladmin -u root -p${MARIADB_ROOT_PWD} shutdown

exec mysqld_safe
