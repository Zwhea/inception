#---- base image ------------------------------------------------------#

FROM    debian:11

#---- variables -------------------------------------------------------#

ARG     DOMAIN_NAME

RUN     export DOMAIN_NAME=DOMAIN_NAME

#---- dependencies & requirements -------------------------------------#

RUN     apt-get update -y && \
        apt-get upgrade -y && \
        apt-get install nginx -y

#---- webserver config ------------------------------------------------#

COPY    /conf/nginx.conf /etc/nginx/

#---- TSL/SSL certification -------------------------------------------#

RUN     mkdir -p /etc/nginx/ssl && \
        apt-get install openssl -y && \
        openssl req -x509 -nodes                                 \
            -out /etc/nginx/ssl/inception.crt                    \
            -keyout /etc/nginx/ssl/inception.key                 \
            -subj "/C=FR/L=Lyon/CN=twang.42.fr"

#---- nginx  ----------------------------------------------------------#

RUN     mkdir -p /var/run/nginx
RUN     chmod 755 /var/www/html
RUN     chown -R www-data:www-data /var/www/html
RUN     export DOMAIN_NAME=$DOMAIN_NAME

#---- allowed ports ---------------------------------------------------#

# EXPOSE  80
EXPOSE  443

#---- launch nginx ----------------------------------------------------#

ENTRYPOINT  ["nginx", "-g", "daemon off;"]
