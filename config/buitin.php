<?php


if (!function_exists('server_name')) {

    function server_name()
    {
        try {
            return empty($_SERVER['HTTP_HOST']) ? $_SERVER['SERVER_NAME'] : $_SERVER['HTTP_HOST'];

        } catch (Exception $e) {
            return '';

        }
    }
}


if (!function_exists('provider')) {
    /**
     * Calls the default Dependency Injection container.
     *
     * @param  mixed
     *
     * @return mixed
     */
    function provider(...$input)
    {
        $default = Phalcon\Di::getDefault();
        $args = func_get_args();

        if (empty($args)) {
            return $default;
        }

        if ($default->has($args[0])) {
            return call_user_func_array([$default, 'get'], $args);

        }
        return false;
    }
}

if (!function_exists('config')) {
    /**
     * Calls the default Dependency Injection container.
     *
     * @param $path
     * @param null $default
     * @return mixed
     *
     */
    function config($path = null, $default = null)
    {
        $di = Phalcon\Di::getDefault();
        /** @var \Phalcon\Config $config */
        $config = $di->getShared('config');
        if ($config == null) {
            return $default;
        }

        $ps = explode(':', $path);
        $res = $config;
        foreach ($ps as &$p) {

            if (is_object($res)) {
                $res = $res->$p;

            } elseif (is_array($res)) {
                $res = $res[$p];
            }
        }
        return ($res === null) ? $default : $res;
    }
}

if (!function_exists('d')) {
    /**
     * Dump the passed variables without end the script.
     *
     * @param  mixed
     *
     * @return void
     */
    function d(...$ags)
    {
        $trace = debug_backtrace();
        $rootPath = dirname(dirname(__FILE__));
        $index = ($trace[1]['function'] == 'd') ? 1 : 0;
        $file = str_replace($rootPath, '', $trace[$index]['file']);
        $line = $trace[$index]['line'];
        echo $file . ' ' . $line;

        array_map(function ($x) {
            $string = (new Phalcon\Debug\Dump(null, true))->variable($x);
            echo(PHP_SAPI == 'cli' ? strip_tags($string) . PHP_EOL : $string); die;
        }, func_get_args());
    }
}


if (!function_exists('remote_address')) {
    /**
     * Dump function, replace var_dump() => for debug
     *
     * @return
     */
    function remote_address()
    {
        return $_SERVER['HTTP_CLIENT_IP'] ?: ($_SERVER['HTTP_X_FORWARDE‌​D_FOR'] ?: $_SERVER['REMOTE_ADDR']);
    }
}


if (!function_exists('actual_request')) {
    function actual_request()
    {
        return (isset($_SERVER['HTTPS']) ? "https" : "http") . "://$_SERVER[HTTP_HOST]$_SERVER[REQUEST_URI]";
    }
}


if (!function_exists('dump_to_str')) {
    function dump_to_str(... $input)
    {
        ob_start();
        var_dump($input);
        $res = ob_get_contents();
        ob_end_clean();
        return $res;
    }
}


if (!function_exists('array_from')) {

    /**
     * @param $data
     *
     * @return array
     */
    function array_from($data)
    {
        return json_decode(json_encode($data), true);
    }

}

if (!function_exists('base_uri')) {
    function base_uri()
    {
//        return "http://$_SERVER[HTTP_HOST]";
        return ($_SERVER['HTTPS'] == 'off' ? "http" : "https") . "://$_SERVER[HTTP_HOST]";
    }
}
