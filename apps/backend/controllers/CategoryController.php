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
        $query = $this->request->getQuery();
        $page = $query['p'] ? $query['p'] : 1;
        $catObj = new \Category();
        $optional = [
            'p' => $page,
            'limit' => 10
        ];

        if ($this->request->getPost()) {
            $data = $this->request->get('category');
            if (empty($data['name'])) {
                return $this->flash->error('Tên danh mục không được để trống');
            } else {
                $rs = $catObj->createObj($data);
                if ($rs->status) {
                    $this->flash->success('Thêm mới danh mục thành công');
                }
            }
        }
        $rs = $catObj->getListObj($optional);
//        d($rs);
        if ($rs->status) {
            $this->view->setVars([
                'listCat' => $rs->data,
                'Paginginfo' => $rs->optional,
                'Current_link' => $query['_url']
            ]);
        } else {
            return $this->flash->error('Có lỗi hệ thống xảy ra!');
        }
    }

    public function updateAction()
    {
        $id = $this->request->get('id');
        $catObj = new \Category();
        if ($id != null) {
            $rs = $catObj->getDetail($id);
            if ($rs->status) {
                $this->view->data = $rs->data;
            }
        }
        $listData = $catObj->getListObj($id);
        if ($listData->status) {
            $this->view->listCat = $listData->data;
        }

        if ($this->request->isPost()) {
            $data = $this->request->get('category');
            if ($id != null) {
                $data['id'] = $id;
                $rs = $catObj->updateCat($data);
            } else {
                $rs = $catObj->createObj($data);
            }
            if ($rs->status) {
                $this->response->redirect(base_uri() . '/quan-tri/danh-muc');
                $this->flash->success($rs->message);
            } else {
                $this->flash->error($rs->message);
            }
        }
    }

    public function deleteCategoryAction()
    {
        $id = $this->request->get('id');
        $catObj = new \Category();
        $data = $catObj->getDetail($id);
        $obj = $data->data;
        $obj['del_flag'] = 1;
        $rs = $catObj->updateCat($obj);
        if ($rs->status) {
            $this->flash->success($rs->message);
        } else {
            $this->flash->error($rs->message);
        }
        $this->response->redirect(base_uri() . '/quan-tri/danh-muc');
    }
}