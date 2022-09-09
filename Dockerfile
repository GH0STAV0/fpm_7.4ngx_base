FROM richarvey/nginx-php-fpm:1.9.1
ADD src/ /var/www/html/
ADD scripts/start.sh /start.sh
RUN chmod 755 /start.sh
RUN apk upgrade --update \
  && apk add autoconf file g++ gcc binutils isl libatomic libc-dev musl-dev make re2c libstdc++ libgcc mpc1 mpfr3 gmp libgomp \
  imap-dev \
  busybox-suid \
  && docker-php-ext-configure imap --with-imap --with-imap-ssl \
  && docker-php-ext-install imap

# RUN apk update && apk add --no-cache libgd-dev libc-client-dev libkrb5-dev  libgd-dev && \
#     set -eux; \
#     PHP_OPENSSL=yes docker-php-ext-configure imap --with-kerberos --with-imap-ssl; \
#     docker-php-ext-install imap 

EXPOSE 443 80

WORKDIR "/var/www/html"
CMD ["/start.sh"]
