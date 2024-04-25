FROM		debian:bullseye

WORKDIR		/mariadb/

RUN			apt-get update -y && apt-get upgrade -y && \
			apt-get install -y \
				iputils-ping \
				mariadb-server && \
			apt-get clean && \
			rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY		my.cnf /etc/.

COPY 		entrypoint.sh /usr/local/bin/.

RUN			chmod +x /usr/local/bin/entrypoint.sh

RUN			mkdir /run/mysqld

EXPOSE		3306

WORKDIR		/

ENTRYPOINT	[ "bash", "entrypoint.sh" ]
