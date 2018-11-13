<?php
/**
 * Created by PhpStorm.
 * User: hdba1
 * Date: 4/27/2018
 * Time: 10:53 PM
 */

namespace Graduate\Backend\Controllers;
class ApiClientController extends AuthorizedControllerBase
{
    public function uploadImageAction()
    {
        $image = $this->request->getUploadedFiles()[0];
        if (!isset($image)) {
            $rs = [
                'status' => '0',
                'data' => [],
                'message' => 'Có lỗi hệ thống xảy ra!',
            ];
            return $this->response->setJsonContent($rs);
        }
        $date = getdate();
        $dir_name = $date['mday'] . '_' . $date['mon'] . '_' . $date['year'];
        if (!file_exists('assets_backend/upload/' . $dir_name)) {
            mkdir('assets_backend/upload/' . $dir_name);
        }
        $img_name = $image->getName();
        if (file_exists('assets_backend/upload/' . $dir_name . '/' . $image->getName())) {
            $img_name = md5(uniqid(rand(), true)) . '_' . $image->getName();
        }
        if (move_uploaded_file($image->getTempName(), 'assets_backend/upload/' . $dir_name . '/' . $img_name)) {
            $rs = [
                'status' => '1',
                'data' => '/assets_backend/upload/' . $dir_name . '/' . $img_name,
                'message' => 'Thao tác thành công',
            ];
            return $this->response->setJsonContent($rs);
        }
    }

    public function uploadSlideProductAction()
    {
        $listImg = $this->session->get('listImg');
        if (empty($listImg)) {
            $id = $this->request->get('id');
            $productObj = new \Product();
            $pr_detail = $productObj->getDetail($id)->data;
            $listImg = json_decode($pr_detail['image']);
            if (empty($listImg)) {
                $listImg = [];
            }
        }
        $upload_img = $this->uploadImageAction()->getContent();
        $img = json_decode($upload_img);
        array_push($listImg, $img->data);
        $this->session->set('listImg', $listImg);
        $render = $this->render_template('product', 'list_img', ['data' => $listImg]);
        $last_result = [
            'status' => 1,
            'content' => $render,
        ];
        return $this->response->setJsonContent($last_result);
    }

    public function removeImgProductAction()
    {
        $index = $this->request->get('index');
        $listImg = $this->session->get('listImg');
        unset($listImg[$index]);
        $this->session->set('listImg', $listImg);
        $render = $this->render_template('product', 'list_img', ['data' => $listImg]);
        $last_result = [
            'status' => 1,
            'content' => $render,
        ];
        return $this->response->setJsonContent($last_result);
    }

    public function getDetailAction()
    {
        $data = $this->request->getPost('data');
        $obj = new $data['model']();
        $dt = $obj->getDetail($data['id']);
        if ($dt->status) {
            $render = $this->render_template($data['controller'], $data['action'], ['data' => $dt->data]);
            $rs = [
                'status' => $dt->status,
                'data' => $dt->data,
                'content' => $render,
                'message' => $dt->message
            ];
            return $this->response->setJsonContent($rs);
        }
    }

    public function getListMenuAction()
    {
        $menu_block_id = $this->request->get('id');
        $menuObj = new \Menu();
        $rs = $menuObj->getListObj($menu_block_id);
        if ($rs->status) {
            $render = $this->render_template('menu', 'ajax_list_menu', [
                'data' => $rs->data,
                'menu_block_id' => $menu_block_id
            ]);
            $data = [
                'status' => $rs->status,
                'data' => $rs->data,
                'content' => $render,
                'message' => $rs->message
            ];
            return $this->response->setJsonContent($data);
        }
    }

    public function addMenuAction()
    {
        $menu_block_id = $this->request->getPost('menu_block_id');
        $parent_id = $this->request->getPost('parent_id');
        $render = $this->render_template('menu', 'add_menu', [
            'menu_block_id' => $menu_block_id,
            'parent_id' => $parent_id
        ]);
        $data['content'] = $render;
        return $this->response->setJsonContent($data);
    }

