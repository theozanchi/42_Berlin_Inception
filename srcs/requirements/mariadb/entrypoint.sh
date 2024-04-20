#! /usr/bin/bash

service mariadb start

while ! mysqladmin ping -h localhost --silent; do
	sleep 1
done

mariadb -u root -e "CREATE DATABASE IF NOT EXISTS \`${DB_NAME}\`;"

mariadb -u root -e "CREATE USER IF NOT EXISTS \`${USER_NAME}\`@'localhost' IDENTIFIED BY '$(cat ${MARIADB_PWD})';"

mariadb -u root -e "GRANT ALL PRIVILEGES ON \`${DB_NAME}\`.* TO \`${USER_NAME}\`@'%' IDENTIFIED BY '$(cat ${MARIADB_PWD})';"

mariadb -u root -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '$(cat ${MARIADB_ROOT_PWD})';"

mariadb -u root -p$(cat ${MARIADB_ROOT_PWD}) -e "FLUSH PRIVILEGES;"

echo "Finished configuration, now restarting the server..."

mysqladmin -u root -p$(cat ${MARIADB_ROOT_PWD}) shutdown

echo "Server restarted, now running in the background..."

exec mysqld_safe
