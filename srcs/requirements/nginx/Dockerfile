FROM	debian:stable

WORKDIR	/nginx/

RUN		apt-get update && \
		apt-get upgrade && \
		apt-get install -y \
			nginx \
			openssl && \
		apt-get clean && \
		rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY	. .

RUN		chmod +x entrypoint.sh

EXPOSE	8080

ENTRYPOINT [ "/nginx/entrypoint.sh" ]
