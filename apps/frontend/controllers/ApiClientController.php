<?php
/**
 * Created by PhpStorm.
 * User: admin
 * Date: 6/28/2018
 * Time: 4:00 PM
 */

namespace Graduate\Frontend\Controllers;
class ApiClientController extends ControllerBase
{
    public function addProductAction()
    {
        $listProduct = $this->session->get('cart');
        if (empty($listProduct)) {
            $listProduct = [];
        }
        $product = $this->request->get('product');
        $listId = array_column($listProduct, 'id');
        if (in_array($product['id'], $listId)) {
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

    public function deleteProductAction()
    {
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

    public function updateProductAction()
    {
        $id = $this->request->get('id');
        $qty = $this->request->get('qty');
        $ship_price = $this->request->get('ship_price');
        $listProduct = $this->session->get('cart');
        foreach ($listProduct as &$product) {
            if ($product['id'] == $id) {
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
            'subtotal' => $this->cart->getTotalPrice(),
            'message' => "Thao tác thành công!"
        ];
        if($ship_price > 0) $last_result['total_price'] = $this->cart->getTotalPrice() + $ship_price;
        else $last_result['total_price'] = $this->cart->getTotalPrice();

        return $this->response->setJsonContent($last_result);
    }

    public function getDistrictsAction()
    {
        $city_id = $this->request->getPost('id');

        /* Get list District */
        $vtpObj = new \ViettelPostService();
        $rs = $vtpObj->getDistricts($city_id);
        if ($rs->status) {
            $render = $this->render_template('shopping', 'district', [
                'data' => $rs->data,
            ]);
            return $this->response->setJsonContent($render);
        }
    }

    public function getFeeTransportAction()
    {
        $addressReceive = $this->request->getPost('address_receive');
        $service = $this->request->getPost('service');
        $storehouse = $this->request->getPost('storehouse');
        $storehouse = json_decode($storehouse);
        $listProduct = $this->getCart();
        $totalWeight = 0;
        foreach ($listProduct as $item) {
            $totalWeight += empty($item['weight']) || $item['weight'] == 0 ? 100 : $item['weight'];
        }
        $price = $this->cart->getTotalPrice();
        $body = [
            "PRODUCT_WEIGHT" => $totalWeight,
            "PRODUCT_PRICE" => $price/2,
            "MONEY_COLLECTION" => 0,
            "ORDER_SERVICE" => $service,
            "SENDER_PROVINCE" => $storehouse->provinceId ,
            "SENDER_DISTRICT" => $storehouse->districtId ,
            "RECEIVER_PROVINCE" => $addressReceive['city_id'],
            "RECEIVER_DISTRICT" => $addressReceive['district'],
            "PRODUCT_TYPE" => "HH",
            "PRODUCT_QUANTITY" => 1,
            "NATIONAL_TYPE" => 1
        ];
        $viettelPostObj = new \ViettelPostService();
        $vtpToken = $this->session->get('vtp_token');
        $rs = $viettelPostObj->getPrice($vtpToken, $body);
        if(!empty($rs['ship_price'])) {
            $this->session->set('ship_price', $rs['ship_price']);
            $rs['total_price'] = $price + $rs['ship_price'];
        }
        return json_encode($rs);
    }
}