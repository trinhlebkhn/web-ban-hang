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

    }

    public function addAction()
    {
        $catObj = new \Category();
        $listCats = $catObj->getListObj();
//       d($listCats->data);
        $this->view->setVars([
            'listCats' => $listCats->data
        ]);
        if ($this->request->isPost()) {
            $productObj = new \Product();
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

            $rs = $productObj->createObj($data);
            if ($rs->status) {
                $this->flash->success('Thêm mới sản phẩm thành công!');
                $this->response->redirect(base_uri() . '/quan-tri/san-pham');
            } else {
                $this->flash->error($rs->message);
            }
        }
    }
}