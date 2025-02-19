<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the installation.
 * You don't have to use the web site, you can copy this file to "wp-config.php"
 * and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * Database settings
 * * Secret keys
 * * Database table prefix
 * * Localized language
 * * ABSPATH
 *
 * @link https://wordpress.org/support/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** Database settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'wordpress' );

/** Database username */
define( 'DB_USER', 'artclave' );

/** Database password */
define( 'DB_PASSWORD', '123' );

/** Database hostname */
define( 'DB_HOST', 'mariadb:3306' );

/** Database charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

/** The database collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication unique keys and salts.
 *
 * Change these to different unique phrases! You can generate these using
 * the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}.
 *
 * You can change these at any point in time to invalidate all existing cookies.
 * This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define( 'AUTH_KEY',          '2:/P*Zj~E~t*[W+bmqr[*kjM*;$)u@&}usg}@W{,mqeM&]@>?A>ez0 U<}?$bC*;' );
define( 'SECURE_AUTH_KEY',   'm`ML@S2e}r~[AJZD12h:Uatz!f%J2ITK-d}Qm*iq|5]CH^+TSjn:f!!$9`K?pp6j' );
define( 'LOGGED_IN_KEY',     '0@W,o_z]$>%^p/_ak ImR7|$jE@3C,A5Qu]vUQ{!:wz812Y&mjqA&t51kf>KZ|M8' );
define( 'NONCE_KEY',         'vw8?]7JNI-5}h@c4]`TaE76J{t<r[+u,WEs1}h+BD}!H: bu+5i(%3x[paQw?i/8' );
define( 'AUTH_SALT',         'b5A+IUoN~xvK*.Nyn6@8>k8rtd-LS;;~*]rh|o,XgdCfL&K6%e57D$In9LHE/<jw' );
define( 'SECURE_AUTH_SALT',  '*]:ek(s|s27k<#2Q]lvm8xj):9UP=~D$&:(Yiy!v.TX9q1,/)4?,9(I$NhI#~nnp' );
define( 'LOGGED_IN_SALT',    '64pzDcr=sQD+L?Y^$jbh8pXumg?K*7l2AO=+IoA,%DgWxg+PM}Q?Q~H1NZ|m#bC:' );
define( 'NONCE_SALT',        'pVGMhfeM/M=W2/PIrY:n9hd?YSdf#0J~U*~@T>>6?^ VPLZ-4!F`zzbCLc?2ZnA1' );
define( 'WP_CACHE_KEY_SALT', 'dI0:]6F;)^d0R[%xb>k&N4*y,QZ{4Zr;%}4742pM9P[!S}#}m@Rda%9=*vZC|-p8' );


/**#@-*/

/**
 * WordPress database table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';


/* Add any custom values between this line and the "stop editing" line. */



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
if ( ! defined( 'WP_DEBUG' ) ) {
	define( 'WP_DEBUG', false );
}

/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
