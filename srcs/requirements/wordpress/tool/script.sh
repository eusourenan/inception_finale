#!/usr/bin/env bash

if [ -f /var/www/wordpress/wp-config-sample.php ]; then
	rm -rf /var/www/wordpress/wp-config-sample.php

	wp --allow-root config create \
		--dbname="$DB_NAME" \
		--dbuser="$ADMIN_NAME" \
		--dbpass="$ADMIN_PASSWORD" \
		--dbhost=mariadb \
		--dbprefix="wp_"

	wp core install --allow-root \
		--path=/var/www/wordpress \
		--title="42SP InceptionHELL" \
		--url=$DOMAIN \
		--admin_user=$ADMIN_NAME \
		--admin_password=$ADMIN_PASSWORD \
		--admin_email=$ADMIN_EMAIL

	wp user create --allow-root	\
		--path=/var/www/wordpress \
		"$USER_NAME" "$USER_EMAIL" \
		--user_pass=$USER_PASSWORD \
		--role='author'
fi

exec php-fpm7.4 -F
