<?php
/**
 * Created by PhpStorm.
 * User: admin
 * Date: 6/19/2018
 * Time: 4:45 PM
 */

namespace Graduate\Frontend\Controllers;
class ProductController extends ControllerBase {
    public function detailAction($id) {
        $productObj = new \Product();
        $rs = $productObj->getDetail($id);
        $data = $rs->data;
        $data['attribute'] = json_decode($data['attribute']);
        $optional = [
            'q' => 'category_id = ' . $rs->data['category_id'] . ' and id != ' . $id,
            'limit' => 8
        ];
        $productRelateds = $productObj->getListObj($optional);
        $config_website = $this->getConfig();
        $this->setHeader(new \Header($data['seo_title'], $data['seo_key'], $data['seo_description'], $config_website['avatar'], base_uri()));
        $this->view->setVars([
            'product' => $data,
            'relatedProducts' => $productRelateds->data
        ]);
    }
}