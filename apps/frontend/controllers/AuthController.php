<?php
/**
 * Created by PhpStorm.
 * User: admin
 * Date: 6/29/2018
 * Time: 1:54 PM
 */

namespace Graduate\Frontend\Controllers;
class AuthController extends ControllerBase {
    public function loginAction(){
        if($this->request->isPost()) {
            $data = $this->request->getPost('data');
            $userObj = new \User();
            $rs = $userObj->checkLogin($data);
            if($rs->status) {
                $this->setAuth($rs->data);
                $this->response->redirect(base_uri() . '/');
            } else {
                $this->view->data = $data;
                $this->flash->error($rs->message);
            }
        }
    }

    public function registerAction(){
        if($this->request->isPost()) {
            $data = $this->request->getPost('pageRegister');
            $dataDob = $this->request->getPost('pageRegister_birth');
            $data['role'] = 1;
            $data['dob'] = $dataDob['year'] . '-' . $dataDob['month'] . '-' . $dataDob['day'];
            $userObj = new \User();
            $rs = $userObj->createObj($data);
            if($rs->status) {
                $this->setAuth($rs->data);
                if(!$this->getPay()) {
                    $this->response->redirect(base_uri());
                } else {
                    $this->response->redirect(base_uri() . '/thanh-toan.html');
                }
            } else {
                $this->flash->error($rs->message);
                $this->view->data = $data;
            }
        }
    }

    public function logoutAction(){
        $this->session->destroy();
        $this->response->redirect(base_uri());
    }
}