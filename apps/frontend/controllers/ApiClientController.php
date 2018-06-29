<?php
/**
 * Created by PhpStorm.
 * User: admin
 * Date: 6/28/2018
 * Time: 4:00 PM
 */

namespace Graduate\Frontend\Controllers;
class ApiClientController extends ControllerBase {
    public function addProductAction() {
//        unset($_SESSION['cart']);
        $listProduct = $this->session->get('cart');
        if(empty($listProduct)) {
            $listProduct = [];
        }
        $product = $this->request->get('product');
        $listId = array_column($listProduct, 'id');
        if(in_array($product['id'], $listId)){
            $index = array_search($product['id'], $listId);
            $listProduct[$index]['quantity'] += $product['quantity'];
            $listProduct[$index]['total_price'] += $product['total_price'];
        } else {
            array_push($listProduct, $product);
        }
        $this->session->set('cart', $listProduct);

        $render = $this->render_template('shopping', 'add_cart');
        $last_result = [
            'content' => $render,
            'message' => "Thao tác thành công!"
        ];
        return $this->response->setJsonContent($last_result);
    }

    public function deleteProductAction(){
        $id = $this->request->get('id');
        $listProduct = $this->session->get('cart');
        $listId = array_column($listProduct, 'id');
        $index = array_search($id, $listId);
        array_splice($listProduct, $index, 1);
        $this->session->set('cart', $listProduct);
        $render = $this->render_template('shopping', 'add_cart');
        $last_result = [
            'content' => $render,
            'message' => "Thao tác thành công!"
        ];
        return $this->response->setJsonContent($last_result);
    }
}