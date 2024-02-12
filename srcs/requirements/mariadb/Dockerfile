#---- base image ------------------------------------------------------#

FROM    debian:11

#---- env variables ---------------------------------------------------#

ARG     DATABASE
ARG     ADMIN_USER
ARG     ADMIN_PASSWORD
ARG     ROOT_PASSWORD

RUN     export DATABASE=DATABASE && \
        export ADMIN_USER=ADMIN_USER && \
        export ADMIN_PASSWORD=ADMIN_PASSWORD && \
        export ROOT_PASSWORD=ROOT_PASSWORD


#---- dependencies & requirements -------------------------------------#

RUN     apt-get update -y && \
        apt-get upgrade -y && \
        apt-get install mariadb-server -y

#---- database config -------------------------------------------------#

COPY    conf/mariadb.conf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY    tools/script.sh /etc/mysql/script.sh

#---- launch ----------------------------------------------------------#

ENTRYPOINT  ["sh", "etc/mysql/script.sh"]
