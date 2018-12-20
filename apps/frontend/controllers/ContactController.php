<?php
/**
 * Created by PhpStorm.
 * User: An Viet Computer
 * Date: 12/20/2018
 * Time: 11:30 PM
 */

namespace Graduate\Frontend\Controllers;


class ContactController extends ControllerBase
{
    public function indexAction(){
        if($this->request->isPost()) {
            $data = $this->request->getPost('data');
            $contactObj = new \Contact();
            $rs = $contactObj->createObj($data);
            if ($rs->status) $this->flash->success($rs->message);
            else $this->flash->error($rs->message);
        }
    }
}