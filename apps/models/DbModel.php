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

    /**
     * @param null $columns
     *
     * @return array
     */
//    public function toArray($columns = null)
//    {
//        is_string($columns) && ($columns = preg_replace('/\s/', '', $columns)) && $columns = explode(',', $columns);
//        $fields = $columns == null ? static::getFieldProperties() : array_intersect(static::getFieldProperties(), (array)$columns);
//        $res = [];
//        foreach ($fields as $field) {
//            $getter = 'get' . str_replace('_', '', $field);
//            if (method_exists($this, $getter)) {
//                $value = call_user_func([
//                    $this,
//                    $getter
//                ]);
//                $res[$field] = $value;
//            } else {
//                $res[$field] = $this->$field;
//            }
//        }
//        return $res;
//    }
    /**
     * @param array|string $ignore
     * @return array
     */
//    public static function getFieldProperties($ignore = '')
//    {
//
//        $props = array_keys(get_class_vars(static::class));
//        $props = array_filter($props, function ($item) {
//            return $item[0] === '_' ? null : $item;
//        });
//
//        is_string($ignore) && $ignore = explode(',', str_replace(' ', '', $ignore));
//        $ignore != null && $props = array_diff($props, $ignore);
//
//        return $props;
//    }

//    function beforeCreate()
//    {
//        if (method_exists($this, 'validateCreate')) {
//            $isValid = call_user_func([$this, 'validateCreate']);
//            if (!$isValid) {
//                throw new LogicException($this->getMessages()[0]->getMessage());
//            }
//        }
//    }
//
//    function cast($destination, $sourceObject)
//    {
//        if (is_string($destination)) {
//            $destination = new $destination();
//        }
//        $sourceReflection = new ReflectionObject($sourceObject);
//        $destinationReflection = new ReflectionObject($destination);
//        $sourceProperties = $sourceReflection->getProperties();
//        foreach ($sourceProperties as $sourceProperty) {
//            $sourceProperty->setAccessible(true);
//            $name = $sourceProperty->getName();
//            $value = $sourceProperty->getValue($sourceObject);
//            if ($destinationReflection->hasProperty($name)) {
//                $propDest = $destinationReflection->getProperty($name);
//                $propDest->setAccessible(true);
//                $propDest->setValue($destination, $value);
//            } else {
//                $destination->$name = $value;
//            }
//        }
//        return $destination;
//    }
}