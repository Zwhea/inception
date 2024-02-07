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

RUN         wget https://fr.wordpress.org/wordpress-6.0-fr_FR.tar.gz -P /var/www && \
            cd /var/www && tar -xzf wordpress-6.0-fr_FR.tar.gz && rm wordpress-6.0-fr_FR.tar.gz && \
            chown -R root:root /var/www/wordpress && \
            wget    https://github.com/wp-cli/wp-cli-bundle/releases/download/v2.7.0/wp-cli-2.7.0.phar && \
            chmod   +x wp-cli-2.7.0.phar && \
            mv      wp-cli-2.7.0.phar /usr/local/bin/wp
RUN         mkdir -p /wordpress

#---- script config ---------------------------------------------------#

COPY        conf/wordpress.conf /etc/wordpress/wordpress.conf
COPY        --chmod=755 tools/script.sh /wordpress/script.sh

#---- wordpress launch ------------------------------------------------#

ENTRYPOINT  [ "/bin/bash", "/etc/wordpress/script.sh" ]
