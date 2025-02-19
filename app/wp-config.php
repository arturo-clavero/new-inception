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
define( 'DB_HOST', 'mariadb' );

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
define( 'AUTH_KEY',          'f;V3<RTzCrF:_E>G-jY}+~jDgOn0J=_Q`/s6ne#-!AF;, j >P<:Mi/-+wxodv)1' );
define( 'SECURE_AUTH_KEY',   'p#j`iDw?{?~up9f?t0,[dJU0,Bx@Gx7W./SS-X@v Ja*g.J!3%M1q@!Az/Wcaa,?' );
define( 'LOGGED_IN_KEY',     'w0:f=GOMZsiaV>OH%neb=n-GxSw?{hKUdzEk1@n%sJ[)ckU>C7>@_xglr)J1]iC7' );
define( 'NONCE_KEY',         'T&!y>O4_vVf&#A::phWQs= c{&b|zp?;oTQ@9Zu^!rZ=wZ2x:rvFTE}*^ff61CUK' );
define( 'AUTH_SALT',         'Zb;074PrBd5zh{)6/,+(V^=yx{C:V!-^=#& rQuL~#T3oHLpuiiy_Mg^#;gmKD[@' );
define( 'SECURE_AUTH_SALT',  '@]ItjKoO*QdZvf;9]#,=$(.gEdMCErGCW[qJ*MlHS@Wgj{H.A^poh&aMU.z[[~#f' );
define( 'LOGGED_IN_SALT',    ':o8NJNSbZA/4[]I<N~5d>r`R~~Nbj1^os-a/_YrVgXzV5<8m5tr9Di]N7SO{ruRN' );
define( 'NONCE_SALT',        '|XN~/vSq;CN)sD/9K&R|:fU#9?5`=D&lVq`A49^FxnpeLKJz_t=K126)O}9Yt1}V' );
define( 'WP_CACHE_KEY_SALT', '%U8 KbtmGR#`W:IfH&Fv*r }dN2ko$Cc_)#bV4PhsrOhOz>YxQV1AwqU-@4CG1yR' );


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
