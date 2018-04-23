<?php

use GuzzleHttp\Client;
use Phalcon\Di\Injectable;

/**
 * Created by PhpStorm.
 * User: balol
 * Date: 1/22/2018
 * Time: 5:18 PM
 *
 * @property Client $crmClient
 */
class AuthenticationService extends Injectable
{
    use ResponseParserExt;


    function login($user, $password)
    {
        $this->_eventsManager->fire('login:before', $this, [$user, $password]);

        /** @var Client $crmClient */
        $crmClient = provider('crmClient');

        $loginResult = $crmClient; // TODO get login result

        if ($loginResult) {
            $this->_eventsManager->fire('login:success', $this, [$user, $password]);
            return $this->generateAuthentication($loginResult);
        }

        $this->_eventsManager->fire('login:fail', $this, [$user, $password]);
        return false;
    }


    function generateAuthentication($loginResult)
    {

    }


    function getUserInfo($auth_token)
    {
        $client = new Client();
        $response = $client->get(config('bizsale:baseUri') . '/auth/scope', [
            'headers' => [
                'Authorization' => $auth_token
            ],
            'verify' => false
        ]);

        return $this->parseJsonResponse($response->getBody()->getContents(), true);
    }

    function getAuthApp()
    {
        $data = [
            'app_id' => config('crm:appId'),
            'app_secret' => config('crm:appSecret')
        ];
        $client = new Client();
        $response = $client->post(config('crm:baseUri') . '/auth/app', [
            'body' => json_encode($data)
        ]);
        return $response->getBody()->getContents();
    }
}