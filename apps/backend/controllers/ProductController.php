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
            'data' => [
                ['id' => 1],
                ['id' => 2],
                ['id' => 3],
                ['id' => 4],
                ['id' => 5],
            ]
        );

        return json_encode($json_data);
    }
}