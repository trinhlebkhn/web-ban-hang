<?php
/**
 * Created by PhpStorm.
 * User: admin
 * Date: 5/30/2018
 * Time: 10:34 AM
 */

namespace Graduate\Backend\Controllers;


use Phalcon\Cache\Frontend\Json;

class BillController extends AuthorizedControllerBase
{
    public function initialize()
    {
        parent::initialize();
        $viettelPostService = new \ViettelPostService();
        $loginVTP = $viettelPostService->login();
        if ($loginVTP->status == 200) {
            $this->session->set('vtp_data', json_encode($loginVTP->data));
        } else {
            $this->flash->error($loginVTP->message);
        }
    }

    public function indexAction()
    {

        $strSeach = $this->request->get('q');
        $sttSeach = $this->request->get('stt');
        $typeSeach = $this->request->get('type');

        $query = $this->request->getQuery();
        $page = $query['p'] ? $query['p'] : 1;
        $billObj = new \Bill();
        $optional = [
            'p' => $page,
            'limit' => 10
        ];

        if ($this->request->getPost()) {
            $strSeach = $this->request->getPost('q');
            $sttSeach = $this->request->getPost('stt');
        }
        $filter = [];
        if (!empty($strSeach) || !empty($sttSeach) || !empty($typeSeach)) {
            $filter = $this->checkQueryBill($strSeach, $sttSeach, $typeSeach);
        }
        if (!empty($filter)) {
            $optional['q'] = $filter['query'];
            $this->view->paramSearch = $filter['paramSearch'];
            if (!empty($strSeach)) {
                $this->view->StrSearch = $strSeach;
            }
            if (!empty($sttSeach)) {
                $this->view->SttSearch = $sttSeach;
            }
        }
//        d($optional['q']);
        $rs = $billObj->getListObj($optional);
        if ($rs->status) {
            $this->view->setVars([
                'listBill' => $rs->data,
                'Paginginfo' => $rs->optional,
                'Current_link' => $query['_url']
            ]);
        } else {
            return $this->flash->error('Có lỗi hệ thống xảy ra!');
        }
    }

    public function detailAction($id)
    {
        $billObj = new \Bill();
        $rs = $billObj->getDetail($id);
        $data = $rs->data;
        if(!empty($data['order_number_vtp'])) {
            $vtpObj = new \ViettelPostService();
            $vtpData = json_decode($this->session->get('vtp_data'));
            $listOrderTracking = $vtpObj->getListOrderTracking($vtpData->token, $data['order_number_vtp']);
        }

        if ($this->request->isPost()) {
            $data = $rs->data;
            $payment = $this->request->getPost('payment');
            $data['date_create'] = time($data['date_create']);
            $data['date_payment'] = time();
            $data['payment'] = $payment;
            $data['status'] = 2;
            $billObj->updateObj($data);
            $rs = $billObj->getDetail($id);
        }
        if (!$rs->status) {
            $this->flash->error($rs->message);
            return;
        }
        $this->view->setVars([
            'data' => $data,
            'listOrderTracking' => $listOrderTracking
        ]);
    }

    public function changeStatusAction($status, $id)
    {
        $billObj = new \Bill();
        $data = [
            'id' => $id,
            'status' => $status
        ];
        $billObj->updateObj($data);
        $this->response->redirect(base_uri() . '/quan-tri/hoa-don');
    }

    public function zaloAction()
    {
        $zaloService = new \ZaloService();
        $resGetListOrder = $zaloService->getListOrder();
        $listData = [];
        if ($resGetListOrder['errorCode'] == 1) {
            $listData = $resGetListOrder['data']['orders'];
        } else return $this->flash->error($resGetListOrder['errorMsg']);

        $this->view->setVars([
            'listBill' => $listData
        ]);
    }

    public function detailOrderZaloAction()
    {
        $id = $this->request->get('id');
        $zaloService = new \ZaloService();
        $resGetData = $zaloService->getDetailOrder($id);
        if ($resGetData['errorCode'] !== 1) return $this->flash->error($resGetData['errorMsg']);
        d($resGetData['data']);
        $this->view->data = $resGetData['data'];
    }

