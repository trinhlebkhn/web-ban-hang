<?php
namespace Graduate\Frontend\Controllers;

class IndexController extends ControllerBase
{

    public function indexAction()
    {
        $homeData = $this->getCatHome();
        $this->view->setVars([
           'cat_home_data' => $homeData
        ]);
    }

    public function getCatHome(){
        $catObj = new \Category();
        $rsDataHome = $catObj->getDataListCatPageHome();
        if($rsDataHome->status) return $rsDataHome->data;
    }
}

