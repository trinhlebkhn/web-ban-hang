<?php

namespace Graduate\Frontend\Controllers;

use Phalcon\Mvc\Controller;

class ControllerBase extends Controller
{
    public function initialize()
    {
        global $config;
        $this->session->start();
        $mainMenu = $this->getMainMenu();
        $auth = $this->getAuth();
        $config_website = $this->getConfig();
        $this->view->setVars([
            'mainMenu' => $mainMenu,
            'auth' => $auth,
            'websiteConfig' => $config_website
        ]);

    }

    public function getMainMenu()
    {
        $menuBlockObj = new \MenuBlock();
        $optional = [
            'q' => 'is_main=1'
        ];
        $rsMainBlock = $menuBlockObj->getListObj($optional);
        $menuObj = new \Menu();
        $rsMainMenu = $menuObj->getListObj($rsMainBlock->data[0]['id']);
        return $rsMainMenu->data;
    }

    public function getConfig()
    {
        $configObj = new \Config();
        $rsConfig = $configObj->getConfig('1');
        $data = $rsConfig->data;
        $data['list_block_menu_footer'] = $this->getListBlockMenuFooter(json_decode($data['list_block_menu_footer']));
        $data['menu_bottom_footer'] = $this->getMenuBottomFooter($data['block_menu_bottom_footer']);
        $data['sliders'] = json_decode($data['sliders']);
        $data['advances'] = json_decode($data['advances']);
        $data['branch'] = json_decode($data['branch']);
        return $data;
    }

    public function getListBlockMenuFooter($arrayBoxMenuFooter = []){
        $queryArray = '(';
        foreach ($arrayBoxMenuFooter as $key => $value) {
            $key != (count($arrayBoxMenuFooter) - 1) ? $queryArray .= $value . ',' :  $queryArray .= $value;
        }
        $queryArray .= ')';
        /* Lấy thông tin block menu */
        $query_box_menu['q'] = 'id in ' . $queryArray;
        $menuBlockObj = new \MenuBlock();
        $rsBlockMenuFooter = $menuBlockObj->getListObj($query_box_menu);
        $listBlockMenuFooter = $rsBlockMenuFooter->data;

        /* Lấy thông tin menu */
        $menuObj = new \Menu();
        $rsGetMenuFooter = $menuObj->getMenuInArrayBoxMenu($queryArray);
        $listMenuFooter = $rsGetMenuFooter->data;

        /* Thông tin cuối cùng */
        foreach ($listBlockMenuFooter as &$value) {
            $value['list_menu'] = [];
            foreach ($listMenuFooter as $k => $v) {
                if($v['menu_block_id'] == $value['id']){
                    array_push($value['list_menu'], $v);
                    unset($listMenuFooter[$k]);
                }
            }
        }

        return $listBlockMenuFooter;
    }

    public function getMenuBottomFooter($block_menu_bottom_footer){
        $menuObj = new \Menu();
        $rs = $menuObj->getListObj($block_menu_bottom_footer);
        return $rs->data;
    }

    public function getCart()
    {
        $cart = $this->session->get('cart');
//        d($cart);
        return $cart;
    }

    public function render_template($controller, $action, $data = null)
    {
        $view = $this->view;
        $content = $view->getRender($controller, $action, ["object" => $data], function ($view) {
            $view->setRenderLevel(\Phalcon\Mvc\View::LEVEL_LAYOUT);
        });
        return $content;
    }

    public function setAuth($data)
    {
        $this->session->set('auth', $data);
    }

    public function getAuth()
    {
        return $this->session->get('auth');
    }

    public function setPay($data)
    {
        $this->session->set('pay', $data);
    }

    public function getPay()
    {
        return $this->session->get('pay');
    }
}
