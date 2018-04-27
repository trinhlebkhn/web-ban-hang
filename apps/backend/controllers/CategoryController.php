<?php
/**
 * Created by PhpStorm.
 * User: hdba1
 * Date: 4/25/2018
 * Time: 2:39 AM
 */

namespace Graduate\Backend\Controllers;


class CategoryController extends AuthorizedControllerBase
{
    public function indexAction()
    {
        $catObj = new \Category();
        $listCat = $catObj->getListObj();
        d($listCat->toArray());
    }
}