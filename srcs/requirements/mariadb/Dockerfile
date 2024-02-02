#---- os ----------------------------------------------------------------------#

FROM        debian:bookworm

#---- installation basics -----------------------------------------------------#

RUN         apt-get update -y && \
            apt-get upgrade -y && \
            apt-get install mariadb-server -y

#---- stockage config ---------------------------------------------------------#

COPY        conf/mariadb.conf /etc/mysql/mariadb.conf.d/50-server.cnf

#---- script config -----------------------------------------------------------#

COPY        tools/script.sh /etc/mysql/script.sh
RUN         chmod +x /etc/mysql/script.sh

#---- container launch --------------------------------------------------------#

ENTRYPOINT  [ "sh", "etc/mysql/script.sh" ]
