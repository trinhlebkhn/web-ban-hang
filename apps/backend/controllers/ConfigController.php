<?php
/**
 * Created by PhpStorm.
 * User: An Viet Computer
 * Date: 9/27/2018
 * Time: 9:29 PM
 */

namespace Graduate\Backend\Controllers;


class ConfigController extends ControllerBase
{
    public function box_imagesAction($type)
    {
        $query = $this->request->getQuery();
        $id = $this->request->get('id');
        $configObj = new \Config();
        $rsGetData = $configObj->getConfig(1);
        /*
            type = 1 => Quản lý slider
            type = 2 => Quản lý advance
            type = 3 => Quản lý branch
         */
        $field = '';
        if($type == 1) {
            $field = 'sliders';
        } else if($type == 2) {
            $field = 'advances';
        } else if($type == 3) {
            $field = 'branch';
        }

        $listImgData = json_decode($rsGetData->data[$field]);
        $listImgData = (array)$listImgData;
        foreach ($listImgData as &$value) {
            $value = (array)$value;
            if (!empty($id) && $value['id'] == $id) {
                $this->view->data = $value;
            }
        }
        if ($this->request->isPost()) {
            $data_post = $this->request->get('data');
            if (empty($id)) {  // create
                $listKey = array_keys($listImgData);
                $countListKey = count($listKey);
                $id = $listImgData[$listKey[$countListKey - 1]]['id'] ? $listImgData[$listKey[$countListKey - 1]]['id'] : 0;
                $data_post['id'] = $id + 1;
                array_push($listImgData, $data_post);
            } else {    // Update
                foreach ($listImgData as &$value) {
                    if ($value['id'] == $id) {
                        $data_post['id'] = $id;
                        $value = $data_post;
                        break;
                    }
                }
            }

            $data = [
                'id' => 1,
                $field => json_encode($listImgData),
            ];
            $rs = $configObj->updateConfig($data);
            if ($rs->status) {
                if (!empty($id)) $this->response->redirect(base_uri() . $query['_url']);
                $this->flash->success($rs->message);
            } else {
                $this->flash->error("Có lỗi xảy ra!");
            }
        }
        $this->view->setVars([
            'listImages' => $listImgData,
            'type' => $type
        ]);
    }

    public function delete_imageAction($type)
    {
        $id = $this->request->get('id');

        $configObj = new \Config();
        $rsGetData = $configObj->getConfig(1);
        /*
            type = 1 => Quản lý slider
            type = 2 => Quản lý advance
            type = 3 => Quản lý branch
         */
        $field = '';
        if($type == 1) {
            $field = 'sliders';
        } else if($type == 2) {
            $field = 'advances';
        } else if($type == 3) {
            $field = 'branch';
        }
        $listImgData = json_decode($rsGetData->data[$field]);
        $listImgData = (array)$listImgData;
        foreach ($listImgData as $key => $value) {
            if ($value->id == $id) {
                unset($listImgData[$key]);
                break;
            }
        }
        $data = [
            'id' => 1,
            $field => json_encode($listImgData),
        ];
        $rs = $configObj->updateConfig($data);
        if ($rs->status) {
            $this->flash->success($rs->message);
        } else {
            $this->flash->error("Có lỗi xảy ra!");
        }
        if($type == 1) $this->response->redirect(base_uri() . '/quan-tri/slider');
        elseif ($type == 2) $this->response->redirect(base_uri() . '/quan-tri/khoi-quang-cao');
        elseif ($type == 3) $this->response->redirect(base_uri() . '/quan-tri/khoi-thuong-hieu');
    }

    public function infoAction()
    {
        $configObj = new \Config();
        if ($this->request->isPost()) {
            $dataPost = $this->request->getPost('data');
            $dataPost['id'] = 1;
            $dataPost['list_block_menu_footer'] = json_encode($dataPost['list_block_menu_footer']);
            $rs = $configObj->updateConfig($dataPost);
            if ($rs->status) {
                if (!empty($id)) $this->response->redirect(base_uri() . '/quan-tri/slider');
                $this->flash->success($rs->message);
            } else {
                $this->flash->error("Có lỗi xảy ra!");
            }
        }
        $rs = $configObj->getConfig(1);
        $data = $rs->data;
        $data['list_block_menu_footer'] = json_decode($data['list_block_menu_footer']);
        $menuBlockObj = new \MenuBlock();
        $rsGetBoxMenu = $menuBlockObj->getListObj();
        $this->view->setVars([
            'data' => $data,
            'listBoxMenu' => $rsGetBoxMenu->data
        ]);
    }
}