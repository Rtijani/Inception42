# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: rtijani <rtijani@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2025/01/16 09:42:38 by rtijani           #+#    #+#              #
#    Updated: 2025/01/17 16:04:27 by rtijani          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:3.20.0

RUN	apt update && \
	apk add --no-cache mariadb mariadb-client mariadb-server-utils

RUN mkdir -p /var/lib/mysql


EXPOSE 3306

COPY conf/mariadb.conf /etc/mysql/mariadb.conf

COPY init.sql /docker-entrypoint-initdb.d/

VOLUME /var/lib/mysql

CMD ["mysqld"]