    public function creatMenuAction()
    {
        $data = $this->request->getPost('data');
        $menuObj = new \Menu();
        if (empty($data['id'])) {
            $rs = $menuObj->createObj($data);
        } else {
            $rs = $menuObj->updateObj($data);
        }
        if ($rs->status) {
            $listData = $menuObj->getListObj($data['menu_block_id']);
            $render = $this->render_template('menu', 'ajax_list_menu', [
                'data' => $listData->data,
                'menu_block_id' => $data['menu_block_id']
            ]);
            $last_result = [
                'status' => $rs->status,
                'data' => $rs->data,
                'content' => $render,
                'message' => $rs->message
            ];
            return $this->response->setJsonContent($last_result);
        }
    }

    public function editMenuAction()
    {
        $id = $this->request->getPost('id');
        $menuObj = new \Menu();
        $rs = $menuObj->getDetail($id);
        if ($rs->status) {
            $obj = $rs->data;
            $render = $this->render_template('menu', 'add_menu', [
                'menu_block_id' => $obj['menu_block_id'],
                'parent_id' => $obj['parent_id'],
                'data' => $obj
            ]);
            $last_result = [
                'status' => $rs->status,
                'data' => $rs->data,
                'content' => $render,
                'message' => $rs->message
            ];
            return $this->response->setJsonContent($last_result);
        }
    }

    public function deleteMenuAction()
    {
        $id = $this->request->getPost('id');
        $menu_block_id = $this->request->getPost('menu_block_id');
        $menuObj = new \Menu();
        $rs = $menuObj->deleteObj($id);
        if ($rs->status) {
            $listData = $menuObj->getListObj($menu_block_id);
            $render = $this->render_template('menu', 'ajax_list_menu', [
                'data' => $listData->data,
                'menu_block_id' => $menu_block_id
            ]);
            $last_result = [
                'status' => $rs->status,
                'data' => $rs->data,
                'content' => $render,
                'message' => $rs->message
            ];
            return $this->response->setJsonContent($last_result);
        }
    }

    public function ajaxCatHomePageAction()
    {
        $id = $this->request->getPost('id');
        $catObj = new \Category();
        $rs_detail = [];
        if (!empty($id)) {
            $rs_detail = $catObj->getDetail($id);
        }
        $listCat = $catObj->getListObj();
        $render = $this->render_template('confighome', 'ajaxcat', [
            'listCat' => $listCat->data,
            'obj' => $rs_detail->data
        ]);
        $rs = [
            'status' => 1,
            'data' => [],
            'content' => $render,
            'message' => 'Thao tác thành công!'
        ];
        return $this->response->setJsonContent($rs);
    }

    public function addCatHomeAction()
    {
        $data = $this->request->getPost('data');
        $data['position'] = 'home';
        $catObj = new \Category();
        $rs = $catObj->updateCat($data);
        if ($rs->status) {
            $optional['q'] = 'position like "home" ';
            $optional['o'] = 1;
            $listCatHome = $catObj->getListObj($optional);
            $render = $this->render_template('confighome', 'ajaxListCat', ['listCat' => $listCatHome->data]);
            $result = [
                'status' => $listCatHome->status,
                'data' => $listCatHome->data,
                'content' => $render,
                'message' => $listCatHome->message
            ];
            return $this->response->setJsonContent($result);
        }
    }

    public function addAttrAction()
    {
        $render = $this->render_template('product', 'ajax_attr', []);
        $result = [
            'status' => 1,
            'content' => $render,
            'message' => "Thao tác thành công!"
        ];
        return $this->response->setJsonContent($result);
    }

    public function createAttrAction()
    {
        $data = $this->request->getPost('data');
        $attrObj = new \Attribute();
        if (empty($data['id'])) {
            $rs = $attrObj->createObj($data);
        } else {
            $rs = $attrObj->updateAttr($data);
        }
        if ($rs->status) {
            $listData = $attrObj->getListObj();
            $render = $this->render_template('product', 'ajax_list_attr', [
                'data' => $listData->data,
                'item' => $rs->data
            ]);
            $last_result = [
                'status' => $rs->status,
                'data' => $rs->data,
                'content' => $render,
                'message' => $rs->message
            ];
            return $this->response->setJsonContent($last_result);
        } else {
            return $this->response->setJsonContent((array)$rs);
        }
    }

