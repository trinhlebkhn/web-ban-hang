<?php

use Zalo\Zalo;
use Zalo\ZaloConfig;
use Zalo\ZaloEndpoint;
use Zalo\FileUpload\ZaloFile;

/**
 * Created by PhpStorm.
 * User: trinhln
 * Date: 11/2/2018
 * Time: 2:05 PM
 */

class ZaloService
{
    public $zaloObj;
    public $zalohelper;
    function initialize(){
        $this->zaloObj = new Zalo(ZaloConfig::  getInstance()->getConfig());
        $this->zalohelper = $this->zalo -> getRedirectLoginHelper();
    }
    public function  createProduct(){

    }

    public function creatCategory($data){
        $params = ['data' => $data];
        $zaloObj = new Zalo(ZaloConfig::getInstance()->getConfig());
        $zaloObj->getRedirectLoginHelper();
        /* Xử lý ảnh  */
        $pathFile = '../../public' . $data['photo'];
        $params_upload_avatar = ['file' => new ZaloFile($pathFile)];
        $qrAvatar = $zaloObj->post(ZaloEndpoint::API_OA_STORE_UPLOAD_CATEGORY_PHOTO, $params_upload_avatar);
        $rsAvatar = $qrAvatar->getDecodedBody();
        $params['data']['photo'] = $rsAvatar['data']['imageId'];
        $response = $zaloObj->post(ZaloEndpoint::API_OA_STORE_CREATE_CATEGORY, $params);
        $result = $response->getDecodedBody();
        return $result;
    }
}