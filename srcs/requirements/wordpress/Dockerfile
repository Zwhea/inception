#---- os --------------------------------------------------------------#

FROM		debian:11

#---- installation basics ---------------------------------------------#

RUN			apt-get update -y && \
			apt-get upgrade -y && \
			apt-get install wget -y && \
			apt-get install -y \
			php-fpm \
			php-mysql \
			mariadb-client

#---- script config ---------------------------------------------------#

COPY		conf/wordpress.conf /etc/wordpress/wordpress.conf
COPY		--chmod=755 tools/script.sh /etc/wordpress/script.sh

#---- wordpress launch ------------------------------------------------#

ENTRYPOINT	[ "sh", "/etc/wordpress/script.sh" ]
