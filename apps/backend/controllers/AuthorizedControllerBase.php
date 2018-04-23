<?php
namespace Graduate\Backend\Controllers;
use Phalcon\Mvc\Controller;
/**
 * Created by PhpStorm.
 * User: admin
 * Date: 1/26/2018
 * Time: 4:37 PM
 */
class AuthorizedControllerBase extends ControllerBase
{
    function initialize()
    {
        if (!$this->isLoggedIn()) {
            $this->response->redirect(base_uri() . '/dang-nhap');
        }
//        $user = $this->getAuth();
//        $agency = new Agency();
//        $agencyInfo = $agency->getAgencyInfoByUserId($user['user_id']);
//
//        if (empty($agencyInfo) || $agencyInfo['status'] == 1) {
//
//            $this->session->destroy();
//
//            if ($agencyInfo['status'] == 1) {
//                $this->flash->error("Tài khoản đại lý này đang dừng hoạt động!");
//            } else {
//                $this->flash->error("Tài khoản này không phải là đại lý!");
//            }
//
//            $this->response->redirect(base_uri() . '/dang-nhap');
//        }
//
//        $this->setAgency($agencyInfo);
//        $this->view->AgencyInfo = (object)$agencyInfo;
    }

}