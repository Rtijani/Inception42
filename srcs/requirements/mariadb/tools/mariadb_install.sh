#!/bin/sh

# Use environment variables for sensitive information this is my init.sql
MYSQL_ROOT_PASSWORD="${MYSQL_ROOT_PASSWORD:-"default_root_password"}" 
MYSQL_DATABASE="${MYSQL_DATABASE:-"my_database"}" 
MYSQL_USER="${MYSQL_USER:-"my_user"}"
MYSQL_PASSWORD="${MYSQL_PASSWORD:-"my_password"}"

# Set the root password securely (using environment variable)
mariadb-admin -u root password "$MYSQL_ROOT_PASSWORD"

# Start the MySQL server in the background
mysqld &

sleep 5 

# Create the database and user (using mysql command-line client)
mysql -u root -p"$MYSQL_ROOT_PASSWORD" -e "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE;"
mysql -u root -p"$MYSQL_ROOT_PASSWORD" -e "CREATE USER IF NOT EXISTS '$MYSQL_USER'@'localhost' IDENTIFIED BY '$MYSQL_PASSWORD';"
mysql -u root -p"$MYSQL_ROOT_PASSWORD" -e "GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'localhost' IDENTIFIED BY '$MYSQL_PASSWORD';"
mysql -u root -p"$MYSQL_ROOT_PASSWORD" -e "FLUSH PRIVILEGES;"

# Stop the MySQL server gracefully 
mysqladmin -u root -p"$MYSQL_ROOT_PASSWORD" shutdown

echo "Database initialized successfully."
