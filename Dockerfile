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
    # libfreetype6-dev \
    libicu-dev \
    # libjpeg62-turbo-dev \
    # libssh2-1-dev \
    libsodium-dev \
    libmcrypt-dev \
    # libpng-dev \
    libpng++-dev \
    libzip-dev \
    # libmcrypt-dev \
    libmcrypt4 \
    libjpeg-dev \
    libcurl3-dev \
    libfreetype6 \
    libfreetype6-dev \
    libicu-dev \
    libxslt1-dev \
    libssl-dev \
    libmagickwand-dev \
    # php-imagick \
    build-essential \
    lsof \
    default-mysql-client \
    wget \
    gnupg2 \
    # vim \
    unzip \
    gzip \
    curl \
    git \ 
    cron && \ 
    pecl install imagick  
    # && \
RUN docker-php-ext-configure gd --with-freetype --with-jpeg && \ 
    docker-php-ext-install \
    pdo_mysql \
    curl \
    dom \
    exif \
    fileinfo \
    # hash \
    json \
    # mbstring 
    mysqli \ 
    # # sodium \
    # openssl 
    # pcre \
    xml \
    zip \ 
    filter \
    gd \
    iconv \
    simplexml \
    # xmlreader \
    opcache 
    # # imagick \
    # zlib

RUN pecl channel-update pecl.php.net && \
    pecl install xdebug && \
    docker-php-ext-enable xdebug && \
    sed -i -e 's/^zend_extension/\;zend_extension/g' /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini && \
    wget -q -O - https://packages.blackfire.io/gpg.key | apt-key add - && \
    echo "deb http://packages.blackfire.io/debian any main" | tee /etc/apt/sources.list.d/blackfire.list && \
    curl -sL https://deb.nodesource.com/setup_current.x | bash - && \
    apt-get update -y && \
    apt-get install -y nodejs blackfire-agent blackfire-php && \
    rm -rf /var/lib/apt/lists/*
    # npm install -g yarn && \
    # npm install -g grunt-cli

RUN curl -sSLO https://github.com/mailhog/mhsendmail/releases/download/v0.2.0/mhsendmail_linux_amd64 && \
    chmod +x mhsendmail_linux_amd64 && \
    mv mhsendmail_linux_amd64 /usr/local/bin/mhsendmail && \
    curl -sS https://getcomposer.org/installer | \
    php --  --install-dir=$COMPOSER_HOME --filename=composer

COPY ./php.ini /usr/local/etc/php/php.ini
COPY "wordpress.test.com.conf" "/etc/apache2/sites-available/wordpress.test.com.conf"
COPY "wordpress.test.com.conf" "/etc/apache2/sites-enabled/wordpress.test.com.conf"
COPY "apache2.conf" "/etc/apache2/apache2.conf"

WORKDIR $INSTALL_DIR