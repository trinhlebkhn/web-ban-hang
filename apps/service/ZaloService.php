<?php

use Zalo\Zalo;
use Zalo\ZaloConfig;

/**
 * Created by PhpStorm.
 * User: trinhln
 * Date: 11/2/2018
 * Time: 2:05 PM
 */

class ZaloService
{
    public $zaloObj;
    public $zalohelper;
    function initialize(){
        $this->zaloObj = new Zalo(ZaloConfig::  getInstance()->getConfig());
        $this->zalohelper = $this->zalo -> getRedirectLoginHelper();
    }
    public function  createProduct(){

    }
}