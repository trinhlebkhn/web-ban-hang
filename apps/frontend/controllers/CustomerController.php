<?php
/**
 * Created by PhpStorm.
 * User: admin
 * Date: 6/30/2018
 * Time: 9:50 AM
 */

namespace Graduate\Frontend\Controllers;
class CustomerController extends ControllerBase {
    public function indexAction(){
        $auth = $this->getAuth();
        $dob = explode('/', $auth['dob']);
        if($this->request->isPost()) {
            $data = $this->request->get('data');
            $dob = $this->request->get('dob');
            $data['dob'] = $dob['year'] . '-' . $dob['month'] . '-' . $dob['day'];
            $userObj = new \User();
            $rs = $userObj->updateObj($data);
            if($rs->status) {
                $data = $rs->data;
                $this->setAuth($rs->data);
                $this->flash->success($rs->message);
            } else {
                $this->flash->error($rs->message);
            }
            $dob = explode('/', $data['dob']);
            $this->view->data = $data;
        }
        $this->view->setVars([
            'day' => $dob[0],
            'month' => $dob[1],
            'year' => $dob[2]
        ]);
    }

    public function update_passwordAction(){

    }

    public function orderAction(){

    }

    public function order_detailAction($id){

    }
}