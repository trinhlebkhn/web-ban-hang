<?php
/**
 * Created by PhpStorm.
 * User: An Viet Computer
 * Date: 12/21/2018
 * Time: 12:21 AM
 */

namespace Graduate\Backend\Controllers;


class ContactController extends AuthorizedControllerBase
{
    public function indexAction(){
        $contactObj = new \Contact();
        $query = $this->request->getQuery();
        $page = $query['p'] ? $query['p'] : 1;
        $optional = [
            'p' => $page,
            'limit' => 10
        ];
        $rsGetData = $contactObj->getListObj($optional);
        if ($rsGetData->status) {
            $this->view->setVars([
                'listData' => $rsGetData->data,
                'Paginginfo' => $rsGetData->optional,
                'Current_link' => $query['_url']
            ]);
        } else {
            return $this->flash->error('Có lỗi hệ thống xảy ra!');
        }
    }
}