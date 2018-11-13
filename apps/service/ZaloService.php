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

    function initialize()
    {
        $this->zaloObj = new Zalo(ZaloConfig::  getInstance()->getConfig());
        $this->zalohelper = $this->zalo->getRedirectLoginHelper();
    }

    /* Đồng bộ danh mục */
    public function createCategory($data)
    {
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

    public function updateCategory($data)
    {
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
    public function createProduct($product)
    {
        $zaloObj = new Zalo(ZaloConfig::getInstance()->getConfig());
        $zaloObj->getRedirectLoginHelper();
        $rsCreateDataProduct = $this->createDataProduct($product);
        $dataProduct = $rsCreateDataProduct['dataProduct'];
        $paramsProduct = ['data' => $dataProduct];
        $response = $zaloObj->post(ZaloEndpoint::API_OA_STORE_CREATE_PRODUCT, $paramsProduct);
        $result = $response->getDecodedBody();
        if ($result['errorCode'] == 1) {

            if (!empty($rsCreateDataProduct['arrayAttrZalo'])) {
                $resultAddVariation = $this->handleVariation($result['data']['productId'], $product->price_sell, $rsCreateDataProduct['arrayAttrZalo']);
                if ($resultAddVariation['errorCode'] != 1) {
                    return (object)[
                        'status' => 0,
                        'message' => $resultAddVariation['errorMsg']
                    ];
                }
            }

            /* Cập nhật id sản phẩm  trên zalo vào db */
            $dataUpdate = [
                'id' => $product->id,
                'zalo_id' => $result['data']['productId']
            ];

            $productObj = new Product();
            $rsUpdateProduct = $productObj->updateObj($dataUpdate);
            if ($rsUpdateProduct) {
                return (object)[
                    'status' => 1,
                    'message' => 'Thao tác thành công! Vui lòng kiểm tra lại trên cửa hàng zalo của bạn.',
                    'data' => $rsUpdateProduct->data
                ];
            } else {
                return (object)[
                    'status' => 0,
                    'message' => 'Có lỗi xảy ra khi cập nhật lại sản phẩm!'
                ];
            }
        } else {
            return (object)[
                'status' => 0,
                'message' => 'Có lỗi xảy ra khi đồng bộ sản phẩm!'
            ];
        }
    }

    public function updateProduct($product)
    {
        $zaloObj = new Zalo(ZaloConfig::getInstance()->getConfig());
        $zaloObj->getRedirectLoginHelper();
        $rsCreateDataProduct = $this->createDataProduct($product);
        $dataProduct = [
            'productid' => $product->zalo_id,
            'product' => $rsCreateDataProduct['dataProduct']
        ];
        $paramsProduct = ['data' => $dataProduct];
        $response = $zaloObj->post(ZaloEndpoint::API_OA_STORE_UPDATE_PRODUCT, $paramsProduct);
        $result = $response->getDecodedBody();
        if ($result['errorCode'] == 1) {
            if (!empty($rsCreateDataProduct['arrayAttrZalo'])) {
                $resultAddVariation = $this->handleVariation($product->zalo_id, $product->price_sell, $rsCreateDataProduct['arrayAttrZalo']);
                if ($resultAddVariation['errorCode'] != 1) {
                    return (object)[
                        'status' => 0,
                        'message' => $resultAddVariation['errorMsg']
                    ];
                }
            }
            return (object)[
                'status' => 1,
                'message' => 'Thao tác thành công! Vui lòng kiểm tra lại trên cửa hàng zalo của bạn.',
            ];
        } else {
            return (object)[
                'status' => 0,
                'message' => 'Có lỗi xảy ra khi đồng bộ sản phẩm!'
            ];
        }
    }

    public function deleteProduct($id)
    {
        $zaloObj = new Zalo(ZaloConfig::getInstance()->getConfig());
        $params = ['productid' => $id];
        $response = $zaloObj->post(ZaloEndpoint::API_OA_STORE_REMOVE_PRODUCT, $params);
    }

    public function uploadCategoryImage($url)
    {
        $zaloObj = new Zalo(ZaloConfig::getInstance()->getConfig());
        $params_upload_avatar = ['file' => new ZaloFile($url)];
        $qrAvatar = $zaloObj->post(ZaloEndpoint::API_OA_STORE_UPLOAD_CATEGORY_PHOTO, $params_upload_avatar);
        $rsAvatar = $qrAvatar->getDecodedBody();
        return $rsAvatar['data']['imageId'];
    }

    public function uploadProductImage($url)
    {
        $zaloObj = new Zalo(ZaloConfig::getInstance()->getConfig());
        $params_upload_avatar = ['file' => new ZaloFile($url)];
        $qrAvatar = $zaloObj->post(ZaloEndpoint::API_OA_STORE_UPLOAD_PRODUCT_PHOTO, $params_upload_avatar);
        $rsAvatar = $qrAvatar->getDecodedBody();
        return $rsAvatar['data']['imageId'];
    }

    public function createDataProduct($product)
    {
        $zaloObj = new Zalo(ZaloConfig::getInstance()->getConfig());
        $listAttrProduct = json_decode($product->attribute);

        /* Lấy danh sách thuộc tính sản phẩm trên zalo */
        $queryGetAttr = array(
            'offset' => 0,
            'count' => 10,
        );
        $paramsGetAttr = ['data' => $queryGetAttr];
        $responseGetAttr = $zaloObj->get(ZaloEndpoint::API_OA_STORE_GET_SLICE_ATTRIBUTE, $paramsGetAttr);
        $rsGetAttr = $responseGetAttr->getDecodedBody();
        $listAttrZalo = $rsGetAttr['data']['attributes'];
        if ($rsGetAttr['data']['total'] > $queryGetAttr['count']) {
            $check = (int)($rsGetAttr['data']['total'] / $queryGetAttr['count']);
            for ($i = 2; $i <= $check + 1; $i++) {
                $offset = $queryGetAttr['count'] * ($i - 1);
                $queryHandleGetAttr = [
                    'offset' => $offset,
                    'count' => 10,
                ];
                $paramsHandleGetAttr = ['data' => $queryHandleGetAttr];
                $resHandleGetAttr = $zaloObj->get(ZaloEndpoint::API_OA_STORE_GET_SLICE_ATTRIBUTE, $paramsHandleGetAttr);
                $rsHandleGetAttr = $resHandleGetAttr->getDecodedBody();
                $listAttrZalo = array_merge($listAttrZalo, $rsHandleGetAttr['data']['attributes']);
            }
        }

        $arrNameAttrZalo = array_column($listAttrZalo, 'name');

        /* Tạo thuộc tính mới trên Zalo */
        $arrayAttrZalo = [];
        foreach ($listAttrProduct as $attrObj) {
            if (!empty($attrObj->variation_zalo)) {
                if (!in_array($attrObj->value, $arrNameAttrZalo)) {
                    $dataCreateAttr = array(
                        'name' => $attrObj->value,
                        'type' => $attrObj->variation_zalo
                    );
                    $paramsCreateAttr = ['data' => $dataCreateAttr];
                    $resCreateAttr = $zaloObj->post(ZaloEndpoint::API_OA_STORE_CREATE_ATTRIBUTE, $paramsCreateAttr);
                    $rsCreateAttr = $resCreateAttr->getDecodedBody();
                    array_push($arrayAttrZalo, $rsCreateAttr['data']['attributeId']);
                    continue;
                }
                foreach ($listAttrZalo as $value) {
                    if ($value['name'] == $attrObj->value) {
                        array_push($arrayAttrZalo, $value['id']);
                    }
                }
            }
        }


        /* Xử lý ảnh  */
        $pathFile = '../../public' . $product->avatar;
        $paramsUploadAvatar = $this->uploadProductImage($pathFile);
        $photo = [
            'id' => $paramsUploadAvatar
        ];
        $photos = [$photo];
        $dataProduct = array(
            'name' => $product->name,
            'price' => $product->price_sell,
            'photos' => $photos,
            'display' => 'show', // show | hide
            'payment' => 2 // 2 - enable | 3 - disable
        );

        /* Danh mục sản phẩm */
        $catObj = new Category();
        $rsGetCat = $catObj->getDetail($product->category_id);

        if (!empty($rsGetCat->data['zalo_id'])) {
            $cate = array('cateid' => $rsGetCat->data['zalo_id']);
            $cates = [$cate];
            $dataProduct['cateids'] = $cates;
        }

        return [
            'dataProduct' => $dataProduct,
            'arrayAttrZalo' => $arrayAttrZalo
        ];
    }

    public function handleVariation($productId, $price, $arrayAttrZalo)
    {
        /* Thêm variation vào sản phẩm trên zalo */
        $variation = [
//                'default' => 1, // 1 (enable), 2 (disable)
            'price' => $price,
            'name' => '',
            'attributes' => $arrayAttrZalo
        ];

        $dataVariationProduct = [
            'productid' => $productId,
            'variations' => [$variation]
        ];

        $paramsVariationProduct = ['data' => $dataVariationProduct];
        $zaloObj = new Zalo(ZaloConfig::getInstance()->getConfig());
        $responseAddVariation = $zaloObj->post(ZaloEndpoint::API_OA_STORE_ADD_VARIATION, $paramsVariationProduct);
        $resultAddVariation = $responseAddVariation->getDecodedBody();
        return $resultAddVariation;
    }

    /* Nghiệp vụ đơn hàng */
    public function getListOrder()
    {
        $zaloObj = new Zalo(ZaloConfig::getInstance()->getConfig());
        $data = array(
            'offset' => 0,
            'count' => 10,
            'filter' => 0
        );
        $params = ['data' => $data];
        $response = $zaloObj->get(ZaloEndpoint::API_OA_STORE_GET_SLICE_ORDER, $params);
        $result = $response->getDecodedBody(); // result

        if ($result['errorCode'] == 1) {
            foreach ($result['data']['orders'] as &$order) {
                $order['createdTime'] = date('d/m/Y H:i:s', $order['createdTime']);
                $order['updatedTime'] = date('d/m/Y H:i:s', $order['updatedTime']);
            }
        }
        return $result;
    }

    public function getDetailOrder($id)
    {
        $zaloObj = new Zalo(ZaloConfig::getInstance()->getConfig());
        $params = ['orderid' => $id];
        $response = $zaloObj->get(ZaloEndpoint::API_OA_STORE_GET_ORDER, $params);
        $result = $response->getDecodedBody(); // result
        $result['data']['createdTime'] = date('d/m/Y H:i:s', $result['data']['createdTime']);
        $result['data']['updatedTime'] = date('d/m/Y H:i:s', $result['data']['updatedTime']);
        return $result;
    }
}