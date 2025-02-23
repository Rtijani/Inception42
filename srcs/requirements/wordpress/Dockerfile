FROM alpine:latest

# Install dependencies (including php, php-fpm, mariadb-client, wget, curl, and cgroup-lite)
RUN apk update && apk upgrade && \
    apk add php81 php81-fpm php81-bcmath php81-bz2 php81-calendar php81-cli php81-ctype \
            php81-curl php81-dom php81-exif php81-fileinfo php81-gd php81-gmp \
            php81-iconv php81-imap php81-intl php81-json php81-mbstring \
            php81-mysqli php81-mysqlnd php81-openssl php81-pcntl php81-pdo php81-pdo_mysql \
            php81-pdo_pgsql php81-pdo_sqlite php81-pgsql php81-phar php81-posix php81-session \
            php81-shmop php81-simplexml php81-soap php81-sockets php81-sodium php81-sqlite3 \
            php81-sysvsem php81-sysvshm php81-tokenizer php81-xml php81-xmlreader php81-xmlwriter \
            php81-xsl php81-zip php81-zlib mariadb-client wget curl cgroup-lite && \
    rm -rf /var/cache/apk/*

# Install wp-cli (using wget and moving to /usr/local/bin)
RUN wget https://raw.githubusercontent.com/wp-cli/wp-cli/main/bin/wp-cli.phar -O /usr/local/bin/wp-cli.phar && \
    chmod +x /usr/local/bin/wp-cli.phar

# Create WordPress directory
RUN mkdir -p /var/www/html

# Copy WordPress files (download and extract WordPress, not just copy)
RUN wget https://wordpress.org/latest.tar.gz -O wordpress.tar.gz && \
    tar -xzf wordpress.tar.gz && \
    mv wordpress/* /var/www/html/ && \
    rm wordpress.tar.gz && \
    chown -R www-data:www-data /var/www/html

# Copy configuration files
COPY setup_wordpress.sh /usr/local/bin/
COPY php.conf /usr/local/bin/
COPY www.conf /etc/php81/php-fpm.d/

# Set execute permissions
RUN chmod +x /usr/local/bin/setup_wordpress.sh
RUN chmod +x /usr/local/bin/php.conf

WORKDIR /var/www/html

# Expose port
EXPOSE 9000

# Set entrypoint
COPY docker-entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/docker-entrypoint.sh
ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]
