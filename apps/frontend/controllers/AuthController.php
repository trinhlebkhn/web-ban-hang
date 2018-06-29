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

    }

    public function registerAction(){
        if($this->request->isPost()) {
            $data = $this->request->getPost('pageRegister');
            $data['password'] = md5($data['password']);
            $data['role'] = 1;
            $userObj = new \User();
            $rs = $userObj->createObj($data);
            if($rs->status) {

            } else {
                $this->flash->error($rs->message);
                $this->view->data = $data;
            }
        }
    }
}