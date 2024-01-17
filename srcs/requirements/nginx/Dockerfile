#---- os -----------------------------------------------------------------------#
FROM		debian:bookworm

#---- installation basics ------------------------------------------------------#

RUN			apt update
RUN			apt install nginx -y
RUN			apt install vim -y
RUN			apt install curl -y

#---- certification TSL --------------------------------------------------------#

RUN			mkdir -p /etc/nginx/ssl
RUN			apt install openssl -y
RUN			openssl req -x509 -nodes												\
				-out /etc/nginx/ssl/inception.crt									\
				-keyout /etc/nginx/ssl/inception.key								\
				-subj "/C=FR/L=Lyon/O=42/CN=twang.42.fr/UID=twang"

#---- stockage config ----------------------------------------------------------#

RUN			mkdir -p /var/run/nginx
COPY		conf/nginx.conf /etc/nginx/nginx.conf

RUN			chmod 755 /var/www/html
RUN			chown -R www-data:www-data /var/www/html

#---- nginx container launch ---------------------------------------------------#

ENTRYPOINT	[ "nginx", "-g", "daemon off;" ]