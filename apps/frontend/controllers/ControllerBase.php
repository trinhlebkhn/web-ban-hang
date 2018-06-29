<?php
namespace Graduate\Frontend\Controllers;
use Phalcon\Mvc\Controller;

class ControllerBase extends Controller
{
    public function initialize()
    {

        $mainMenu = $this->getMainMenu();
        $this->view->setVars([
           'mainMenu' => $mainMenu
        ]);
    }

    public function getMainMenu(){
        $menuBlockObj = new \MenuBlock();
        $optional = [
            'q' => 'is_main=1'
        ];
        $rsMainBlock = $menuBlockObj->getListObj($optional);
        $menuObj = new \Menu();
        $rsMainMenu = $menuObj->getListObj($rsMainBlock->data[0]['id']);
        return $rsMainMenu->data;
    }

    public function getCart(){
        $cart = $this->session->get('cart');
//        d($cart);
    }

    public function render_template($controller, $action, $data = null)
    {
        $view = $this->view;
        $content = $view->getRender($controller, $action, ["object" => $data], function ($view) {
            $view->setRenderLevel(\Phalcon\Mvc\View::LEVEL_LAYOUT);
        });
        return $content;
    }
}
