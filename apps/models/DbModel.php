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
//    use ObjectInstanceExt;


    function beforeCreate()
    {
        if (method_exists($this, 'validateCreate')) {
            $isValid = call_user_func([$this, 'validateCreate']);
            if (!$isValid) {
                throw new LogicException($this->getMessages()[0]->getMessage());
            }
        }
    }

    function cast($destination, $sourceObject)
    {
        if (is_string($destination)) {
            $destination = new $destination();
        }
        $sourceReflection = new ReflectionObject($sourceObject);
        $destinationReflection = new ReflectionObject($destination);
        $sourceProperties = $sourceReflection->getProperties();
        foreach ($sourceProperties as $sourceProperty) {
            $sourceProperty->setAccessible(true);
            $name = $sourceProperty->getName();
            $value = $sourceProperty->getValue($sourceObject);
            if ($destinationReflection->hasProperty($name)) {
                $propDest = $destinationReflection->getProperty($name);
                $propDest->setAccessible(true);
                $propDest->setValue($destination, $value);
            } else {
                $destination->$name = $value;
            }
        }
        return $destination;
    }
}