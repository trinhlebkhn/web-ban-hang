<?php
/**
 * Created by PhpStorm.
 * User: admin
 * Date: 6/19/2018
 * Time: 4:45 PM
 */

namespace Graduate\Frontend\Controllers;
class ProductController extends ControllerBase {
    public function detailAction($slug, $id) {
        $productObj = new \Product();
        $rs = $productObj->getDetail($id);
//        d($rs->data);
        $data = $rs->data;
        $data['attribute'] = json_decode($data['attribute']);
//        d($data['attribute']);
        $optional = [
            'q' => 'category_id = ' . $rs->data['category_id'] . ' and id != ' . $id
        ];
        $productRelateds = $productObj->getListObj($optional);

        $this->view->setVars([
            'product' => $data,
            'relatedProducts' => $productRelateds->data
        ]);
    }
}