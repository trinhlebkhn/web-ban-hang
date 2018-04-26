<?php


use Phalcon\Logger;
use Phalcon\Logger\Adapter;

class ClassLogUtils
{

    static $logLevel = null;

    static $dirPattern = 'Y_m_d';

    static $folderExisted = null;

    static $logDir = null;

    static $enabled = null;

    static $initialized = false;

    const LOG_LEVEL = [
        'emergency' => Logger::EMERGENCY,
        'emergence' => Logger::EMERGENCE,
        'critical' => Logger::CRITICAL,
        'alert' => Logger::ALERT,
        'error' => Logger::ERROR,
        'warning' => Logger::WARNING,
        'notice' => Logger::NOTICE,
        'info' => Logger::INFO,
        'debug' => Logger::DEBUG,
        'custom' => Logger::CUSTOM,
        'special' => Logger::SPECIAL,
    ];

    static function init()
    {
        if (!static::$initialized) {
            static::$enabled = config('application:logEnable', false);
            static::$dirPattern = config('application:logDirPattern', 'Y_m_d');
            static::$logLevel = config('application:logLevel', 'INFO');

            if (is_string(static::$logLevel)) {
                static::$logLevel = static::LOG_LEVEL[strtolower(static::$logLevel) ?: 'info'];
            }

            static::$logDir = config('application:logDir') . date(static::$dirPattern);
            if (!file_exists(static::$logDir) && static::$enabled) {
                mkdir(static::$logDir);
            }
            static::$initialized = true;
        }
    }

    static function debug($message)
    {
        static::log($message, Logger::DEBUG);
    }

    static function info($message)
    {
        static::log($message, Logger::INFO);
    }

    static function error($obj)
    {
        if ($obj instanceof Exception) {
            $message = $obj->getMessage();
        } else {
            $message = $obj;
        }
        static::log($message, Logger::ERROR);
    }

    static function notice($message)
    {
        static::log($message, Logger::NOTICE);
    }

    static function warning($message)
    {
        static::log($message, Logger::WARNING);
    }

    static function alert($message)
    {
        static::log($message, Logger::ALERT);
    }

    static function critical($message)
    {
        static::log($message, Logger::CRITICAL);
    }


    static function log($message, $type = Logger::INFO)
    {
        static::init();
        if (!static::$enabled || $type > static::$logLevel) {
            return;
        }
        $fileName = debug_backtrace()[2]['class'];
        /** @var Adapter $logger */
        $logger = new Adapter\File(sprintf('%s.%s',
            preg_replace('/[\/]+/', DIRECTORY_SEPARATOR, static::$logDir . DIRECTORY_SEPARATOR . $fileName),
            'log'
        ));
        $logger->log($type, $message);
    }

}