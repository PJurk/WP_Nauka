FROM php:7.4.9-apache-buster

LABEL MAINTAINER="Patryk Jurkiewicz" 
LABEL description="Local wordpress setup" 
LABEL version="1.0.0"

ENV INSTALL_DIR /var/www/html
ENV COMPOSER_HOME /usr/local/bin

RUN echo 127.0.0.1 www.wordpress.test.com wordpress.test.com >> "/etc/hosts" && \
    rm -rf "/etc/apache2/sites-available/000-default.conf" && \
    rm -rf "/etc/apache2/sites-enabled/000-default.conf" && \
    rm -rf "/etc/apache2/sites-available/default-ssl.conf" && \
    a2enmod rewrite

RUN rm /bin/sh && ln -s /bin/bash /bin/sh && \
    apt-get -y update && \
    apt-get install -y  \
    libbz2-dev \
    libicu-dev \
    libsodium-dev \
    libmcrypt-dev \
    libpng++-dev \
    libzip-dev \
    libmcrypt4 \
    libjpeg-dev \
    libcurl3-dev \
    libfreetype6 \
    libfreetype6-dev \
    libicu-dev \
    libxslt1-dev \
    libssl-dev \
    libmagickwand-dev \
    build-essential \
    lsof \
    default-mysql-client \
    wget \
    gnupg2 \
    unzip \
    gzip \
    curl \
    git \ 
    cron && \ 
    pecl install imagick  

RUN docker-php-ext-configure gd --with-freetype --with-jpeg && \ 
    docker-php-ext-install \
    pdo_mysql \
    curl \
    dom \
    exif \
    fileinfo \
    json \ 
    mysqli \ 
    xml \
    zip \ 
    filter \
    gd \
    iconv \
    simplexml \
    opcache

RUN pecl install xdebug \
    && docker-php-ext-enable xdebug \
    && echo "zend_extension=$(find /usr/local/lib/php/extensions/ -name xdebug.so)" >> /usr/local/etc/php/conf.d/xdebug.ini && \ 
    curl -sL https://deb.nodesource.com/setup_current.x | bash - && \
    apt-get update -y && \
    apt-get install -y nodejs && \
    rm -rf /var/lib/apt/lists/* && \
    npm install -g yarn 

RUN curl -sSLO https://github.com/mailhog/mhsendmail/releases/download/v0.2.0/mhsendmail_linux_amd64 && \
    chmod +x mhsendmail_linux_amd64 && \
    mv mhsendmail_linux_amd64 /usr/local/bin/mhsendmail && \
    curl -sS https://getcomposer.org/installer | \
    php --  --install-dir=$COMPOSER_HOME --filename=composer

COPY ./php.ini /usr/local/etc/php/php.ini
COPY "wordpress.test.com.conf" "/etc/apache2/sites-available/wordpress.test.com.conf"
COPY "wordpress.test.com.conf" "/etc/apache2/sites-enabled/wordpress.test.com.conf"
COPY "apache2.conf" "/etc/apache2/apache2.conf"
COPY ./xdebug.ini /usr/local/etc/php/conf.d/xdebug.ini

WORKDIR $INSTALL_DIR