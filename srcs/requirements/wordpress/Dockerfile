FROM	debian:bullseye

WORKDIR /wordpress/

RUN		apt-get update -y && apt-get upgrade -y && \
		apt-get install -y \
			curl \
			mariadb-client \
			php \
			php-fpm \
			php-mysql && \
		apt-get clean && \
		rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY	www.conf /etc/php/7.4/fpm/pool.d/www.conf

COPY	entrypoint.sh /usr/local/bin
RUN		chmod +x /usr/local/bin/entrypoint.sh

RUN		curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
		chmod +x wp-cli.phar && \
		mv wp-cli.phar /usr/local/bin/wp

EXPOSE 9000

WORKDIR /

ENTRYPOINT [ "bash", "/usr/local/bin/entrypoint.sh" ]
