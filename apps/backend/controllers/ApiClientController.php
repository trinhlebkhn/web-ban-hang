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
}