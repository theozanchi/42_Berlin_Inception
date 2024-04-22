#!/bin/sh

if [ ! -d /var/lib/mysql/$DB_NAME ]; then
	service mariadb start

	while ! mysqladmin ping -h localhost --silent; do
		sleep 1
	done

	mariadb -u root -e "CREATE DATABASE IF NOT EXISTS \`${DB_NAME}\`; \
						CREATE USER IF NOT EXISTS \`${DB_USER}\`@'localhost' IDENTIFIED BY '$(cat $DB_PWD)'; \
						GRANT ALL PRIVILEGES ON \`${DB_NAME}\`.* TO \`${USER_NAME}\`@'%' IDENTIFIED BY '$(cat $DB_PWD)'; \
						ALTER USER 'root'@'localhost' IDENTIFIED BY '$(cat $DB_ROOT_PWD)'; \
						FLUSH PRIVILEGES;"

	mysqladmin --user=root --password=$(cat ${DB_ROOT_PWD}) shutdown
fi

exec mysqld_safe
