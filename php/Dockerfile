FROM php:7.1-fpm

RUN set -ex \
	&& apt-get update \
	&& apt-get install -y \
		libmemcached-dev \
		zlib1g-dev \
		sudo \
		less \
		wget \
		mysql-client \
	&& pecl install xdebug-2.5.0 memcached \
    && docker-php-ext-install mysqli \
    && docker-php-ext-enable xdebug memcached

RUN { \
		echo "zend_extension=$(find /usr/local/lib/php/ -name xdebug.so)"; \
		echo "xdebug.remote_enable=on"; \
        echo "xdebug.remote_handler=dbgp"; \
        echo "xdebug.remote_connect_back=Off"; \
        echo "xdebug.remote_autostart=on"; \
        echo "xdebug.remote_port=9000"; \
	} > /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini
