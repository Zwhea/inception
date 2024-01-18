# sleep 10

wp core download	--path=wordpress
cd wordpress
wp config create	--allow-root \
					--dbname=$MYSQL_DATABASE \
					--dbuser=$MYSQL_USER \
					--dbpass=$MYSQL_PASSWORD \
					--dbhost=mariadb:3306 \
					--path='wordpress'
wp db create
wp core install		--url=wordpress \
					--title="wordpress" \
					--admin_user=twang \
					--admin_password=twang \
					--admin_email=twang@student.42lyon.fr

wp plugin update	--all
