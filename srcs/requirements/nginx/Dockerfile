FROM	debian:bullseye

WORKDIR	/nginx/

RUN		apt-get update -y && apt-get upgrade -y && \
		apt-get install -y \
			nginx \
			openssl && \
		apt-get clean && \
		rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY	nginx.conf /etc/nginx/conf.d/server.conf

RUN		openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
			-keyout /etc/ssl/private/nginx-selfsigned.key \
			-out /etc/ssl/certs/nginx-selfsigned.crt \
			-subj "/C=DE/\
					ST=Berlin/\
					L=Berlin/\
					O=42_Berlin/\
					OU=Student/\
					CN=tzanchi/\
					emailAddress=tzanchi@student.42berlin.de"

EXPOSE	443

WORKDIR	/

CMD [ "nginx", "-g", "daemon off;" ]
