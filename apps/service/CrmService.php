<?php

use GuzzleHttp\Client;
use Phalcon\Cache\Backend;

/**
 * Created by PhpStorm.
 * User: balol
 * Date: 1/23/2018
 * Time: 10:16 AM
 */
class CrmService
{
    protected $appId;
    use ResponseParserExt;

    protected $appSecret;


    public function __construct($appId, $appSecret)
    {
        $this->appId = $appId;
        $this->appSecret = $appSecret;
    }


    public function getAppToken()
    {
        $appToken = CacheUtils::getAndSave('crm_app_token', function () {
            /** @var Client $crmClient */
            $crmClient = provider('crmClient');

            $response = $crmClient->post('/auth/app', [
                'body' => json_encode([
                    'app_id' => $this->appId,
                    'app_secret' => $this->appSecret,
                ])
            ]);

            $data = $this->parseJsonResponse($response->getBody()->getContents(), true);
            if (isset($data['app_token'])) {
                return $data['app_token'];
            }
            throw new LogicException("Lỗi CRM, thiếu app_token", ErrorCode::CRM_INVALID_RESPONSE_CODE);
        });

        return $appToken;
    }


}