<?php
/**
 * Created by PhpStorm.
 * User: admin
 * Date: 4/24/2018
 * Time: 4:14 PM
 */

namespace Graduate\Backend\Controllers;
class AuthController extends ControllerBase {

    public function initialize()
    {
        $auth_admin = $this->getAdmin();
        $this->view->admin = $auth_admin;
    }

    public function loginAction() {
        if ($this->isLogin()) {
            return $this->response->redirect(base_uri() . '/quan-tri');
        }
        if($this->request->isPost()){
            $data = $this->request->get('dataLogin');
            $userObj = new \User();
            $rs = $userObj->checkLogin($data);
            if($rs->status){
                if($rs->data['role'] == 1){
                    $this->setAdmin($rs->data);
                    $this->response->redirect(base_uri() . '/quan-tri');
                } else {
                    $this->flash->error('Bạn không có quyền thực hiện chức năng này!');
                }
            } else {
                $this->flash->error($rs->message);
            }
        }
    }

    public function logoutAction() {
        $this->session->destroy();
        $this->response->redirect(base_uri() . '/quan-tri/dang-nhap');
    }

    public function list_userAction() {
        $strSeach = $this->request->get('q');
        $query = $this->request->getQuery();
        $page = $query['p'] ? $query['p'] : 1;
        $userObj = new \User();
        $optional = [
            'p' => $page,
            'limit' => 20,
            'q' => 'role != 1'
        ];
        if ($this->request->getPost()) {
            $strSeach = $this->request->getPost('q');
        }
        if (!empty($strSeach)) {
            $optional['q'] .= 'email like "%' . $strSeach . '%" or fullname like "%' . $strSeach .'%"';
            $paramSearch = '&q=' . $strSeach;
            $this->view->paramSearch = $paramSearch;
            $this->view->StrSearch = $strSeach;
        }
        $rs = $userObj->getListObj($optional);
        if ($rs->status) {
            $this->view->setVars([
                'listData' => $rs->data,
                'Paginginfo' => $rs->optional,
                'Current_link' => $query['_url']
            ]);
        } else {
            return $this->flash->error('Có lỗi hệ thống xảy ra!');
        }
    }

    public function detailAction($id){
        $userObj = new \User();
        $data = $userObj->getDetail($id);
        $this->view->data = $data->data;
    }
}