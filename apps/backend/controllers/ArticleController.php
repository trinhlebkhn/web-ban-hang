<?php
/**
 * Created by PhpStorm.
 * User: An Viet Computer
 * Date: 10/16/2018
 * Time: 11:26 PM
 */

namespace Graduate\Backend\Controllers;


class ArticleController extends AuthorizedControllerBase
{
    public function indexAction(){
        $strSeach = $this->request->get('q');
        $sttSeach = $this->request->get('stt');
        $query = $this->request->getQuery();
        $page = $query['p'] ? $query['p'] : 1;

        $articleObj = new \Article();
        $optional = [
            'limit' => 10,
            'p' => $page,
        ];
        if ($this->request->getPost()) {
            $strSeach = $this->request->getPost('q');
            $sttSeach = $this->request->getPost('stt');
        }

        if (!empty($strSeach) || !empty($sttSeach)) {
            $filter = $this->checkQuery($strSeach, $sttSeach, null);
        }

        if (!empty($filter)) {
            $optional['q'] = $filter['query'];
            $this->view->paramSearch = $filter['paramSearch'];
            if (!empty($strSeach)) {
                $this->view->StrSearch = $strSeach;
            }
            if (!empty($sttSeach)) {
                $this->view->SttSearch = $sttSeach;
            }
        }

        $rs = $articleObj->getListObj($optional);
        if (!$rs->status) {
            $this->flash->error($rs->message);
            return;
        }
        $this->view->setVars([
            'listData' => $rs->data,
            'Paginginfo' => $rs->optional,
            'Current_link' => $query['_url']
        ]);
    }

    public function addAction(){
        $id = $this->request->get('id');
        $articleObj = new \Article();
        if(!empty($id)) {
            $rs_detail = $articleObj->getDetail($id);
            if(!$rs_detail->status) return $this->flash->error($rs_detail->message);
            $this->view->data = $rs_detail->data;
        }
        $catObj = new \Category();
        $query_cat = [
            'q' => 'type = 2'
        ];
        $listCats = $catObj->getListObj($query_cat);
        $dataListCats = [];
        $this->recursiveCat($listCats->data, 0, $dataListCats);
        $this->view->listCats = $dataListCats;

        if($this->request->isPost()) {
            $data = $this->request->getPost('data');
            if(empty($data['content'])) {
                $this->view->data = $data;
                return $this->flash->error('Nội dung bài viết không được để trống.');
            }
            $data['slug'] = $this->create_url_slug($data['name']);

            if(empty($id)) $rs = $articleObj->createObj($data);
            else {
                $data['id'] = $id;
                $rs = $articleObj->updateObj($data);
            }
            if($rs->status) {
                $this->response->redirect(base_uri() . '/quan-tri/bai-viet');
            } else return $this->flash->error($rs->message);
        }
    }

    public function deleteAction()
    {
        $id = $this->request->get('id');
        $articleObj = new \Article();
        $rsGetDetail = $articleObj->getDetail($id);
        $obj = $rsGetDetail->data;
        $obj['del_flag'] = 1;
        $rs = $articleObj->updateObj($obj);
        if ($rs->status) {
            $this->flash->success('Thao tác thành công!');
        } else {
            $this->flash->error($rs->message);
        }
        $this->response->redirect(base_uri() . '/quan-tri/bai-viet');
    }

}