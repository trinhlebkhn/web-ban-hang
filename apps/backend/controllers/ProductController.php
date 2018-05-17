<?php
/**
 * Created by PhpStorm.
 * User: admin
 * Date: 4/24/2018
 * Time: 5:24 PM
 */

namespace Graduate\Backend\Controllers;


class ProductController extends AuthorizedControllerBase
{
    public function indexAction()
    {
        $query = $this->request->getQuery();
        $page = $query['p'] ? $query['p'] : 1;

        $productObj = new \Product();
        $optional = [
            'limit' => 10,
            'p' => $page,
        ];
        $rs = $productObj->getListObj($optional);
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

    public function addAction()
    {
        $productObj = new \Product();
        $id = $this->request->get('id');
        if (!empty($id)) {
            $obj = $productObj->getDetail($id);
            if (!$obj->status) {
                return $this->flash->error($obj->message);
            }
            $data = $obj->data;
            $data['category_id'] = explode(',', $data['category_id']);
            $this->view->data = $data;
//            d($this->view->data);
        }
        $catObj = new \Category();
        $query_cat = [
            'q' => 'type = 1'
        ];
        $listCats = $catObj->getListObj($query_cat);
        $dataListCats = [];
        $this->recursiveCat($listCats->data, 0, $dataListCats);
        $this->view->listCats = $dataListCats;

        if ($this->request->isPost()) {
            $data = $this->request->get('product');
            if (empty($data['name'] || empty($data['price_sell'] || empty($data['price_import'])))) {
                $this->view->data = $data;
                $this->flash->error('Vui lòng điền đầy đủ các trường bắt buộc');
                return;
            }

            /* Xử lý danh mục */
            if (!empty($data['category_id'])) {
                $list_cat_id = '';
                foreach ($data['category_id'] as $v => $item) {
                    $list_cat_id .= $item . ',';
                }
                $list_cat_id = rtrim($list_cat_id, ',');
                $data['category_id'] = $list_cat_id;
            }

            /* Xử lý đưa về dạng int  */
            $data['price'] = intval($data['price']);
            $data['price_sell'] = intval($data['price_sell']);
            $data['price_import'] = intval($data['price_import']);
            $data['discount'] = intval($data['discount']);

            if (empty($id)) {
                $data['slug'] = $this->create_url_slug($data['name']);
                $rs = $productObj->createObj($data);
            } else {
                $data['slug'] = $this->create_url_slug($data['name']);
                $rs = $productObj->updateObj($data);
            }

            if ($rs->status) {
                $this->response->redirect(base_uri() . '/quan-tri/san-pham');
                $this->flash->success($rs->message);
            } else {
                $data['category_id'] = explode(',', $data['category_id']);
                $this->view->data = $data;
                $this->flash->error($rs->message);
            }
        }
    }

    public function deleteAction()
    {
        $id = $this->request->get('id');
        $product = new \Product();
        $data = $product->getDetail($id);
        $obj = $data->data;
        $obj['del_flag'] = 1;
        $rs = $product->updateObj($obj);
        if ($rs->status) {
            $this->flash->success($rs->message);
        } else {
            $this->flash->error($rs->message);
        }
        $this->response->redirect(base_uri() . '/quan-tri/san-pham');
    }

    public function recursiveCat($data, $parent_id = 0, &$array, $char = '')
    {
        foreach ($data as $key => $item) {
            if ($item['parent_id'] == $parent_id) {
                $item['name'] = $char .'|-- '.  $item['name'];
                $array[] = $item;
                unset($data[$key]);
                $this->recursiveCat($data, $item['id'], $array, $char.'&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp');
            }
        }
    }
}