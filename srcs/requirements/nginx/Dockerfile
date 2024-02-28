FROM	debian:bullseye

WORKDIR	/nginx/

RUN		apt-get update && \
		apt-get upgrade -y && \
		apt-get install -y \
			nginx \
			openssl && \
		apt-get clean && \
		rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY	nginx.conf .
COPY	entrypoint.sh /usr/local/bin
COPY	content/index.html /var/www/html

RUN		chmod +x /usr/local/bin/entrypoint.sh

EXPOSE	80

WORKDIR	/

ENTRYPOINT [ "bash", "/usr/local/bin/entrypoint.sh" ]
