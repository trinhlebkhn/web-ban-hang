<?php
/**
 * Created by PhpStorm.
 * User: An Viet Computer
 * Date: 12/12/2018
 * Time: 12:57 AM
 */

namespace Graduate\Frontend\Controllers;


class ArticleController extends ControllerBase
{
    public function indexAction(){
        $query = $this->request->getQuery();
        $page = $query['p'] ? $query['p'] : 1;
        $articleObj = new \Article();
        $optional = [
            'limit' => 10,
            'p' => $page,
        ];
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

    public function detailAction($id) {
        $articleObj = new \Article();
        $rs = $articleObj->getDetail($id);
        $optional = [
            'q' => 'category_id = ' . $rs->data['category_id'] . ' and id != ' . $id,
            'limit' => 4
        ];
        $articleRelateds = $articleObj->getListObj($optional);

        $this->view->setVars([
            'detailArticle' => $rs->data,
            'listArticle' => $articleRelateds->data
        ]);
    }
}