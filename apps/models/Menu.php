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
     * @Column(type="string", length=11, nullable=true)
     */
    public $type_link;

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
     * @return string
     */
    public function getTypeLink()
    {
        return $this->type_link;
    }

    /**
     * @param string $type_link
     */
    public function setTypeLink($type_link)
    {
        $this->type_link = $type_link;
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
            if ($data['type_link'] == 1) {
                $data['link'] = '/san-pham';
            } else if ($data['type_link'] == 2) {
                $data['link'] = '/tin-tuc';
            } else if ($data['type_link'] == 3) {
                $data['link'] = '/lien-he';
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
                return $this->manipulationSuccess($result, 'Thao tác thành công!');
            } else {
                return $this->manipulationError([], 'Có lỗi xảy ra!');
            }
        } catch (Exception $e) {
            return $this->manipulationError([], $e->getMessage());
        }
    }

    public function getMenuInArrayBoxMenu($arrayBoxMenu)
    {
        try {
            $listData = $this->modelsManager->createBuilder()
                ->from(self::class)
                ->where('menu_block_id in ' . $arrayBoxMenu . 'and parent_id = 0')
                ->getQuery()
                ->execute();
            if (empty($listData->getMessages())) {
                $arrayData = $listData->toArray();
                return $this->manipulationSuccess($arrayData, 'Thao tác thành công!');
            } else {
                return $this->manipulationError([], 'Có lỗi xảy ra!');
            }
        } catch (Exception $e) {
            return $this->manipulationError([], $e->getMessage());
        }
    }

    public function getDetail($id)
    {
        try {
            $obj = self::findFirst($id);
            if (!empty($obj->toArray())) {
                return $this->manipulationSuccess($obj->toArray(), 'Thao tác thành công');
            } else {
                return $this->manipulationError([], 'Có lỗi xảy ra. Vui lòng liên hệ nhà quản trị!');
            }
        } catch (Exception $e) {
            return $this->manipulationError([], $e->getMessage());
        }
    }

    public function updateObj($data)
    {
        try {
            $obj = self::findFirst($data['id']);
            if ($obj) {
                $obj->update($data);
                return $this->manipulationSuccess($obj->toArray(), 'Thao tác thành công!');
            }
        } catch (Exception $e) {
            return $this->manipulationError([], $e->getMessage());
        }
    }

    public function deleteObj($id)
    {
        try {
            $obj = self::findFirst($id);
            if ($obj) {
                $obj->delete();
                return $this->manipulationSuccess($obj->toArray(), 'Xóa thành công');
            }
        } catch (Exception $e) {
            return $this->manipulationError([], $e->getMessage());
        }
    }
}