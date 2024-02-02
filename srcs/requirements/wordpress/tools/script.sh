# sleep 10

mkdir -p /var/www/wordpress
wget https://github.com/wp-cli/wp-cli-bundle/releases/download/v2.7.0/wp-cli-2.7.0.phar
chmod +x wp-cli-2.7.0.phar
mv wp-cli-2.7.0.phar /usr/local/bin/wp

wp plugin update	--all
wp core download	--path=/var/www/wordpress
wp core install		--allow-root \
					--path=/var/www/wordpress \
					--url=$DOMAIN_NAME \
					--admin_user=$MYSQL_USER \
					--admin_password=$MYSQL_PASSWORD \

wp user create		--allow-root \
					--path=/var/www/wordpress \
					--dbname=$MYSQL_DATABASE \
					--dbuser=$MYSQL_USER \
					--dbpass=$MYSQL_PASSWORD \
					--dbhost=mariadb:3306 \


cp /etc/wordpress/wordpress.conf /etc/php/8.2/fpm/pool.d/www.conf
service php-fpm start
service php-fpm stop
php-fpm -F -R