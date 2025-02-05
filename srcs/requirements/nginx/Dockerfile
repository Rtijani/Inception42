# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: rtijani <rtijani@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2025/01/16 09:43:00 by rtijani           #+#    #+#              #
#    Updated: 2025/01/16 15:03:16 by rtijani          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:3.20.0

RUN apk add --no-cache nginx openssl

RUN mkdir -p /etc/nginx/ssl

ENV CERTS_KEY /etc/nginx/ssl/certificate.key
ENV CERTS_CRT /etc/nginx/ssl/certificate.crt
 
COPY nginx_install.sh /usr/local/bin/nginx_install.sh

COPY ./conf/nginx.conf /etc/nginx/nginx.conf

RUN chmod +x /usr/local/bin/nginx_install.sh

EXPOSE 443

ENTRYPOINT ["/usr/local/bin/nginx_install.sh"] 
