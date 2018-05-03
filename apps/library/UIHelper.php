<?php

/**
 * Created by PhpStorm.
 * User: admin
 * Date: 1/27/2018
 * Time: 12:08 PM
 */
class UIHelper
{
    public function format_number($number = '')
    {
        if ($number == '') {
            return 0;
        }
        //Remove anything that isn't a number or decimal point
        $number = trim(preg_replace('/([^0-9\.])/i', '', $number));
        return number_format($number, 0, ',', '.');
//        return number_format($number);
    }

    public function check_in_array($obj, $array = []){
        if(in_array($obj, $array)) return true;
        else return false;
    }

    public function formatNumber($number = '')
    {
        if ($number == '') {
            return '';
        }
        //Remove anything that isn't a number or decimal point
        $number = trim(preg_replace('/([^0-9\.])/i', '', $number));
//        return number_format($number, 2, '.', ',');
        return number_format($number);
    }
}