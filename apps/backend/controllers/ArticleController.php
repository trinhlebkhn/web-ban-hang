<?php
/**
 * Created by PhpStorm.
 * User: An Viet Computer
 * Date: 10/16/2018
 * Time: 11:26 PM
 */

namespace Graduate\Backend\Controllers;


class ArticleController extends AuthorizedControllerBase
{
    public function indexAction(){

    }

    public function addAction(){
        $catObj = new \Category();
        $query_cat = [
            'q' => 'type = 2'
        ];
        $listCats = $catObj->getListObj($query_cat);
        $dataListCats = [];
        $this->recursiveCat($listCats->data, 0, $dataListCats);
        $this->view->listCats = $dataListCats;
    }
}