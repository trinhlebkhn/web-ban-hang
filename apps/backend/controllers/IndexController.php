<?php

namespace Graduate\Backend\Controllers;

class IndexController extends AuthorizedControllerBase
{
    public function initialize()
    {
        parent::initialize();
    }

    public function indexAction()
    {
        $totalUsers = $this->getTotalUser();
        $totalBills = $this->getTotalBill();
        $totalRevenue = $this->getTotalRevenue();
        $this->view->setVars([
            'totalUsers' => $totalUsers,
            'totalBills' => $totalBills,
            'totalRevenue' => $totalRevenue
        ]);
    }

    public function getTotalUser()
    {
        $userObj = new \User();
        $optional = [
            'q' => 'role = 2'
        ];
        $resUsers = $userObj->getListObj($optional);
        return count($resUsers->data);
    }

    public function getTotalBill()
    {
        $billObj = new \Bill();
        $optional = [
            'q' => 'status != 6'
        ];
        $resBills = $billObj->getListObj($optional);
        return $resBills->optional['total_items'];
    }

    public function getTotalRevenue()
    {
        $billObj = new \Bill();
        $optional = [
            'q' => 'status = 4'
        ];
        $resBills = $billObj->getListObj($optional);
        $totalRevenue = 0;
        foreach ($resBills->data as $order) {
            $totalRevenue += $order['price'];
        }
        return $totalRevenue;
    }
}

