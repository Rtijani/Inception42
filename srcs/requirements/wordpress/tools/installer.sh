#!/bin/bash

wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp

chmod 755 /var/www/html
chmod 755 /var/www/

cd /var/www/html

export MYSQL_DATABASE
export MYSQL_USER
export MYSQL_PASS
export WP_DB_HOST
export REDIS_HOST
export REDIS_PORT
export DOMAIN_NAME
export WP_ADMIN_USER
export WP_ADMIN_PASS
export WP_ADMIN_EMAIL
export WP_USER
export WP_EMAIL
export WP_PASS

su www-data -s /bin/bash -c "
    cd /var/www/html
    wp core download
    wp core config --dbname=$MYSQL_DATABASE --dbuser=$MYSQL_USER --dbpass=$MYSQL_PASS --dbhost=$WP_DB_HOST
    wp config set WP_REDIS_HOST $REDIS_HOST
    wp config set WP_REDIS_PORT $REDIS_PORT
    wp core install --url=$DOMAIN_NAME --title=$myinception --admin_user=$WP_ADMIN_USER --admin_password=$WP_ADMIN_PASS --admin_email=$WP_ADMIN_EMAIL
    wp user create $WP_USER $WP_EMAIL --role=author --user_pass=$WP_PASS
    wp plugin install redis-cache --activate
    wp redis enable
"

exec php-fpm7.4 -F
