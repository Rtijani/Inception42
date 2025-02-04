# Pause execution for 5 seconds
sleep 5

/usr/local/bin/wp-cli.phar core install --url="$WP_URL" \
    --title="$WP_TITLE" \
    --admin_user="$WP_ADMIN_USER" \
    --admin_password="$WP_ADMIN_PASSWORD" \
    --admin_email="$WP_ADMIN_EMAIL" \
    --skip-email \
    --path="$WP_PATH" \ # Use the variable
    --allow-root

/usr/local/bin/wp-cli.phar user create "$WP_USER" "$WP_USER_EMAIL" \
    --user_pass="$WP_USER_PASSWORD" \
    --role="$WP_ROLE" \
    --path="$WP_PATH" \ # Use the variable
    --allow-root


#service php7.4-fpm start
#service php7.4-fpm stop
/usr/sbin/php-fpm7.4 -F

#--url="$WP_URL": Sets the WordPress site URL.
#--title="$WP_TITLE": Sets the site title.
#--admin_user="$WP_ADMIN_USER": Sets the admin username.
#--admin_password="$WP_ADMIN_PASSWORD": Sets the admin password.
#--admin_email="$WP_ADMIN_EMAIL": Sets the admin email.
#--skip-email: Skips sending email notifications during installation.
#--path='/var/www/wordpress': Specifies the installation directory path.
#--allow-root: Allows running WP-CLI commands as the root user.

#"$WP_USER": User's login (username).
#"$WP_USER_EMAIL": User's email address.
#--user_pass="$WP_USER_PASSWORD": User's password.
#--role="$WP_ROLE": Sets the user role to "author."
#--path='/var/www/wordpress': Specifies the installation directory path.
#--allow-root: Allows running WP-CLI commands as the root user.