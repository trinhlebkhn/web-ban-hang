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

    public function createProduct($data){
        $zaloObj = new Zalo(ZaloConfig::getInstance()->getConfig());
        $zaloObj->getRedirectLoginHelper();
        /* Xử lý ảnh  */
        $pathFile = '../../public' . $data['photos'];
        $params_upload_avatar = ['file' => new ZaloFile($pathFile)];
        $qrAvatar = $zaloObj->post(ZaloEndpoint::API_OA_STORE_UPLOAD_CATEGORY_PHOTO, $params_upload_avatar);
        $rsAvatar = $qrAvatar->getDecodedBody();
        $photo = [
            'id' => $rsAvatar['data']['imageId']
        ];
        $data['photos'] = [$photo];
        $params = ['data' => $data];
        $response = $zaloObj->post(ZaloEndpoint::API_OA_STORE_CREATE_PRODUCT, $params);
        $result = $response->getDecodedBody();
        if($result['errorCode'] == 1) {
            $dataUpdate = [
                'id' => $data['id'],
                'zalo_id' => $result['data']['productId']
            ];

            $productObj = new Product();
            $rsUpdateProduct = $productObj->updateObj($dataUpdate);
            if($rsUpdateProduct) {
                return (object) [
                    'status' => 1,
                    'message' => 'Thao tác thành công! Vui lòng kiểm tra lại trên cửa hàng zalo của bạn.'
                ];
            } else {
                return (object) [
                    'status' => 0,
                    'message' => 'Có lỗi xảy ra khi cập nhật lại sản phẩm!'
                ];
            }
        } else {
            return (object) [
                'status' => 0,
                'message' => 'Có lỗi xảy ra khi đồng bộ sản phẩm!'
            ];
        }
    }
}