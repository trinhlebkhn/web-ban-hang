<?php

/**
 * Created by PhpStorm.
 * User: admin
 * Date: 7/12/2017
 * Time: 2:40 PM
 */
trait ObjectInstanceExt
{
    /**
     * @param object|array $arr
     *
     * @return static
     */
    public static function newInstance($arr = null)
    {
        if ($arr == null) {
            return new static();
        }
        if (!is_object($arr)) {
            $arr = (object)$arr;
        }
        $instance = ClassUtils::mapObject($arr, static::class);
        return $instance;
    }


    /**
     * map_object
     *
     * @param $arr mixed
     *
     * @return static
     * Set giá trị cho properties
     */
    public function mapObject($arr)
    {
        if (is_object($arr)) {
            $arr = get_object_vars($arr);
        }
        foreach ($arr as $key => $val) {
            if (property_exists($this, $key)) {
                $this->{$key} = $val;
            }
        }
        return $this;
    }

    /*
     * return message manipulation error
     * */
    public function manipulationError($data = [], $message)
    {
        $rs = (object)[
            'status' => 0,
            'data' => $data,
            'message' => $message,
            'optional' => null
        ];
        return $rs;
    }

    /*
     * return message manipulation success
     * */
    public function manipulationSuccess($data, $message, $optional = null)
    {
        $rs = (object)[
            'status' => 1,
            'data' => $data,
            'message' => $message,
            'optional' => $optional
        ];
        return $rs;
    }


}