    public function createOrderVtpAction($id)
    {
        $billObj = new \Bill();
        /* Chi tiết đơn hàng */
        $rs = $billObj->getDetail($id);
        $order = $rs->data;
        if ($order['status'] != '2') $this->response->redirect(base_uri() . '/quan-tri/chi-tiet-hoa-don-hd' . $order['id']);

        /* Thông tin kho hàng */
        $vtp_data = json_decode($this->session->get('vtp_data'));
        $vtpObj = new \ViettelPostService();
        $rsWarehouse = $vtpObj->getListStore($vtp_data->token);
        foreach ($rsWarehouse->data as $item) {
            if ($item->groupaddressId == $order['vtp_warsehouse']) $warehouseData = $item;
            break;
        }

        global $config;

        $totalWeight = 0;
        $listProduct = [];
        foreach ($order['list_product'] as $product) {
            $productVtp = [];
            $productVtp['PRODUCT_NAME'] = $product['product_name'];
            $productVtp['PRODUCT_PRICE'] = $product['price'];
            $productVtp['PRODUCT_QUANTITY'] = $product['quantity'];
            if (!empty($product['weight'])) {
                $totalWeight += $product['weight'];
                $productVtp['PRODUCT_WEIGHT'] = $product['weight'];
            } else {
                $totalWeight += 100;
                $productVtp['PRODUCT_WEIGHT'] = 100;
            }
            array_push($listProduct, (object)$productVtp);
        }
        $body = [
            "ORDER_NUMBER" => $order['id'],
            "GROUPADDRESS_ID" => $warehouseData->groupaddressId,
            "CUS_ID" => $warehouseData->cusId,
            "SENDER_FULLNAME" => "Watch Shop",
            "SENDER_ADDRESS" => $warehouseData->address,
            "SENDER_PHONE" => $warehouseData->phone,
            "SENDER_EMAIL" => $config->viettel_post->email,
            "SENDER_WARD" => $warehouseData->wardsId,
            "SENDER_DISTRICT" => $warehouseData->districtId,
            "SENDER_PROVINCE" => $warehouseData->provinceId,
            "RECEIVER_FULLNAME" => $order['customer_name'],
            "RECEIVER_ADDRESS" => $order['address'],
            "RECEIVER_PHONE" => $order['phone'],
            "RECEIVER_EMAIL" => $order['email'],
            "RECEIVER_DISTRICT" => $order['district_id'],
            "RECEIVER_PROVINCE" => $order['province_id'],
            "PRODUCT_NAME" => "Đồng hồ",
            "PRODUCT_DESCRIPTION" => "Đồng hồ chất lượng cao.",
            "PRODUCT_QUANTITY" => 1,
            "PRODUCT_PRICE" => $order['total_price'] + $order['ship_price'] - $order['payment'],
            "PRODUCT_WEIGHT" => $totalWeight,
            "PRODUCT_TYPE" => "HH",
            "ORDER_PAYMENT" => 3,
            "ORDER_SERVICE" => $order['service_transport'],
            "ORDER_NOTE" => "Cho kiểm tra hàng trước khi thanh toán.",
            "MONEY_COLLECTION" => $order['price'] / 2,
//            "MONEY_TOTALFEE" => 0,
//            "MONEY_FEECOD" => 0,
//            "MONEY_FEEVAS" => 0,
//            "MONEY_FEEINSURRANCE" => 0,
//            "MONEY_FEE" => 0,
//            "MONEY_FEEOTHER" => 0,
//            "MONEY_TOTALVAT" => 0,
//            "MONEY_TOTAL" => 0,
            "LIST_ITEM" => $listProduct
        ];

        /* Tạo vận đơn */
        $rsCreateTransportOrder = $vtpObj->createOrder($vtp_data->token, json_encode($body));
        if($rsCreateTransportOrder->status == 200) {
            $dataUpdate =[
                'id' => $order['id'],
                'order_number_vtp' => (int)$rsCreateTransportOrder->data->ORDER_NUMBER,
                'status' => 3,
            ];
            $rsUpdate = $billObj->updateObj($dataUpdate);
            if($rsUpdate->status) $this->response->redirect(base_uri() . '/quan-tri/chi-tiet-hoa-don-hd' . $order['id']);
            else  $this->flash->error($rsUpdate->message);
        } else {
            $this->flash->error($rsCreateTransportOrder->message);
        }
    }
}