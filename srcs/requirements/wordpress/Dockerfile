#---- os --------------------------------------------------------------#

FROM    debian:11

#---- installation basics ---------------------------------------------#

RUN         apt-get update -y && \
            apt-get upgrade -y && \
            apt-get install wget -y && \
            apt-get install -y \
            php-fpm \
            php-mysql \
            mariadb-client

RUN         wget    https://github.com/wp-cli/wp-cli-bundle/releases/download/v2.7.0/wp-cli-2.7.0.phar && \
            chmod   +x wp-cli-2.7.0.phar && \
            mv      wp-cli-2.7.0.phar /usr/local/bin/wp

#---- script config ---------------------------------------------------#

COPY        conf/wordpress.conf /etc/php/7.4/fpm/pool.d/www.conf
COPY        tools/script.sh /usr/local/bin/script.sh

#---- wordpress launch ------------------------------------------------#

ENTRYPOINT  [ "bash", "/usr/local/bin/script.sh" ]
