<?php

$loader = new \Phalcon\Loader();

/**
 * We're a registering a set of directories taken from the configuration file
 */
$loader->registerDirs(
    [
        APP_PATH . '/service',
        APP_PATH . '/models',
    ]
)->register();
