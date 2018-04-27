<?php
/**
 * Created by PhpStorm.
 * User: hdba1
 * Date: 4/25/2018
 * Time: 2:39 AM
 */

namespace Graduate\Backend\Controllers;


class CategoryController extends AuthorizedControllerBase
{
    public function indexAction()
    {
        $catObj = new \Category();
        $rs = $catObj->getListObj();
        if($rs->status){
            $this->view->listCat = $rs->data;
        } else{
            return $this->flash->error('Có lỗi hệ thống xảy ra!');
        }
        if($this->request->getPost()){
            $data = $this->request->get('category');
            if(empty($data['name'])){
                return $this->flash->error('Tên danh mục không được để trống');
            } else {
                $rs = $catObj->createObj($data);
                if($rs->status){
                    $this->flash->success('Thêm mới danh mục thành công');
                }
            }
        }
    }

    public function getListCategoryAction(){
        $catObj = new \Category();
        $rs = $catObj->getListObj();
        if($rs->status){
            $this->view->listCat = $rs->data;
        } else{
            return $this->flash->error('Có lỗi hệ thống xảy ra!');
        }
        $json_data = array(
            "draw" => intval($_REQUEST['draw']),
            "recordsTotal" => 10,
            "recordsFiltered" => 10,
            'data' => (object)[
                'id' => 1,
                'fullname' => 1,
                'phone' => 1,
                'email' => 1,
                'address' => 1
            ]
        );
        return json_encode($json_data);
    }
    public function addAction(){
        d(1);
    }
}