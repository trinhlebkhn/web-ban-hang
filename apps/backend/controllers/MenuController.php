<?php
/**
 * Created by PhpStorm.
 * User: hdba1
 * Date: 5/4/2018
 * Time: 1:03 AM
 */

namespace Graduate\Backend\Controllers;


class MenuController extends AuthorizedControllerBase
{
    public function indexAction()
    {
        $menuBlockObj = new \MenuBlock();
        $listData = $menuBlockObj->getListObj();
        if ($listData->status) {
            $this->view->listData = $listData->data;
        } else {
            return $this->flash->error('Có lỗi hệ thống xảy ra!');
        }

        if ($this->request->isPost()) {
            $data = $this->request->get('data');
            if (empty($data['name'])) {
                $this->flash->error('Vui lòng nhập tên menu');
                return;
            }
            if (empty($data['check'])) {
                $list_is_main = array_column($listData->data, 'is_main');
                if (in_array(1, $list_is_main) && $data['is_main']) {
                    $this->flash->error('Bạn đã có menu chính! Vui lòng thao tác lại');
                    return;
                }
            }

            if (empty($data['id'])) {
                $rs = $menuBlockObj->createObj($data);
            } else {
                $rs = $menuBlockObj->updateObj($data);
            }
            if ($rs->status) {
                $this->flash->success($rs->message);
            } else {
                $this->flash->error($rs->message);
            }
            $listData = $menuBlockObj->getListObj();
            $this->view->listData = $listData->data;
        }
    }

    public function deleteAction()
    {
        $id = $this->request->get('id');
        $menuBlockObj = new \MenuBlock();
        $data = $menuBlockObj->getDetail($id);
        $obj = $data->data;
        $obj['del_flag'] = 1;
        $rs = $menuBlockObj->updateObj($obj);
        if ($rs->status) {
            $this->flash->success($rs->message);
        } else {
            $this->flash->error($rs->message);
        }
        $this->response->redirect(base_uri() . '/quan-tri/menu-block');
    }
}