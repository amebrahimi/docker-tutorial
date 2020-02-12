# Wordpress plugin tutorials

- For starting developing plugin for wordpress make WP_DEBUG true in wp-config.php.

`define('WP_DEBUG', false)`

- You have to create your plugins in the wp-content/plugins.

- Create a folder with the name you want to name your plugin. (**It must be unique**)

- You have to create a file exactly the name of the folder inside it.

- The attributes in the first file in the plugin

```
/**
 * @package PrinceBestPlugin
 */
/**
 Plugin Name: Prince Best Plugin
 Plugin URI: https://prince.best.plugin (The uri to the plugin like github)
 Description: This is my first attempt on writing a custom plugin for this amazing series.
 Version: 1.0.0
 Author: Amir Mahmoud Ebrahimi
 Author URI: http://mrclover.tk
 License: MIT
 Text Domain: prince-best-plugin
 */

 /*
 And here the license requirements
 */
```

- For security reason and best practices, you have to create an `index.php` and make it empty like this:

```
<?php
// silence in golden.
```

- For security reasons is best to add this to the plugin entry file. (`name-plugin.php`)

```
if (!defined('ABSPATH')) {
    die;
}
register_activation_hook(__FILE__, array($princeBestPlugin, 'activate'));
if (!function_exists('add_action')) {
    echo 'Hey, you can\'t access this file, you silly human';
    exit;
}
```

- To see if the class you want to instantiate exists you can do this: (Returns a boolean)

`class_exists( 'NameOfTheClass' )`

- Wordpress automatically triggers this plugins on certain conditions:

```
// activation
register_activation_hook(__FILE__, array($princeBestPlugin, 'activate')); // When plugin is getting active the best practice is to create a CPT and flush the rewrite

// deactivation
register_deactivation_hook($file, $function);// The best practice here is to flush the rewrite rules
```

- Uninstall methods:

```
// uninstall
register_uninstall_hook($file, $callback); // delete CPT, delete all the plugin data from the DB.

```

- Instead you can create a file named uninstall.php. The purpose of creating uninstall is to clear the dta stored for the plugin in database.

```
//the first line should be:

if (!defined('WP_UNINSTALL_PLUGIN')) {
    die;
}

```

- Deleting data from the database:

```
//get all the posts from database
$books = get_posts(array('post_type' => 'book', 'numberposts' => -1));
//                        the unique slug ^ ,  get all the posts  ^

foreach ($books as $book) {
    wp_delete_post( $book->ID, true);
    // Just delete it           ^
}
```

- Another way for deleting all the posts using directly the database commands:

```
global $wpdb;
$wpdb->query( "DELETE FROM wp_posts WHERE post_type = 'book' " );

// delete all the wp_postmeta that don't match this id
$wpdb->query("DELETE FROM wp_postmeta WHERE post_id NOT IN (SELECT id FROM wp_posts)");

$wpdb->query("DELETE FROM wp_term_relationships WHERE post_id NOT IN (SELECT id FROM wp_posts)");
```

- echo a function after the header was set in wordpress will trigger an error.

- The procedural way to do something on `init`:

`add_action('init', 'the_function_name');`

- refresh all the wordpress stuff and tell we created something new:

`flush_rewrite_rules()`

- to register a new post type:

`register_post_type('book', ['public' => true, 'label' => 'Books']);`

- Enqueue the css files for loading:

`wp_enqueue_style('myplyginstyle', plugins_url('/assets/mystyle.css', __FILE__));`

- Enqueue javascript files for loading:

`wp_enqueue_script('myplyginscript', plugins_url('/assets/myscript.js', __FILE__));`

- Add scripts to admin area:

`add_action('admin_enqueue_scripts', array($this, 'enqueue'));`

- To add scripts in the actual page:

`add_action('wp_enqueue_scripts', array($this, 'enqueue'));`
