<?php
/**
 * Created by PhpStorm.
 * User: admin
 * Date: 6/30/2018
 * Time: 9:50 AM
 */

namespace Graduate\Frontend\Controllers;
class CustomerController extends ControllerBase
{

    public function indexAction()
    {
        $auth = $this->getAuth();
        $dob = explode('/', $auth['dob']);
        if ($this->request->isPost()) {
            $data = $this->request->get('data');
            $dob = $this->request->get('dob');
            $data['dob'] = $dob['year'] . '-' . $dob['month'] . '-' . $dob['day'];
            $userObj = new \User();
            $rs = $userObj->updateObj($data);
            if ($rs->status) {
                $data = $rs->data;
                $this->setAuth($rs->data);
                $this->flash->success($rs->message);
            } else {
                $this->flash->error($rs->message);
            }
            $dob = explode('/', $data['dob']);
            $this->view->data = $data;
        }
        $this->view->setVars([
            'day' => $dob[0],
            'month' => $dob[1],
            'year' => $dob[2]
        ]);
    }

    public function update_passwordAction()
    {
        if ($this->request->isPost()) {
            $userObj = new \User();
            $auth = $this->getAuth();
            $data = $this->request->getPost('password');
            $data['email'] = $auth['email'];
            $data['phone'] = $auth['phone'];
            $rsUpdate = $userObj->updateObj($data);
            if ($rsUpdate->status) $this->flash->success($rsUpdate->message);
            else $this->flash->error($rsUpdate->message);
        }
    }

    public function orderAction()
    {
        $background_status = [
            [
                'background' => '#f39c12',
                'name' => 'Mới'
            ],
            [
                'background' => '#00a65a',
                'name' => 'Xác nhận'
            ],
            [
                'background' => '#8bc24a',
                'name' => 'Đang chuyển'
            ],
            [
                'background' => 'teal',
                'name' => 'Thành công'
            ],
            [
                'background' => '#ff6600',
                'name' => 'Gọi lại'
            ],
            [
                'background' => '#bdbdbd',
                'name' => 'Hủy'
            ]
        ];
        $query = $this->request->getQuery();
        $page = $query['p'] ? $query['p'] : 1;
        $auth = $this->getAuth();
        $billObj = new \Bill();
        $optional = [
            'limit' => 10,
            'p' => $page,
            'q' => 'customer_id = ' . $auth['id']
        ];

        $rsGetBills = $billObj->getListObj($optional);
        $this->view->setVars([
            'listBills' => $rsGetBills->data,
            'Paginginfo' => $rsGetBills->optional,
            'Current_link' => $query['_url'],
            'background_status' => $background_status
        ]);
    }

    public function order_detailAction($id)
    {
        $billObj = new \Bill();
        $rs = $billObj->getDetail($id);
        $data = $rs->data;

        if (!$rs->status) {
            $this->flash->error($rs->message);
            return;
        }
        $this->view->setVars([
            'data' => $data,
        ]);
    }
}