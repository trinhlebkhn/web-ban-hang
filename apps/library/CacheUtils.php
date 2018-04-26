<?php

/**
 * Created by PhpStorm.
 * User: balol
 * Date: 8/31/2017
 * Time: 2:14 PM
 */
class CacheUtils
{

    /**
     * @param $key
     * @param Closure $func
     * @param null $life_time
     * @param bool $renew
     * @param null $prefix
     * @return mixed|null
     */
    static function getAndSave($key, Closure $func, $life_time = null, $renew = false, $prefix = null)
    {
        /** @var \Phalcon\Cache\Backend $cache */
        $cache = provider('cache');
        if ($cache == null) {
            throw new LogicException('Thiếu service cache');
        }

        if (!$renew) {
            $value = $cache->get($key);
            if ($value != null) {
                return $value;
            }
        }

        $func_res = $func();
        if ($func_res === null) {
            return null;
        }

        $life_time = ($life_time === null) ? $cache->getLifetime() : intval($life_time);

        $r = $cache->save($key, $func_res, $life_time);
        if ($r) {
            return $func_res;

        } else {
            throw new LogicException('Lỗi khi lưu dữ liệu');
        }
    }


    static function clearCache($key, $prefix = null)
    {
        /** @var \Phalcon\Cache\Backend $cache */
        $cache = provider('cache', [$prefix]);
        return $cache->delete($key);
    }


    static function clearCacheByPattern($pattern, $params = null, $prefix = null)
    {
        $key = sprintf($pattern, $params);
        return static::clearCache($key, $prefix);
    }


    static function getAndSaveByPattern($pattern, $params, Closure $func, $life_time = null, $renew = false, $prefix = null)
    {
        $key = sprintf($pattern, $params);
        return static::getAndSave($key, $func, $life_time, $renew, $prefix);
    }
}