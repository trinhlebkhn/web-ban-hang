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
    public function productAction($slug, $id)
    {
        $query = $this->request->getQuery();
        $page = $query['p'] ? $query['p'] : 1;

        $productObj = new \Product();
        $optional = [
            'limit' => 16,
            'p' => $page,
            'q' => 'category_id = ' . $id
        ];

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
            'Current_link' => $query['_url']
        ]);
    }

    public function articleAction($id)
    {
        d(2);
    }

}