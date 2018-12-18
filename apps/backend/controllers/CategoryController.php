<?php
/**
 * Created by PhpStorm.
 * User: hdba1
 * Date: 4/25/2018
 * Time: 2:39 AM
 */

namespace Graduate\Backend\Controllers;


use function GuzzleHttp\Psr7\str;

class CategoryController extends AuthorizedControllerBase
{
    public function indexAction()
    {
        $strSeach = $this->request->get('q');
        $sttSeach = $this->request->get('stt');
        $typeSeach = $this->request->get('type');

        $query = $this->request->getQuery();
        $page = $query['p'] ? $query['p'] : 1;
        $catObj = new \Category();
        $optional = [
            'p' => $page,
            'limit' => 10,
        ];

        if ($this->request->getPost()) {
            $strSeach = $this->request->getPost('q');
            $sttSeach = $this->request->getPost('stt');
            $typeSeach = $this->request->getPost('type');
        }
        $filter = [];
        if (!empty($strSeach) || !empty($sttSeach) || !empty($typeSeach)) {
            $filter = $this->checkQuery($strSeach, $sttSeach, $typeSeach);
        }
        if(!empty($filter)){
            $optional['q'] = $filter['query'];
            $this->view->paramSearch = $filter['paramSearch'];
            if(!empty($strSeach)) {
                $this->view->StrSearch = $strSeach;
            }
            if(!empty($sttSeach)) {
                $this->view->SttSearch = $sttSeach;
            }
            if(!empty($typeSeach)) {
                $this->view->TypeSearch = $typeSeach;
            }
        }
        $rs = $catObj->getListObj($optional);
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
                $data['slug'] = $this->create_url_slug($data['name']);
                $rs = $catObj->updateCat($data);
            } else {
                $data['slug'] = $this->create_url_slug($data['name']);
                $data['del_flag'] = 0;
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

    public function deleteAction()
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