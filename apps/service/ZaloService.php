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

    /* Đồng bộ danh mục */
    public function createCategory($data){
        $params = ['data' => $data];
        $zaloObj = new Zalo(ZaloConfig::getInstance()->getConfig());
        $zaloObj->getRedirectLoginHelper();
        /* Xử lý ảnh  */
        $pathFile = '../../public' . $data['photo'];
        $imageId = $this->uploadCategoryImage($pathFile);
        $params['data']['photo'] = $imageId;
        $response = $zaloObj->post(ZaloEndpoint::API_OA_STORE_CREATE_CATEGORY, $params);
        $result = $response->getDecodedBody();
        return $result;
    }

    public function updateCategory($data){
        /* Xử lý ảnh  */
        $pathFile = '../../public' . $data['photo'];
        $imageId = $this->uploadCategoryImage($pathFile);
        $categoryUpdate = array(
            'name' => $data['name'],
            'desc' => $data['desc'],
            'photo' => $imageId,
            'status' => $data['status'] // 0 - show | 1 - hide
        );
        $dataUpdate = array(
            'categoryid' => $data['zalo_id'],
            'category' => $categoryUpdate
        );
        $zaloObj = new Zalo(ZaloConfig::getInstance()->getConfig());
        $zaloObj->getRedirectLoginHelper();
        $params = ['data' => $dataUpdate];
        $response = $zaloObj->post(ZaloEndpoint::API_OA_STORE_UPDATE_CATEGORY, $params);
        $result = $response->getDecodedBody();
        return $result;
    }




    /* Đồng bộ sản phẩm */
    public function createProduct($data){
        $zaloObj = new Zalo(ZaloConfig::getInstance()->getConfig());
        $zaloObj->getRedirectLoginHelper();
        /* Xử lý ảnh  */
        $pathFile = '../../public' . $data['photos'];
        $paramsUploadAvatar = $this->uploadProductImage($pathFile);
        $photo = [
            'id' => $paramsUploadAvatar
        ];
        $data['photos'] = [$photo];

        /* Xử lý thuộc tính sản phẩm */
//        $queryAttr = array(
//            'offset' => 0,
//            'count' => 10
//        );
//        $paramsQueryAttr = ['data' => $queryAttr];
//        $responseAttr = $zaloObj->get(ZaloEndpoint::API_OA_STORE_GET_SLICE_ATTRIBUTE, $paramsQueryAttr);
//        $resultAttr = $responseAttr->getDecodedBody();
//        d($resultAttr);

        $dataAttr = array(
            'name' => "màu vàng",
            'type' => "34eb452b796e9030c97f" // get from end point -> ZaloEndpoint::API_OA_STORE_GET_SLICE_ATTRIBUTE_TYPE
        );
        $params = ['data' => $dataAttr];
        $responseAttr = $zaloObj->post(ZaloEndpoint::API_OA_STORE_CREATE_ATTRIBUTE, $params);
        $resultAttr = $responseAttr->getDecodedBody();
        d($resultAttr);


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

    public function uploadCategoryImage($url){
        $zaloObj = new Zalo(ZaloConfig::getInstance()->getConfig());
        $params_upload_avatar = ['file' => new ZaloFile($url)];
        $qrAvatar = $zaloObj->post(ZaloEndpoint::API_OA_STORE_UPLOAD_CATEGORY_PHOTO, $params_upload_avatar);
        $rsAvatar = $qrAvatar->getDecodedBody();
        return $rsAvatar['data']['imageId'];
    }

    public function uploadProductImage($url){
        $zaloObj = new Zalo(ZaloConfig::getInstance()->getConfig());
        $params_upload_avatar = ['file' => new ZaloFile($url)];
        $qrAvatar = $zaloObj->post(ZaloEndpoint::API_OA_STORE_UPLOAD_PRODUCT_PHOTO, $params_upload_avatar);
        $rsAvatar = $qrAvatar->getDecodedBody();
        return $rsAvatar['data']['imageId'];
    }
}