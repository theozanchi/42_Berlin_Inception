#!/bin/bash

cd /var/www

wp core download --path=wordpress --allow-root

cd wordpress

if [ ! -e /var/www/wordpress/wp-config.php ]; then
	wp config create \
		--dbname=$DB_NAME \
		--dbuser=$DB_USER \
		--dbpass=$(cat $DB_PWD) \
		--dbhost=$DB_HOST \
		--allow-root
fi

wp core install \
	--url=$SERVER_NAME \
	--title=$SITE_TITLE \
	--admin_user=$WP_ADMIN \
	--admin_email=$WP_ADMIN_EMAIL \
	--admin_password=$(cat $WP_ADMIN_PWD) \
	--allow-root

wp user create $WP_USER $WP_USER_EMAIL \
	--user_pass=$(cat $WP_USER_PWD) \
	--role=editor \
	--allow-root

if [ ! -d /run/php ]; then
	mkdir /run/php
fi

/usr/sbin/php-fpm7.4 -F
