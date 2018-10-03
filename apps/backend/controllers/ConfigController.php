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
    public function sliderAction()
    {
        $id = $this->request->get('id');
        $configObj = new \Config();
        $rsGetData = $configObj->getConfig(1);
        $configData = json_decode($rsGetData->data['data_config']);
        $configData->slider = (array)  $configData->slider;
        foreach ($configData->slider as &$value) {
            $value = (array)$value;
            if (!empty($id) && $value['id'] == $id) {
                $this->view->data = $value;
//                d($this->view->data);
            }
        }
        if ($this->request->isPost()) {
            $data_post = $this->request->get('data');

            if(empty($id)) {  // create
                if (empty($configData->slider)) $configData->slider = [];
                $count_slider = count($configData->slider);
                $data_post['id'] = $configData->slider[$count_slider]['id'] + 1;
                array_push($configData->slider, $data_post);
            } else {    // Update
                foreach ($configData->slider as &$value) {
                    if ($value['id'] == $id) {
                        $data_post['id'] = $id;
                        $value = $data_post;
                        break;
                    }
                }
            }

            $data_create['slider'] = $configData->slider;
            $data = [
                'id' => 1,
                'data_config' => json_encode($data_create),
            ];
            $rs = $configObj->updateConfig($data);
            if ($rs->status) {
                if(!empty($id)) $this->response->redirect(base_uri() . '/quan-tri/slider');
                $this->flash->success($rs->message);
            } else {
                $this->flash->error("Có lỗi xảy ra!");
            }
        }
        $this->view->setVars([
            'listSliders' => $configData->slider,
        ]);
    }

    public function delete_sliderAction(){
        $id = $this->request->get('id');

        $configObj = new \Config();
        $rsGetData = $configObj->getConfig(1);
        $configData = json_decode($rsGetData->data['data_config']);
        $configData->slider = (array) $configData->slider;
        foreach ($configData->slider as $key => $value) {
            if ($value->id == $id) {
                unset($configData->slider[$key]);
                break;
            }
        }



        $data = [
            'id' => 1,
            'data_config' => json_encode($configData),
        ];
        $rs = $configObj->updateConfig($data);
        if ($rs->status) {
            $this->response->redirect(base_uri() . '/quan-tri/slider');
            $this->flash->success($rs->message);
        } else {
            $this->flash->error("Có lỗi xảy ra!");
        }
    }
}