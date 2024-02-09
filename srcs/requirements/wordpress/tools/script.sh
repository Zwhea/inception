if [ ! -f "/var/www/html/wp-config.php" ]; then

    wp core download    --path=/var/www/html \
                        --allow-root

    wp config create    --allow-root \
                        --dbname=$MYSQL_DATABASE \
                        --dbuser=$MYSQL_USER \
                        --dbpass=$MYSQL_PASSWORD \
                        --dbhost=mariadb:3306 \
                        --path=/var/www/html

    wp core install     --allow-root \
                        --url=$DOMAIN_NAME \
                        --admin_user=$MYSQL_USER \
                        --admin_password=$MYSQL_PASSWORD \
                        --admin_email=$USER_MAIL \
                        --title=Inception \
                        --path=/var/www/html

    wp user create      $USER \
                        $USER_MAIL \
                        --allow-root \
                        --path=/var/www/html

fi

mkdir -p /run/php
php-fpm7.4 -F
