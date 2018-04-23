<?php

/**
 * Created by PhpStorm.
 * User: admin
 * Date: 1/26/2018
 * Time: 4:03 PM
 */
trait SessionExt
{
    /*
     *  Get and Set Auth
    */
    function setAuth($auth)
    {
        provider('session')->set('auth', $auth);
    }

    function getAuth()
    {
        return provider('session')->get('auth');
    }

    /*
     *  Get and Set Agency
    */
    function setAgency($data)
    {
        provider('session')->set('agency_info', $data);
    }

    function getAgency()
    {
        return provider('session')->get('agency_info');
    }

    /*
     *  Get and Set App Token
    */
    function setCrmAppToken($app_token)
    {
        provider('session')->set('crm_app_token', $app_token);
    }

    function getCrmApptoken()
    {
        return provider('session')->get('crm_app_token');
    }

    /*
     *  Logout
    */
    function logout()
    {
        provider('session')->destroy();
    }

    /*
     *  Check Login
    */
    function isLoggedIn()
    {
        /** @var \Phalcon\Session\Adapter $session */
        $session = provider('session');
        return $session->has('auth');
    }


}