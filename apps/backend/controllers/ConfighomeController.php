<?php
/**
 * Created by PhpStorm.
 * User: admin
 * Date: 6/1/2018
 * Time: 4:59 PM
 */

namespace Graduate\Backend\Controllers;
class ConfighomeController extends AuthorizedControllerBase {

    public function indexAction(){
        $catObj = new \Category();
        $optional['q'] = 'position like "home" ';
        $optional['o'] = 1;
        $listCatHome = $catObj->getListObj($optional);
        $this->view->listCat = $listCatHome->data;
    }

    public function deleteAction($id){
        $data = [
            'id' => $id,
            'position' => '',
        ];
        $catObj = new \Category();
        $rs = $catObj->updateCat($data);
        if($rs->status) {
            $this->response->redirect(base_uri() . '/quan-tri/cau-hinh-trang-chu');
        }
    }

}