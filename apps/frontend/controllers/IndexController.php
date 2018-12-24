<?php
namespace Graduate\Frontend\Controllers;

use function Aws\constantly;

class IndexController extends ControllerBase
{

    public function indexAction()
    {
        $config_website = $this->getConfig();
        $this->setHeader(new \Header($config_website['seo_title'], $config_website['seo_key'],
            $config_website['seo_description'], $config_website['avatar'], base_uri()));
        $homeData = $this->getCatHome();
        $this->view->setVars([
           'cat_home_data' => $homeData
        ]);
    }

    public function getCatHome(){
        $catObj = new \Category();
        $rsDataHome = $catObj->getDataListCatPageHome();
//        d($rsDataHome->data[2]->product);
        if($rsDataHome->status) return $rsDataHome->data;

    }

}

