<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the
 * installation. You don't have to use the web site, you can
 * copy this file to "wp-config.php" and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * MySQL settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://wordpress.org/support/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'wordpress' );

/** MySQL database username */
define( 'DB_USER', 'wordpress' );

/** MySQL database password */
define( 'DB_PASSWORD', 'wordpress' );

/** MySQL hostname */
define( 'DB_HOST', 'db' );

/** Database Charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8mb4' );

/** The Database Collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define( 'AUTH_KEY',         'c_Z}(qa}>@*E>Bemu[n|AhcDielq%>hr1)hu^<]%D[5,tp&jRqI01aa.d,Y)7x)B' );
define( 'SECURE_AUTH_KEY',  'DpC[`}hqn6`aB3y))@9G%=q(8q1XyH]E5pIWDk=Z>jc[2~~*779o(8?/9?s*RY;]' );
define( 'LOGGED_IN_KEY',    '2@kU19d5pZQR~mUc d+{QKwimmK=NVIb_lK^6yV$BD]b;oMjsDqz<zzwDE >%tkU' );
define( 'NONCE_KEY',        'dn,WV5M)JlfT=%sN0g|J)bi.(CJ1je&<ptmQeo#jml<]|HCW:gx/_gDStuYQ`pG;' );
define( 'AUTH_SALT',        '/[Xd(zA@pO7}WbYnAeAR63K5FrTRl,5UM*~*A?GtA{k)Y7A4a&5jEVVoc/QluLda' );
define( 'SECURE_AUTH_SALT', ',R_D[o4B!,paMgF{8}IJvW1v+CwSUZld@:d/s?rq| mLS!W#n&K?QOnx)B-y8|I=' );
define( 'LOGGED_IN_SALT',   'J@Tb`3(%A8*%-zg+c$^k1,;Ss8TY< mo$}S,wNih)Sh]OgNX<WqPT~kz5Q,*,pQ[' );
define( 'NONCE_SALT',       ',ziGvSb;v+Rt`oFg;|#*pS_Rm1A6maa8UVey BV!D<<o0J@oBf+B{/-JG9hm-$X2' );

/**#@-*/

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://wordpress.org/support/article/debugging-in-wordpress/
 */
define( 'WP_DEBUG', false );

/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
