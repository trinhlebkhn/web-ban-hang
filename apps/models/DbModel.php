<?php

use Phalcon\Mvc\Model;
use Phalcon\Mvc\Model\Behavior\SoftDelete;
use Phalcon\Mvc\Model\Query\Builder;

/**
 * Created by PhpStorm.
 * User: Vivi
 * Date: 3/7/2017
 * Time: 10:58 AM
 */
class DbModel extends Model
{
    use ObjectInstanceExt;

    public function recursive($data, $parent_id = 0, &$array)
    {
        foreach ($data as $key => $item) {
            if ($item['parent_id'] == $parent_id) {
                if ($item['parent_id'] == 0) {
                    $array[] = $item;
                }
                foreach ($array as $v => $value) {
                    if ($array[$v]['id'] == $parent_id) {
                        if (empty($array[$v]['child'])) {
                            $array[$v]['child'] = [];
                        }
                        array_push($array[$v]['child'], $item);
                        $this->recursive($data, $item['id'], $array[$v]['child']);
                    }
                }
                unset($data[$key]);
                $this->recursive($data, $item['id'], $array);
            }
        }
    }
}