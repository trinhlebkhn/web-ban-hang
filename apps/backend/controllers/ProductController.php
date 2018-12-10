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
        $strSeach = $this->request->get('q');
        $sttSeach = $this->request->get('stt');
        $query = $this->request->getQuery();
        $page = $query['p'] ? $query['p'] : 1;

        $productObj = new \Product();
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
        unset($_SESSION['listImg']);
        $productObj = new \Product();
        $id = $this->request->get('id');
        if (!empty($id)) {
            $obj = $productObj->getDetail($id);
            if (!$obj->status) {
                return $this->flash->error($obj->message);
            }
            $data = $obj->data;
//            $data['category_id'] = explode(',', $data['category_id']);
            $data['image'] = json_decode($data['image']);
            $data['attribute'] = json_decode($data['attribute']);
            $data['attribute_id'] = [];
            $data['attribute_value'] = [];
            foreach ($data['attribute'] as $key => $obj) {
                array_push($data['attribute_id'], (int)$obj->id);
                array_push($data['attribute_value'], $obj->value);
            }
            unset($data['attribute']);
//            d($data);
            $this->session->set('listImg', $data['image']);
            $this->view->data = $data;
        }
        $catObj = new \Category();
        $query_cat = [
            'q' => 'type = 1'
        ];
        $listCats = $catObj->getListObj($query_cat);
        $dataListCats = [];
        $this->recursiveCat($listCats->data, 0, $dataListCats);
        $this->view->listCats = $dataListCats;

        /* Thuộc tính sản phẩm */
        $attrObj = new \Attribute();
        $rsGetListAttr = $attrObj->getListObj();
//        d($data);
        $this->view->listAttr = $rsGetListAttr->data;

        if ($this->request->isPost()) {
            $data = $this->request->get('product');
            $data['image'] = json_encode($data['image']);

            /* Kiểm tra giá sản phâm */
            if ($data['price'] < $data['price_sell']) {
                $this->view->data = $data;
                return $this->flash->error('Gía niêm yết không được nhỏ hơn giá bán!');
            }

            // Kiểm tra sự trùng lặp thuộc tính
            $check = array_count_values($data['attribute_id']);
            foreach ($check as $value) {
                if ($value > 1) {
                    $this->view->data = $data;
                    return $this->flash->error('Có sự trùng lặp thuộc tính sản phẩm. Vui lòng kiểm tra lại!');
                }
            }

            /* Thuộc tính sản phẩm */
            $data['attribute'] = [];
            foreach ($data['attribute_id'] as $key => $value) {
                $obj = [];
                $obj['id'] = $value;
                $obj['value'] = $data['attribute_value'][$key];
                array_push($data['attribute'], $obj);
            }
            unset($data['attribute_id']);
            unset($data['attribute_value']);
            $data['attribute'] = json_encode($data['attribute']);
            if (empty($data['name'] || empty($data['price_sell'] || empty($data['price_import'])))) {
                $this->view->data = $data;
                $this->flash->error('Vui lòng điền đầy đủ các trường bắt buộc');
                return;
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
                $data['id'] = $id;
                $data['slug'] = $this->create_url_slug($data['name']);
                $rs = $productObj->updateObj($data);
            }

            if ($rs->status) {
                $this->response->redirect(base_uri() . '/quan-tri/san-pham');
                $this->flash->success($rs->message);
            } else {
//                $data['category_id'] = explode(',', $data['category_id']);
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


}