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
    public function sliderAction(){
        $configObj = new \Config();
        $rsGetData = $configObj->getConfig(1);
        $configData = json_decode($rsGetData->data['data_config']);
        if($this->request->isPost()) {
            $data_post = $this->request->get('data');

            // create
            $sliderObj = (object) $data_post;
            if(empty($configData->slider)) $configData->slider = [];
            $sliderObj->id = count($configData->slider) + 1;
            array_push($configData->slider, $sliderObj);
            $data_create['slider'] = $configData->slider;
            $data = [
                'id' => 1,
                'data_config' => json_encode($data_create),
            ];
            $rs = $configObj->updateConfig($data);
            if($rs->status) {
                $this->flash->success($rs->message);
            } else {
                $this->flash->error("Có lỗi xảy ra!");
            }
        }
        $this->view->listSliders = $configData->slider;
    }
}