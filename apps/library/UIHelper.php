<?php
use Phalcon\Mvc\User\Component;
use Phalcon\Mvc\View\Engine\Volt as VoltEngine;

class UIHelper extends Component {
    public function format_number($number = '') {
        if ($number == '') {
            return 0;
        }
        //Remove anything that isn't a number or decimal point
        $number = trim(preg_replace('/([^0-9\.])/i', '', $number));
        return number_format($number, 0, ',', '.');
//        return number_format($number);
    }

    public function check_in_array($obj, $array = []) {
        if (in_array($obj, $array)) return true;
        else return false;
    }

    public function formatNumber($number = '') {
        if ($number == '') {
            return '';
        }
        //Remove anything that isn't a number or decimal point
        $number = trim(preg_replace('/([^0-9\.])/i', '', $number));
//        return number_format($number, 2, '.', ',');
        return number_format($number);
    }

    public function drawRecursiveMenuAdmin($layout, $data, $menu_block_id) {
        return $this->view->getPartial($layout, [
            "data" => $data,
            'menuBlockId' => $menu_block_id
        ]);
    }

    public function drawRecursiveMenu($layout, $data) {
        return $this->view->getPartial($layout, ["data" => $data]);
    }

    public function makeLinkCategory($item) {
        if ($item->type == 1) return base_uri() . "$item->slug-pc" . $item->id . '.html';
        if ($item->type == 2) return base_uri() . "$item->slug-ac" . $item->id . '.html';
    }

    public function makeLinkProduct($item) {
        return base_uri() . $item['slug'] . '-p' . $item['id'] . '.html';
    }

    public function makeLinkArticle($item) {
        return base_uri() . $item['slug'] . '-a' . $item['id'] . '.html';
    }

    public function getArticleCategoryList(){
        $catObj = new \Category();
        $query_cat = [
            'q' => 'type = 2'
        ];
        $listCats = $catObj->getListObj($query_cat);
        foreach ($listCats->data as &$item) {
            $item = (object) $item;
        }
        return $listCats->data;
    }

    public function recursiveCat($data, $parent_id = 0, &$array, $char = '')
    {
        foreach ($data as $key => $item) {
            if ($item['parent_id'] == $parent_id) {
                $item['name'] = $char .'|-- '.  $item['name'];
                $array[] = $item;
                unset($data[$key]);
                $this->recursiveCat($data, $item['id'], $array, $char.'&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp');
            }
        }
    }
}