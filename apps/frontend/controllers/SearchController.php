<?php
/**
 * Created by PhpStorm.
 * User: trinhln
 * Date: 12/13/2018
 * Time: 11:32 AM
 */

namespace Graduate\Frontend\Controllers;


class SearchController extends ControllerBase
{
    public function indexAction()
    {
        $strSearch = $this->request->get('strSearch');
        $orderBy = $this->request->get('order_by');
        $query = $this->request->getQuery();
        $page = $query['p'] ? $query['p'] : 1;
        $productObj = new \Product();
        $optional = [
            'limit' => 16,
            'p' => $page,
            'q' => 'status = 1 and del_flag = 0'
        ];

        if ($this->request->isPost()) {
            $strSearch = $this->request->getPost('strSearch');
            $orderBy = $this->request->getPost('order_by');
        }
        $paramSearch = '';
        if (!empty($strSearch)) {
            $optional['q'] .= ' and name like "%' . $strSearch . '%"';
            $paramSearch .= "&strSearch=" . $strSearch;
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

        if (!empty($query)) $this->view->query = $query;
        $this->view->setVars([
            'listData' => $rs->data,
            'Paginginfo' => $rs->optional,
            'Current_link' => $query['_url'],
            'paramSearch' => $paramSearch
        ]);
    }

}