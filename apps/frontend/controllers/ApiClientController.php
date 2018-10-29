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
            'status' => '1',
            'content' => $render,
            'message' => "Thao tác thành công!",
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
            'status' => '1',
            'content' => $render,
            'total_product' => count($listProduct),
            'total_price' => $this->cart->getTotalPrice(),
            'message' => "Thao tác thành công!"
        ];
        return $this->response->setJsonContent($last_result);
    }

    public function updateProductAction(){
        $id = $this->request->get('id');
        $qty = $this->request->get('qty');
        $listProduct = $this->session->get('cart');
        foreach ($listProduct as &$product) {
            if($product['id'] == $id) {
                $product['quantity'] = $qty;
                $product['total_price'] = $qty * $product['price_sell'];
                break;
            }
        }
        $this->session->set('cart', $listProduct);
        $render = $this->render_template('shopping', 'add_cart');
        $last_result = [
            'status' => '1',
            'content' => $render,
            'total_price' => $this->cart->getTotalPrice(),
            'message' => "Thao tác thành công!"
        ];
        return $this->response->setJsonContent($last_result);
    }

    public function getDistrictsAction(){
        $city_id = $this->request->getPost('id');
        $districtObj = new \District();
        $rs = $districtObj->getListObj($city_id);
        if($rs->status) {
            $render = $this->render_template('shopping', 'district', [
                'data' => $rs->data,
            ]);
            return $this->response->setJsonContent($render);
        }
    }

    public function getWardsAction(){
        $district_id = $this->request->getPost('id');
        $wardObj = new \Ward();
        $rs = $wardObj->getListObj($district_id);
        if($rs->status) {
            $render = $this->render_template('shopping', 'ward', [
                'data' => $rs->data,
            ]);
            return $this->response->setJsonContent($render);
        }
    }
}