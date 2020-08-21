FROM php:7.4.9-fpm

RUN curl -sS https://get.symfony.com/cli/installer | bash && \
    mv /root/.symfony/bin/symfony /usr/local/sbin/symfony

RUN curl -sS https://getcomposer.org/installer | \
      php -- --install-dir=/usr/local/sbin --filename=composer

RUN apt update && \
    apt install -y --no-install-recommends \
      make \
      git \
      libzip-dev \
      && \
    apt clean -y && \
    apt autoremove -y && \
    rm -r /var/lib/apt/lists/*

RUN docker-php-ext-configure zip && \
    docker-php-ext-install zip

WORKDIR /work/app
