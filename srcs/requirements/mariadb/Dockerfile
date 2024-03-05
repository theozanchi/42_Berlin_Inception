FROM		debian:bullseye

WORKDIR		/mariadb/

RUN			apt-get update -y && apt-get upgrade -y && \
			apt-get install -y \
				mariadb-server && \
			apt-get clean && \
			rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY		entrypoint.sh /usr/local/bin

RUN			chmod +x /usr/local/bin/entrypoint.sh

EXPOSE		3306

WORKDIR		/

ENTRYPOINT	[ "bash", "/usr/local/bin/entrypoint.sh" ]
