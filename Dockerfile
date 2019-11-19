FROM php:7.2

RUN apt-get update -y && apt-get install -y openssl zip unzip git

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

ADD . /home

CMD composer install && php artisan migrate && php artisan serve --host=0.0.0.0 --port=8080

EXPOSE 8080
