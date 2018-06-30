<?php
namespace Graduate\Frontend\Controllers;
use Phalcon\Mvc\Controller;

class ControllerBase extends Controller
{
    public function initialize()
    {
        $this->session->start();
        $mainMenu = $this->getMainMenu();
        $auth = $this->getAuth();
        $this->view->setVars([
           'mainMenu' => $mainMenu,
           'auth' => $auth
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

    public function setAuth($data){
        $this->session->set('auth', $data);
    }

    public function getAuth(){
        return $this->session->get('auth');
    }

    public function setPay($data){
        $this->session->set('pay', $data);
    }

    public function getPay(){
        return $this->session->get('pay');
    }
}
