<?php

use Phalcon\Mvc\User\Component;
use Phalcon\Mvc\View\Engine\Volt as VoltEngine;

class UIHelper extends Component
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

    public function check_in_array($obj, $array = [])
    {
        if (in_array($obj, $array)) return true;
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

    public function drawRecursiveMenuAdmin($layout, $data, $menu_block_id)
    {
        return $this->view->getPartial($layout, ["data" => $data, 'menuBlockId' => $menu_block_id]);
    }
}