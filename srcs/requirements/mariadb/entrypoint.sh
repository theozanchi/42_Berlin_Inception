#!/bin/sh

# Create the SQL init script
echo "CREATE DATABASE IF NOT EXISTS \`${DB_NAME}\`;" > /etc/mysql/init.sql
echo "CREATE USER IF NOT EXISTS '${DB_USER}'@'%' IDENTIFIED BY '$(cat $DB_PWD)';" >> /etc/mysql/init.sql
echo "GRANT ALL PRIVILEGES ON \`${DB_NAME}\`.* TO '${DB_USER}'@'%' IDENTIFIED BY '$(cat $DB_PWD)';" >> /etc/mysql/init.sql
echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '$(cat $DB_ROOT_PWD)';" >> /etc/mysql/init.sql
echo "FLUSH PRIVILEGES;" >> /etc/mysql/init.sql

# Start the MariaDB server
exec mysqld_safe
