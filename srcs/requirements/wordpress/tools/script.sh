if [ ! -f "/var/www/html/wp-config.php" ]; then

    wp core download    --path=/var/www/html \
                        --allow-root

    wp config create    --allow-root \
                        --dbname=$DATABASE \
                        --dbuser=$ADMIN_USER \
                        --dbpass=$ADMIN_PASSWORD \
                        --dbhost=mariadb:3306 \
                        --path=/var/www/html

    wp core install     --allow-root \
                        --url=$DOMAIN_NAME \
                        --admin_user=$ADMIN_USER \
                        --admin_password=$ADMIN_PASSWORD \
                        --admin_email=$ADMIN_MAIL \
                        --title=Inception \
                        --path=/var/www/html

    wp user create      $USER \
                        $USER_MAIL \
                        --user_pass=$PASSWORD \
                        --allow-root \
                        --path=/var/www/html

fi

mkdir -p /run/php
php-fpm7.4 -F
