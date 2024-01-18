#---- os -----------------------------------------------------------------------#

FROM		debian:bookworm

#---- installation basics ------------------------------------------------------#

RUN			apt-get update -y && \
			apt-get upgrade -y && \
			apt-get install mariadb-server -y

#---- stockage config ----------------------------------------------------------#

COPY		conf/mariadb.conf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY		tools/script.sh /etc/mysql/script.sh

#---- script config ------------------------------------------------------------#

RUN			chmod +x /etc/mysql/script.sh
ENTRYPOINT	[ "sh", "etc/mysql/script.sh" ]
