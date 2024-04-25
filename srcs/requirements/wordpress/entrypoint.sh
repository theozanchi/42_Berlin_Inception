#!/bin/bash

cd /var/www/html

if [ ! -d "wp-admin" ]; then
	wp core download --allow-root
else
	echo "WordPress is already installed."
fi

while ! mysqladmin ping --host=$DB_HOST --silent; do
	echo "$(date +%d%m%y\ %H:%M:%S) Waiting for database connection..."
	sleep 5
done

if [ ! -e "/var/www/html/wp-config.php" ]; then
	wp config create \
		--dbname=$DB_NAME \
		--dbuser=$DB_USER \
		--dbpass=$(cat $DB_PWD) \
		--dbhost=$DB_HOST \
		--allow-root
	wp core install \
		--title=$SITE_TITLE \
		--url=$SERVER_NAME \
		--admin_user=$WP_ADMIN \
		--admin_email=$WP_ADMIN_EMAIL \
		--admin_password=$(cat $WP_ADMIN_PWD) \
		--allow-root
	
	wp user create $WP_USER $WP_USER_EMAIL \
		--user_pass=$(cat $WP_USER_PWD) \
		--role=editor \
		--allow-root
else
	echo "WordPress is already configured."
fi

if [ ! -d /run/php ]; then
	mkdir /run/php
fi

/usr/sbin/php-fpm7.4 -F
