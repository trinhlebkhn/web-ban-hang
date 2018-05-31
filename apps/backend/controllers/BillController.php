<?php
/**
 * Created by PhpStorm.
 * User: admin
 * Date: 5/30/2018
 * Time: 10:34 AM
 */

namespace Graduate\Backend\Controllers;


class BillController extends AuthorizedControllerBase {
    public function indexAction(){

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
        if(!empty($filter)){
            $optional['q'] = $filter['query'];
            $this->view->paramSearch = $filter['paramSearch'];
            if(!empty($strSeach)) {
                $this->view->StrSearch = $strSeach;
            }
            if(!empty($sttSeach)) {
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

    public function detailAction($id){
        $billObj = new \Bill();
        $rs = $billObj->getDetail($id);
        if ($this->request->isPost()){
            $data = $rs->data;
            $payment = $this->request->getPost('payment');
            $data['date_create'] = time($data['date_create']);
            $data['date_payment'] = time();
            $data['payment'] = $payment;
            $data['status'] = 3;
            $billObj->updateObj($data);
            $rs = $billObj->getDetail($id);
        }
        if(!$rs->status) {
            $this->flash->error($rs->message);
            return;
        }
        $this->view->data = $rs->data;
    }

    public function changeStatusAction($status, $id){
        $billObj = new \Bill();
        $data = [
            'id' => $id,
            'status' => $status
        ];
        $billObj->updateObj($data);
        $this->response->redirect(base_uri() . '/quan-tri/hoa-don');
    }
}