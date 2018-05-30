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
//            'limit' => 10
        ];

        if ($this->request->getPost()) {
            $strSeach = $this->request->getPost('q');
            $sttSeach = $this->request->getPost('stt');
            $typeSeach = $this->request->getPost('type');
        }
        $filter = [];
        if (!empty($strSeach) || !empty($sttSeach) || !empty($typeSeach)) {
            $filter = $this->checkQuery($strSeach, $sttSeach, $typeSeach);
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
            if(!empty($typeSeach)) {
                $this->view->TypeSearch = $typeSeach;
            }
        }
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
        if(!$rs->status) {
            $this->flash->error($rs->message);
            return;
        }
        $this->view->data = $rs->data;
    }
}