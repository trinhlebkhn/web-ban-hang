<?php
/**
 * Created by PhpStorm.
 * User: admin
 * Date: 6/29/2018
 * Time: 9:58 AM
 */

namespace Graduate\Frontend\Controllers;
class ShoppingController extends ControllerBase {
    public function cartAction(){
//        d($this->cart->getContent());
    }

    public function order_infoAction(){
        $total_product = $this->cart->getTotalProduct();
        if($total_product == 0){
            $this->response->redirect(base_uri() . '/');
        }
        $cityObj = new \City();
        $rsCities = $cityObj->getListObj();
        $this->view->setVars([
           'listCity' => $rsCities->data
        ]);

        if($this->request->isPost()) {
            $data = $this->request->getPost('info_payment');
            $auth = $this->session->get('auth');
            $data['email'] = $auth['email'];
            if($data['payment']  == 2 ) {
                $this->session->set('info_order', $data);
                $this->response->redirect(base_uri() . '/shopping/nlCheckout');
            }
        }
    }

    public function nlCheckoutAction(){
        $info = $this->session->get('info_order');
        $cart_data = $this->session->get('cart');
        $money = $this->cart->getTotalPrice() / 2;

        $nlcheckout = $this->nl_api;

        $this->view->setVars([
            'user_info' => $info,
            'money' => $money
        ]);
    }
}