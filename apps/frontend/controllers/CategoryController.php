<?php
/**
 * Created by PhpStorm.
 * User: hdba1
 * Date: 6/19/2018
 * Time: 12:04 AM
 */

namespace Graduate\Frontend\Controllers;


class CategoryController extends ControllerBase
{
    public function productAction($id)
    {
        $query = $this->request->getQuery();
        $strSearch = $this->request->get('strSearch');
        $orderBy = $this->request->get('order_by');
        $page = $query['p'] ? $query['p'] : 1;

        $productObj = new \Product();
        $optional = [
            'limit' => 16,
            'p' => $page,
            'q' => 'status = 1 and del_flag = 0 and category_id = ' . $id
        ];

        if ($this->request->isPost()) {
            $strSearch = $this->request->getPost('strSearch');
            $orderBy = $this->request->getPost('order_by');
        }
        $paramSearch = '';

        if (!empty($strSearch)) {
            $optional['q'] .= ' and name like "%' . $strSearch . '%"';
            $paramSearch .= '&strSearch=' . $strSearch;
            $this->view->strSearch = $strSearch;
        }

        if (!empty($orderBy)) {
            $optional['order_by'] .= 'price_sell ' . $orderBy;
            $paramSearch .= '&order_by=' . $orderBy;
            $this->view->orderBy = $orderBy;
        }

        $rs = $productObj->getListObj($optional);
        if (!$rs->status) {
            $this->flash->error($rs->message);
            return;
        }

        $catObj = new \Category();
        $catData = $catObj->getDetail($id);

        $this->view->setVars([
            'catInfo' => $catData->data,
            'listData' => $rs->data,
            'Paginginfo' => $rs->optional,
            'Current_link' => $query['_url'],
            'paramSearch' => $paramSearch
        ]);
    }

    public function articleAction($id)
    {
        $query = $this->request->getQuery();
        $page = $query['p'] ? $query['p'] : 1;

        $articleObj = new \Article();
        $optional = [
            'limit' => 10,
            'p' => $page,
            'q' => 'status = 1 and del_flag = 0 and category_id = ' . $id
        ];
        $rs = $articleObj->getListObj($optional);
        if (!$rs->status) {
            $this->flash->error($rs->message);
            return;
        }
        $catObj = new \Category();
        $catData = $catObj->getDetail($id);
        $this->view->setVars([
            'catInfo' => $catData->data,
            'listData' => $rs->data,
            'Paginginfo' => $rs->optional,
            'Current_link' => $query['_url']
        ]);
    }

}