#---- os -----------------------------------------------------------------------#

FROM		debian:bookworm

#---- installation basics ------------------------------------------------------#

RUN			apt-get update -y && \
			apt-get upgrade -y && \
			apt-get install wget -y && \
			apt-get install php8.2 -y \
			php-fpm \
			php-mysql \
			mariadb-client

#---- wordpress config ---------------------------------------------------------#

RUN			wget https://github.com/wp-cli/wp-cli-bundle/releases/download/v2.7.0/wp-cli-2.7.0.phar
RUN			chmod +x wp-cli-2.7.0.phar
RUN			mv wp-cli-2.7.0.phar /usr/local/bin/wp

#---- script config ------------------------------------------------------------#

COPY		tools/script.sh /etc/wordpress/script.sh
RUN			chmod +x /etc/wordpress/script.sh
ENTRYPOINT	[ "sh", "etc/wordpress/script.sh" ]

#---- stockage config ----------------------------------------------------------#

COPY		conf/wordpress.conf /etc/php/8.2/fpm/pool.d/www.conf
