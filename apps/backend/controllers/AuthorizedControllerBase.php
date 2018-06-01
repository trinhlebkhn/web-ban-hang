<?php

namespace Graduate\Backend\Controllers;

use Phalcon\Mvc\Controller;

/**
 * Created by PhpStorm.
 * User: admin
 * Date: 1/26/2018
 * Time: 4:37 PM
 */
class AuthorizedControllerBase extends ControllerBase {
    function initialize() {
        if (!$this->isLogIn()) {
            $this->response->redirect(base_uri() . '/quan-tri/dang-nhap');
        }
        $auth_admin = $this->getAdmin();
        $this->view->admin = $auth_admin;
    }

    public function checkQuery($strSeach, $sttSearch, $typeSearch) {
        if (!empty($strSeach) && empty($sttSearch) && empty($typeSearch)) {
            $query = 'name like "%' . $strSeach . '%"';
            $paramSearch = '&q=' . $strSeach;
        }
        elseif (empty($strSeach) && !empty($sttSearch) && empty($typeSearch)) {
            $query = 'status = ' . $sttSearch;
            $paramSearch = '&stt=' . $sttSearch;
        }
        elseif (empty($strSeach) && empty($sttSearch) && !empty($typeSearch)) {
            $query = 'type = ' . $typeSearch;
            $paramSearch = '&type=' . $typeSearch;
        }
        elseif (!empty($strSeach) && !empty($sttSearch) && empty($typeSearch)) {
            $query = 'name like "%' . $strSeach . '%" and status = ' . $sttSearch;
            $paramSearch = '&q=' . $strSeach . '&status=' . $sttSearch;
        }
        elseif (!empty($strSeach) && empty($sttSearch) && !empty($typeSearch)) {
            $query = 'name like "%' . $strSeach . '%" and type = ' . $typeSearch;
            $paramSearch = '&q=' . $strSeach . '&type=' . $typeSearch;
        }
        elseif (empty($strSeach) && !empty($sttSearch) && !empty($typeSearch)) {
            $query = 'status = ' . $sttSearch . ' and type = ' . $typeSearch;
            $paramSearch = '&status=' . $sttSearch . '&type=' . $typeSearch;
        }
        elseif (!empty($strSeach) && !empty($sttSearch) && !empty($typeSearch)) {
            $query = 'name like "%' . $strSeach . '%" and status = ' . $sttSearch . ' and type = ' . $typeSearch;
            $paramSearch = '&q=' . $strSeach . '&status=' . $sttSearch . '&type=' . $typeSearch;
        }
        return [
            'query' => $query,
            'paramSearch' => $paramSearch
        ];
    }

    public function checkQueryBill($strSeach, $sttSearch) {
        if (!empty($strSeach) && empty($sttSearch)) {
            $query = 'email like "%' . $strSeach . '%"';
            $paramSearch = '&q=' . $strSeach;
        }
        elseif (empty($strSeach) && !empty($sttSearch)) {
            $query = 'status = ' . $sttSearch;
            $paramSearch = '&stt=' . $sttSearch;
        }
        elseif (!empty($strSeach) && !empty($sttSearch)) {
            $query = 'email like "%' . $strSeach . '%" and status = ' . $sttSearch;
            $paramSearch = '&q=' . $strSeach . '&status=' . $sttSearch;
        }
        return [
            'query' => $query,
            'paramSearch' => $paramSearch
        ];
    }

    public function create_url_slug($string) {
        $slug = preg_replace('/[^A-Za-z0-9-]+/', '-', $string);
        return '/' . $slug;
    }
}