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

RUN	apk update && \
	apk add --no-cache mariadb-server mariadb-client
 
RUN chmod +x /etc/mariadb.conf.sh

EXPOSE 3306

COPY ./conf/mariadb.conf /etc/mysql/mariadb.conf

COPY init.sql /docker-entrypoint-initdb.d/init.sql

VOLUME /var/lib/mysql

CMD ["mysqld"]
