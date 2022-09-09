FROM richarvey/nginx-php-fpm:1.9.1
ADD src/ /var/www/html/
ADD scripts/start.sh /start.sh
RUN chmod 755 /start.sh

EXPOSE 443 80

WORKDIR "/var/www/html"
CMD ["/start.sh"]
