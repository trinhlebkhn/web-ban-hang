<?php
/**
 * Created by PhpStorm.
 * User: hdba1
 * Date: 5/4/2018
 * Time: 1:03 AM
 */

namespace Graduate\Backend\Controllers;


class MenuController extends AuthorizedControllerBase
{
    public function indexAction()
    {
//        $data = [
//            [
//                'id' => '1',
//                'parent_id' => '0',
//                'menu_block_id' => '1',
//                'name' => 'Menu 1',
//                'link' => '/san-pham',
//                'sort' => '1',
//            ],
//            [
//                'id' => '2',
//                'parent_id' => '0',
//                'menu_block_id' => '1',
//                'name' => 'Menu 2',
//                'link' => '/san-pham',
//                'sort' => '1',
//            ],
//            [
//                'id' => '3',
//                'parent_id' => '0',
//                'menu_block_id' => '1',
//                'name' => 'Menu 3',
//                'link' => '/san-pham',
//                'sort' => '1',
//            ],
//            [
//                'id' => '4',
//                'parent_id' => '0',
//                'menu_block_id' => '1',
//                'name' => 'Menu 4',
//                'link' => '/san-pham',
//                'sort' => '1',
//            ],
//            [
//                'id' => '5',
//                'parent_id' => '1',
//                'menu_block_id' => '1',
//                'name' => 'Menu 5',
//                'link' => '/san-pham',
//                'sort' => '1',
//            ],
//            [
//                'id' => '6',
//                'parent_id' => '1',
//                'menu_block_id' => '1',
//                'name' => 'Menu 6',
//                'link' => '/san-pham',
//                'sort' => '1',
//            ],
//            [
//                'id' => '7',
//                'parent_id' => '6',
//                'menu_block_id' => '1',
//                'name' => 'Menu 7',
//                'link' => '/san-pham',
//                'sort' => '1',
//            ],
//            [
//                'id' => '8',
//                'parent_id' => '6',
//                'menu_block_id' => '1',
//                'name' => 'Menu 8',
//                'link' => '/san-pham',
//                'sort' => '1',
//            ],
//        ];
//
//        $data = [
//            [
//                'id' => '1',
//                'parent_id' => '0',
//                'menu_block_id' => '1',
//                'name' => 'Menu 1',
//                'link' => '/san-pham',
//                'sort' => '1',
//                'child' => [
//                    [
//                        'id' => '5',
//                        'parent_id' => '1',
//                        'menu_block_id' => '1',
//                        'name' => 'Menu 5',
//                        'link' => '/san-pham',
//                        'sort' => '1',
//                    ],
//                    [
//                        'id' => '6',
//                        'parent_id' => '1',
//                        'menu_block_id' => '1',
//                        'name' => 'Menu 6',
//                        'link' => '/san-pham',
//                        'sort' => '1',
//                        'child' => [
//                            'id' => '7',
//                            'parent_id' => '6',
//                            'menu_block_id' => '1',
//                            'name' => 'Menu 7',
//                            'link' => '/san-pham',
//                            'sort' => '1',
//                        ],
//                        [
//                            'id' => '8',
//                            'parent_id' => '6',
//                            'menu_block_id' => '1',
//                            'name' => 'Menu 8',
//                            'link' => '/san-pham',
//                            'sort' => '1',
//                        ],
//                    ],
//                ]
//            ],
//            [
//                'id' => '2',
//                'parent_id' => '0',
//                'menu_block_id' => '1',
//                'name' => 'Menu 2',
//                'link' => '/san-pham',
//                'sort' => '1',
//            ],
//            [
//                'id' => '3',
//                'parent_id' => '0',
//                'menu_block_id' => '1',
//                'name' => 'Menu 3',
//                'link' => '/san-pham',
//                'sort' => '1',
//            ],
//            [
//                'id' => '4',
//                'parent_id' => '0',
//                'menu_block_id' => '1',
//                'name' => 'Menu 4',
//                'link' => '/san-pham',
//                'sort' => '1',
//            ],
//        ];
        $menuBlockObj = new \MenuBlock();
        $listData = $menuBlockObj->getListObj();
        if ($listData->status) {
            $this->view->listData = $listData->data;
        } else {
            return $this->flash->error('Có lỗi hệ thống xảy ra!');
        }

        if ($this->request->isPost()) {
            $data = $this->request->get('data');
            if (empty($data['name'])) {
                $this->flash->error('Vui lòng nhập tên menu');
                return;
            }
            if (empty($data['check'])) {
                $list_is_main = array_column($listData->data, 'is_main');
                if (in_array(1, $list_is_main) && $data['is_main']) {
                    $this->flash->error('Bạn đã có menu chính! Vui lòng thao tác lại');
                    return;
                }
            }

            if (empty($data['id'])) {
                $rs = $menuBlockObj->createObj($data);
            } else {
                $rs = $menuBlockObj->updateObj($data);
            }
            if ($rs->status) {
                $this->flash->success($rs->message);
            } else {
                $this->flash->error($rs->message);
            }
            $listData = $menuBlockObj->getListObj();
            $this->view->listData = $listData->data;
        }
    }

    public function deleteAction()
    {
        $id = $this->request->get('id');
        $menuBlockObj = new \MenuBlock();
        $data = $menuBlockObj->getDetail($id);
        $obj = $data->data;
        $obj['del_flag'] = 1;
        $rs = $menuBlockObj->updateObj($obj);
        if ($rs->status) {
            $this->flash->success($rs->message);
        } else {
            $this->flash->error($rs->message);
        }
        $this->response->redirect(base_uri() . '/quan-tri/menu-block');
    }
}