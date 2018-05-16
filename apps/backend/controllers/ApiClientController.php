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
            $render = $this->render_template('menu', 'ajax_list_menu', ['data' => $rs->data, 'menu_block_id' => $menu_block_id]);
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
        $render = $this->render_template('menu', 'add_menu', ['menu_block_id' => $menu_block_id, 'parent_id' => $parent_id]);
        $data['content'] = $render;
        return $this->response->setJsonContent($data);
    }

    public function creatMenuAction()
    {
        $data = $this->request->getPost('data');
        $menuObj = new \Menu();
        if(empty($data['id'])){
            $rs = $menuObj->createObj($data);
        } else {
            $rs = $menuObj->updateObj($data);
        }
        if ($rs->status) {
            $listData = $menuObj->getListObj($data['menu_block_id']);
            $render = $this->render_template('menu', 'ajax_list_menu', ['data' => $listData->data, 'menu_block_id' => $data['menu_block_id']]);
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
            $render = $this->render_template('menu', 'add_menu', ['menu_block_id' => $obj['menu_block_id'], 'parent_id' => $obj['parent_id'], 'data' => $obj]);
            $last_result = [
                'status' => $rs->status,
                'data' => $rs->data,
                'content' => $render,
                'message' => $rs->message
            ];
            return $this->response->setJsonContent($last_result);
        }
    }
}