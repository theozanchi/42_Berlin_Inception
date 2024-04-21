#!/bin/bash

service mariadb start

# Waiting for MariaDB to be ready before appying any modification
while ! mysqladmin ping -h localhost --silent; do
	sleep 1
done

# Configuring MariaDB
mariadb -e "CREATE DATABASE IF NOT EXISTS \`${DB_NAME}\`;"
mariadb -e "CREATE USER IF NOT EXISTS \`${USER_NAME}\`@'localhost' IDENTIFIED BY '$(cat ${MARIADB_PWD})';"
mariadb -e "GRANT ALL PRIVILEGES ON \`${DB_NAME}\`.* TO \`${USER_NAME}\`@'%' IDENTIFIED BY '$(cat ${MARIADB_PWD})';"
mariadb -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '$(cat ${MARIADB_ROOT_PWD})';"

# Forcing changes to be immediately applied
mariadb -u root -p$(cat ${MARIADB_ROOT_PWD}) -e "FLUSH PRIVILEGES;"

# Restarting MariaDB
mysqladmin -u root -p$(cat ${MARIADB_ROOT_PWD}) shutdown
exec mysqld_safe
