cd      /var/www/wordpress

if [ ! -f wp-config.php ]; then

    wp plugin update    --all

    wp core download    -path=/var/www/wordpress --allow-root

    wp config create    --allow-root \
                        --dbname=$MYSQL_DATABASE \
                        --dbuser=$MYSQL_USER \
                        --dbpass=$MYSQL_PASSWORD \
                        --dbhost=mariadb:3306 \

    wp core install     --allow-root \
                        --url=$DOMAIN_NAME \
                        --admin_user=$MYSQL_USER \
                        --admin_password=$MYSQL_PASSWORD

    wp user create      --allow-root \
                        $USER \
                        $USER_MAIL \
                        --user_pass=$PASSWORD

fi

mkdir -p /run/php
php-fpm7.4 -F
