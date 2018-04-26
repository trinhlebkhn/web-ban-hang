<?php

/**
 * Created by PhpStorm.
 * User: balol
 * Date: 1/22/2018
 * Time: 5:34 PM
 */
trait ResponseParserExt
{
    function parseJsonResponse($responseBody, $throw = false)
    {
        if ($responseBody == null) {
            return null;
        }

        if (is_string($responseBody)) {
            $response = json_decode($responseBody, true);
        } else {
            $response = (array)$responseBody;
        }

        if (json_last_error()) {
            throw new LogicException("Lỗi dữ liệu: " . $responseBody, ErrorCode::CRM_INVALID_RESPONSE_CODE);
        }

        /** @var CrmResponseDTO $responseObject */
        $responseObject = ClassUtils::mapObject($response, CrmResponseDTO::class);

        if ($responseObject->status != 1) {
            if ($throw) {
                throw new LogicException($responseObject->message);
            }
            return null;
        }

        return $responseObject->data;
    }
}