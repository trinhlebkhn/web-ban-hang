<?php
/**
 * Created by PhpStorm.
 * User: admin
 * Date: 4/24/2018
 * Time: 5:24 PM
 */

namespace Graduate\Backend\Controllers;


class ProductController
{
    public function indexAction(){

    }

    public function getListProductAction(){
        $json_data = array(
            "draw" => intval($_REQUEST['draw']),
            "recordsTotal" => 10,
            "recordsFiltered" => 10,
            'data' => (object)[
                'id' => 1,
                'fullname' => 1,
                'phone' => 1,
                'email' => 1,
                'address' => 1
            ]
        );
        return json_encode($json_data);
    }
}