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
        $productObj = new \Product();
        $rs = $productObj->getListObj();
        if (!$rs->status) {
            $this->flash->error($rs->message);
            return;
        }
        $this->view->listData = $rs->data;
    }

    public function addAction()
    {
        $productObj = new \Product();
        $id = $this->request->get('id');
        if(!empty($id)){
            $obj = $productObj->getDetail($id);
            if(!$obj->status){
                return $this->flash->error($obj->message);
            }
            $data = $obj->data;
            $data['category_id'] = explode(',', $data['category_id']);
            $this->view->data = $data;
//            d($this->view->data);
        }
        $catObj = new \Category();
        $listCats = $catObj->getListObj();
//       d($listCats->data);
        $this->view->listCats = $listCats->data;

        if ($this->request->isPost()) {
            $data = $this->request->get('product');
            if (empty($data['name'] || empty($data['price_sell'] || empty($data['price_import'])))) {
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

            if(empty($id)){
                $rs = $productObj->createObj($data);
            } else{
                $rs = $productObj->updateObj($data);
            }

            if ($rs->status) {
                $this->response->redirect(base_uri() . '/quan-tri/san-pham');
                $this->flash->success($rs->message);
            } else {
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
}