#---- os ----------------------------------------------------------------------#

FROM		debian:bookworm

#---- installation basics -----------------------------------------------------#

RUN			apt-get update -y && \
			apt-get upgrade -y && \
			apt-get install wget -y && \
			apt-get install php8.2 -y \
			php-fpm \
			php-mysql \
			mariadb-client

#---- script config -----------------------------------------------------------#

COPY		conf/wordpress.conf /etc/wordpress/wordpress.conf
COPY		tools/script.sh /etc/wordpress/script.sh
RUN			chmod +x /etc/wordpress/script.sh
ENTRYPOINT	[ "sh", "/etc/wordpress/script.sh" ]
