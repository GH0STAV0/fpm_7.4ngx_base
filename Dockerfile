FROM richarvey/nginx-php-fpm:1.9.1
ADD src/ /var/www/html/
ADD scripts/start.sh /start.sh
RUN chmod 755 /start.sh

RUN apt-get install -y libc-client-dev libkrb5-dev && \
    set -eux; \
    PHP_OPENSSL=yes docker-php-ext-configure imap --with-kerberos --with-imap-ssl; \
    docker-php-ext-install imap 

EXPOSE 443 80

WORKDIR "/var/www/html"
CMD ["/start.sh"]
