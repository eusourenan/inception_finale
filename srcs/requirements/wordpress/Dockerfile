FROM debian:oldstable

WORKDIR /var/www/wordpress

RUN apt update && apt upgrade -y \ 
	&& apt install php7.4 php-fpm php-mysql \
	   mariadb-client wordpress wget -y \
	&& rm -rf /var/lib/apt/lists/*

RUN wget -O /usr/local/bin/wp https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
	&& chmod +x /usr/local/bin/wp \
	&& wp core download --allow-root --path=/var/www/wordpress

RUN mkdir /run/php

RUN chown -R www-data:www-data /var/www/wordpress \
	&& chmod 755 /var/www/wordpress

COPY conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf

COPY tool/script.sh /tmp/wp_setup.sh

RUN chmod 777 /tmp/wp_setup.sh

ENTRYPOINT ["/tmp/wp_setup.sh"]
