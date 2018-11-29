<?php
/**
 * Created by PhpStorm.
 * User: An Viet Computer
 * Date: 11/24/2018
 * Time: 3:56 PM
 */

use Phalcon\Http\Client\Request;

class ViettelPostService
{
    const url_api = 'https://partner.viettelpost.vn/v2/';

    public function login()
    {
        global $config;
        $provider = Request::getProvider();
        $provider->setBaseUri(STATIC::url_api);
        $provider->header->set('Content-Type', 'application/json');
        $body = json_encode([
            "USERNAME" => $config['viettel_post']['email'],
            "PASSWORD" => $config['viettel_post']['password'],
        ]);
        $response = $provider->post('user/Login', $body);
        return json_decode($response->body);
    }

    public function getListStore($token)
    {
        $provider = Request::getProvider();
        $provider->setBaseUri(STATIC::url_api);
        $provider->header->set('token', $token);
        $response = $provider->get('user/listInventory');
        return json_decode($response->body);
    }

    public function getListService()
    {
        $provider = Request::getProvider();
        $provider->setBaseUri(STATIC::url_api);
        $provider->header->set('Content-Type', 'application/json');
        $body = [
            "TYPE" => 1
        ];
        $response = $provider->post('categories/listService', json_encode($body));
        return json_decode($response->body);
    }

    public function getPrice($token, $body)
    {
        $provider = Request::getProvider();
        $provider->setBaseUri(STATIC::url_api);
        $provider->header->set('Content-Type', 'application/json');
        $provider->header->set('Token', $token);
        $response = $provider->post('order/getPrice', json_encode($body));
        $rs = json_decode($response->body);
        if ($rs->status != 200) {
            return [
                'status' => 0,
                'message' => $rs->message
            ];
        }

        return [
            'status' => 1,
            'message' => 'Thao tác thành công!',
            'ship_price' => $rs->data->MONEY_TOTAL
        ];
    }

    public function getProvinces()
    {
        $provider = Request::getProvider();
        $provider->setBaseUri(STATIC::url_api);
        $response = $provider->get('categories/listProvince');
        return json_decode($response->body);
    }

    public function getDistricts($province_id)
    {
        $provider = Request::getProvider();
        $provider->setBaseUri(STATIC::url_api);
        $response = $provider->get('categories/listDistrict?provinceId=' . $province_id);
        return json_decode($response->body);
    }
}