<?php
namespace Graduate\Frontend\Controllers;

class IndexController extends ControllerBase
{

    public function indexAction()
    {
        $obj = new \Product();
        $obj->findObj();
        $listCatHome = $this->getCatHome();
    }

    public function getCatHome(){
        $catObj = new \Category();
        $rsCatHome = $catObj->getDataListCatPageHome();

    }
}

