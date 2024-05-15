<?php
define( 'DB_NAME', getenv('DB_NAME') );
define( 'DB_USER',  getenv('ADMIN_NAME') );
define( 'DB_PASSWORD', getenv('ADMIN_PASSWORD') );
define( 'DB_HOST', 'mariadb' );
define( 'DB_CHARSET', 'utf8' );
define( 'DB_COLLATE', '');

$table_prefix = 'wp_';

define( 'WP_DEBUG', false );

if ( ! defined( 'ABSPATH' ) ) {
	    define( 'ABSPATH', __DIR__ . '/' );
}

require_once ABSPATH . 'wp-settings.php';
