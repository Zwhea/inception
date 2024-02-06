#---- base image ------------------------------------------------------#

FROM    debian:11

#---- dependencies & requirements -------------------------------------#

RUN     apt-get update -y && \
        apt-get upgrade -y && \
        apt-get install nginx -y

#---- webserver config ------------------------------------------------#

COPY    /conf/nginx.conf /usr/local/nginx/conf/

#---- TSL/SSL certification -------------------------------------------#

RUN     mkdir -p /etc/nginx/ssl && \
        apt-get install openssl -y && \
        openssl req -x509 -nodes                                 \
            -out /etc/nginx/ssl/inception.crt                    \
            -keyout /etc/nginx/ssl/inception.key                 \
            -subj "/C=FR/L=Lyon/CN=twang.42.fr"

#---- nginx  ----------------------------------------------------------#

RUN     mkdir -p /run/nginx

#---- allowed ports ---------------------------------------------------#

EXPOSE  443

#---- launch nginx ----------------------------------------------------#

ENTRYPOINT  ["nginx", "-g", "daemon off;"]
