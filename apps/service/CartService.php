<?php
/**
 * Created by PhpStorm.
 * User: admin
 * Date: 6/29/2018
 * Time: 11:29 AM
 */
class CartService extends \Phalcon\Di\Injectable {
    public function getContent(){
        $listProduct = $this->session->get('cart');
        return $listProduct;
    }

    public function getTotalProduct(){
        $listProduct = $this->session->get('cart');
        return array_sum(array_column($listProduct, 'quantity'));
    }

    public function getTotalPrice(){
        $listProduct = $this->session->get('cart');
        return array_sum(array_column($listProduct, 'total_price'));
    }


}