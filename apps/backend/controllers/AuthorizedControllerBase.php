<?php
namespace Graduate\Backend\Controllers;
use Phalcon\Mvc\Controller;
/**
 * Created by PhpStorm.
 * User: admin
 * Date: 1/26/2018
 * Time: 4:37 PM
 */
class AuthorizedControllerBase extends ControllerBase
{
    function initialize()
    {
        $this->isLoggedIn();
    }

}