    public function addAttrProductAction()
    {
        $attrObj = new \Attribute();
        $rsGetListData = $attrObj->getListObj();
        $render = $this->render_template('product', 'ajax_add_attr_product', [
            'listAttr' => $rsGetListData->data
        ]);
        $last_result = [
            'status' => $rsGetListData->status,
            'data' => $rsGetListData->data,
            'content' => $render,
            'message' => $rsGetListData->message
        ];
        return $this->response->setJsonContent($last_result);
    }

    public function disableAttrAction()
    {
        $arrDisable = $this->request->getPost('arrDisable');
        $data = $this->request->getPost('data');
        $attrObj = new \Attribute();
        $listData = $attrObj->getListObj();
        $render = $this->render_template('product', 'ajax_list_attr', [
            'data' => $listData->data,
            'arrDisable' => $arrDisable,
        ]);
        $last_result = [
            'status' => '1',
            'content' => $render,
        ];
        return $this->response->setJsonContent($last_result);
    }

    public function synchronizedCategoryForZaloAction()
    {
        $data = $this->request->getPost('data');
        $data = json_decode($data);
        $dataZalo = [
            'name' => $data->name,
            'desc' => '',
            'photo' => $data->avatar,
            'status' => $data->status == 1 ? 0 : 1 // 0 - show | 1 - hide
        ];
        $zaloObj = new \ZaloService();
        if (empty($data->zalo_id)) $rsZalo = $zaloObj->createCategory($dataZalo);
        else {
            $dataZalo['zalo_id'] = $data->zalo_id;
            $rsZalo = $zaloObj->updateCategory($dataZalo);
        }
        $last_result = [];
        if ($rsZalo['errorCode'] == 1) {
            if(empty($data->zalo_id)) {
                $catObj = new \Category();
                $dataUpdate = [
                    'id' => $data->id,
                    'zalo_id' => $rsZalo['data']['categoryId']
                ];
                $rsUpdate = $catObj->updateCat($dataUpdate);
                if ($rsUpdate->status) {
                    $last_result = [
                        'status' => $rsUpdate->status,
                        'message' => $rsUpdate->message,
                        'data' => $rsUpdate->data
                    ];
                } else {
                    $last_result = [
                        'status' => 0,
                        'message' => 'Có lỗi khi cập nhật vào hệ thống!',
                    ];
                }
            } else {
                $last_result = [
                    'status' => 1,
                    'message' => 'Thao tác thành công!',
                ];
            }
        } else {
            $last_result = [
                'status' => 0,
                'message' => 'Có lỗi khi đồng bộ vào Zalo!',
            ];
        }
        return $this->response->setJsonContent($last_result);
    }

    public function synchronizedProductForZaloAction()
    {
        $product = $this->request->getPost('data');
        $product = json_decode($product);
        $zaloServiceObj = new \ZaloService();
        if (empty($product->zalo_id)) $rs = $zaloServiceObj->createProduct($product);
        else $rs = $zaloServiceObj->updateProduct($product);
        return $this->response->setJsonContent($rs);
    }

    public function removeSynchronizedProductForZaloAction()
    {
        $zaloId = $this->request->getPost('zalo_id');
        $proId = $this->request->getPost('pro_id');
        $zaloServiceObj = new \ZaloService();
        $zaloServiceObj->deleteProduct($zaloId);
        $productObj = new \Product();
        $dataUpdateProduct = [
            'id' => $proId,
            'zalo_id' => ''
        ];
        $rsUpdateProduct = $productObj->updateObj($dataUpdateProduct);
        if ($rsUpdateProduct->status)
            $rs = [
                'status' => 1,
                'message' => 'Thao tác thành công!'
            ];
        else $rs = [
            'status' => 0,
            'message' => 'Có lỗi xảy ra khi cập nhật sản phẩm trên hệ thống Website!'
        ];
        return $this->response->setJsonContent($rs);
    }
}