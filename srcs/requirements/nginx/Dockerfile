FROM	debian:stable

WORKDIR	/nginx/

RUN		apt-get update && \
		apt-get upgrade && \
		apt-get install -y \
			nginx \
			openssl \
			procps && \
		apt-get clean && \
		rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY	. .

RUN		chmod +x entrypoint.sh

EXPOSE	443 9000

ENTRYPOINT [ "/nginx/entrypoint.sh" ]
