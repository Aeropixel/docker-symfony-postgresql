FROM php:8.2.11-fpm

WORKDIR /var/www/html/

RUN apt-get update && apt-get upgrade -y
RUN apt-get install git zip libpq-dev libicu-dev libzip-dev libjpeg-dev libpng-dev libfreetype6-dev -y
RUN docker-php-ext-configure intl
RUN docker-php-ext-configure gd '--with-jpeg' '--with-freetype'
RUN docker-php-ext-install pdo pdo_pgsql pdo_pgsql intl zip gd opcache
# RUN pecl install xdebug
# RUN docker-php-ext-enable xdebug

RUN echo "\
max_execution_time = 6000\n\
memory_limit = 1G\n\
post_max_size = 25M\n\
upload_max_filesize = 20M\n\
max_file_uploads = 100M\n\
default_charset = \"UTF-8\"\n\
date.timezone = \"Europe/Lisbon\"\n\
short_open_tag = off" > /usr/local/etc/php/php.ini


# Install composer and symfony cli
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
RUN curl -sS https://get.symfony.com/cli/installer | bash && mv /root/.symfony5/bin/symfony /usr/local/bin/symfony

# Install NVM, Node and NPM
SHELL ["/bin/bash", "--login", "-i", "-c"]
RUN curl -o- https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash
RUN source /root/.bashrc && nvm install --lts
SHELL ["/bin/bash", "--login", "-c"]


CMD ["php-fpm"]