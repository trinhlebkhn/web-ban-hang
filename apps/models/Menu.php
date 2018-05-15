<?php
/**
 * Created by PhpStorm.
 * User: admin
 * Date: 5/10/2018
 * Time: 1:57 PM
 */

class Menu extends DbModel
{
    /**
     *
     * @var integer
     * @Primary
     * @Identity
     * @Column(type="integer", length=11, nullable=false)
     */
    public $id;

    /**
     *
     * @var integer
     * @Identity
     * @Column(type="integer", length=11, nullable=true)
     */
    public $parent_id;

    /**
     *
     * @var integer
     * @Column(type="integer", length=11, nullable=true)
     */
    public $menu_block_id;

    /**
     *
     * @var string
     * @Column(type="string", length=50, nullable=false)
     */
    public $name;

    /**
     *
     * @var integer
     * @Column(type="integer", length=1, nullable=true)
     */
    public $target;

    /**
     *
     * @var string
     * @Column(type="text", length=1000, nullable=true)
     */
    public $link;

    /**
     *
     * @var string
     * @Column(type="string", length=10, nullable=true)
     */
    public $sort;

    /**
     * @return int
     */
    public function getId()
    {
        return $this->id;
    }

    /**
     * @param int $id
     */
    public function setId($id)
    {
        $this->id = $id;
    }

    /**
     * @return int
     */
    public function getMenuBlockId()
    {
        return $this->menu_block_id;
    }

    /**
     * @param int $menu_block_id
     */
    public function setMenuBlockId($menu_block_id)
    {
        $this->menu_block_id = $menu_block_id;
    }

    /**
     * @return string
     */
    public function getName()
    {
        return $this->name;
    }

    /**
     * @param string $name
     */
    public function setName($name)
    {
        $this->name = $name;
    }

    /**
     * @return string
     */
    public function getLink()
    {
        return $this->link;
    }

    /**
     * @param string $link
     */
    public function setLink($link)
    {
        $this->link = $link;
    }

    /**
     * @return string
     */
    public function getSort()
    {
        return $this->sort;
    }

    /**
     * @param string $sort
     */
    public function setSort($sort)
    {
        $this->sort = $sort;
    }

    /**
     * @return int
     */
    public function getParentId()
    {
        return $this->parent_id;
    }

    /**
     * @param int $parent_id
     */
    public function setParentId($parent_id)
    {
        $this->parent_id = $parent_id;
    }

    /**
     * @return int
     */
    public function getTarget()
    {
        return $this->target;
    }

    /**
     * @param int $target
     */
    public function setTarget($target)
    {
        $this->target = $target;
    }

    /**
     * Returns table name mapped in the model.
     *
     * @return string
     */
    public function getSource()
    {
        return 'mode_menu';
    }

    public function createObj($data)
    {
        try {
            if ($data['type_link'] != 2) {
                $data['link'] = $data['type_link'];
            }
            $rs = self::newInstance($data);
            $rs->save();
            if (!empty($rs->getMessages())) {
                return $this->manipulationError([], 'Có lỗi xảy ra');
            } else {
                return $this->manipulationSuccess($rs->toArray(), 'Thao tác thành công!');
            }
        } catch (Exception $e) {
            return $this->manipulationError([], $e->getMessage());
        }
    }

    public function getListObj($menu_block_id)
    {
        try {
            $listData = self::find([
                'conditions' => 'menu_block_id = :menu_block_id:',
                'bind' => [
                    'menu_block_id' => $menu_block_id
                ],
            ]);
            if (empty($listData->getMessages())) {
                $arrayData = $listData->toArray();
                $result = [];
                $this->recursive($arrayData, 0, $result);
                d($result);
//                $this->recursiveLevel($result, $result[0]['id']);
                return $this->manipulationSuccess($result, 'Thao tác thành công!');
            } else {
                return $this->manipulationError([], 'Có lỗi xảy ra!');
            }
        } catch (Exception $e) {
            return $this->manipulationError([], $e->getMessage());
        }
    }

    public function recursive($menu, $parent_id = 0, &$array)
    {
        foreach ($menu as $key => $item) {
            if ($item['parent_id'] == $parent_id) {
                $array[] = $item;
                unset($menu[$key]);
                $this->recursive($menu, $item['id'], $array);
            }
        }
    }

//    public function recursiveLevel(&$data, $parent_id)
//    {
//        foreach ($data as $v => $value) {
//            if($data[$v+1]['parent_id'] == $parent_id){
//                if(empty($data[$v]['child'])) $data[$v]['child'] = [];
//                array_push($data[$v]['child'], $data[$v+1]);
//                $this->recursiveLevel($data[$v]['child'], $data[$v]['child'][0]['id']);
//                unset($data[$v]);
//            }
//
//        }
//    }


}