#---- base image ------------------------------------------------------#

FROM    debian:11

#---- env variables ---------------------------------------------------#

ARG     MYSQL_DATABASE
ARG     MYSQL_USER
ARG     MYSQL_PASSWORD
ARG     MYSQL_ROOT_PASSWORD

# RUN     export MYSQL_DATABASE=MYSQL_DATABASE && \
#         export MYSQL_USER=MYSQL_USER && \
#         export MYSQL_PASSWORD=MYSQL_PASSWORD && \
#         export MYSQL_ROOT_PASSWORD=MYSQL_ROOT_PASSWORD


#---- dependencies & requirements -------------------------------------#

RUN     apt-get update -y && \
        apt-get upgrade -y && \
        apt-get install mariadb-server -y

#---- database config -------------------------------------------------#

COPY    conf/mariadb.conf /etc/mysql/mariadb.conf.d/50-server.cnf
# COPY    tools/script.sh /etc/mysql/script.sh

#---- ports -----------------------------------------------------------#

EXPOSE  3306

#---- launch ----------------------------------------------------------#

RUN     service mariadb start && \
        mysql -u root -e "CREATE DATABASE IF NOT EXISTS ${MYSQL_DATABASE}; \
        CREATE USER IF NOT EXISTS ${MYSQL_USER}@'localhost' IDENTIFIED BY '${MYSQL_PASSWORD}'; \
        GRANT ALL PRIVILEGES ON ${MYSQL_DATABASE}.* TO ${MYSQL_USER}@'%' IDENTIFIED BY '${MYSQL_PASSWORD}'; \
        ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}'; \
        FLUSH PRIVILEGES;" && \
        mysqladmin -u root -p$MYSQL_ROOT_PASSWORD shutdown

CMD     ["mysqld_safe"];

# ENTRYPOINT  ["sh", "etc/mysql/script.sh"]
