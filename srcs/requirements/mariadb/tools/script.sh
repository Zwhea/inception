
service mariadb start

mysql -u root -p$ROOT_PASSWORD -e "CREATE DATABASE IF NOT EXISTS ${DATABASE}; \
            CREATE USER IF NOT EXISTS ${ADMIN_USER}@'localhost' IDENTIFIED BY '${ADMIN_PASSWORD}'; \
            GRANT ALL PRIVILEGES ON ${DATABASE}.* TO ${ADMIN_USER}@'%' IDENTIFIED BY '${ADMIN_PASSWORD}'; \
            ALTER USER 'root'@'localhost' IDENTIFIED BY '${ROOT_PASSWORD}'; \
            FLUSH PRIVILEGES;"

mysqladmin -u root -p$ROOT_PASSWORD shutdown

exec mysqld_safe