# Pause execution for 5 seconds
sleep 5

/usr/local/bin/wp-cli.phar core install --url="$WP_URL" \
    --title="$WP_TITLE" \
    --admin_user="$WP_ADMIN_USER" \
    --admin_password="$WP_ADMIN_PASSWORD" \
    --admin_email="$WP_ADMIN_EMAIL" \
    --skip-email \
    --path="$WP_PATH" \
    --allow-root

/usr/local/bin/wp-cli.phar user create "$WP_USER" "$WP_USER_EMAIL" \
    --user_pass="$WP_USER_PASSWORD" \
    --role="$WP_ROLE" \
    --path="$WP_PATH" \
    --allow-root
