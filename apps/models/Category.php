<?php
/**
 * Created by PhpStorm.
 * User: hdba1
 * Date: 4/25/2018
 * Time: 3:09 AM
 */

use Phalcon\Mvc\Model;
use Phalcon\Mvc\Model\Resultset\Simple as Resultset;
use Phalcon\Paginator\Adapter\QueryBuilder as PaginationQueryBuilder;
use Phalcon\Paginator\Adapter\Model as PaginatorModel;

class Category extends DbModel
{
    const TYPE_PRODUCT = 1;
    const TYPE_ARTICEL = 2;
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
     * @var string
     * @Column(type="string", length=50, nullable=false)
     */
    public $name;

    /**
     *
     * @var integer
     * @Column(type="integer", length=11, nullable=true)
     */
    public $parent_id;

    /**
     *
     * @var string
     * @Column(type="text", length=500, nullable=true)
     */
    public $avatar;

    /**
     *
     * @var integer
     * @Column(type="integer", length=1, nullable=false)
     */
    public $type;

    /**
     *
     * @var string
     * @Column(type="string", length=10, nullable=true)
     */
    public $position;

    /**
     *
     * @var integer
     * @Column(type="integer", length=1, nullable=true)
     */
    public $status;

    /**
     *
     * @var integer
     * @Column(type="integer", length=1, nullable=true)
     */
    public $del_flag;

    /**
     * @return string
     */
    public function getAvatar()
    {
        return $this->avatar;
    }

    /**
     * @param string $avatar
     */
    public function setAvatar($avatar)
    {
        $this->avatar = $avatar;
    }

    /**
     * @return int
     */
    public function getStatus()
    {
        return $this->status;
    }

    /**
     * @param int $status
     */
    public function setStatus($status)
    {
        $this->status = $status;
    }

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
    public function getType()
    {
        return $this->type;
    }

    /**
     * @param int $type
     */
    public function setType($type)
    {
        $this->type = $type;
    }

    /**
     * @return string
     */
    public function getPosition()
    {
        return $this->position;
    }

    /**
     * @param string $position
     */
    public function setPosition($position)
    {
        $this->position = $position;
    }

    /**
     * @return int
     */
    public function getDelFlag()
    {
        return $this->del_flag;
    }

    /**
     * @param int $del_flag
     */
    public function setDelFlag($del_flag)
    {
        $this->del_flag = $del_flag;
    }


    /**
     * Returns table name mapped in the model.
     *
     * @return string
     */
    public function getSource()
    {
        return 'mod_category';
    }

    public function createObj($data)
    {
        try {
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

    public function getListObj($optional = [])
    {
        try {
            $arrObj = [];
            $o = [];
            $listObj = $this->modelsManager->createBuilder()
                ->from(self::class)
                ->where(isset($optional['q']) ? $optional['q'] : '1=1')
                ->getQuery()
                ->execute();
            $page = $optional['p'] ? $optional['p'] : 1;
            if(!empty($optional['limit'])){
                $paginator = new PaginatorModel(
                    [
                        "data" => $listObj,
                        "limit" => $optional['limit'],
                        "page" => $page
                    ]
                );
                $paginate = $paginator->getPaginate();
                foreach ($paginate->items as &$item){
                    $obj = $item->toArray();
                    array_push($arrObj, $obj);
                }
                $o = [
                    'limit' => $paginate->limit,
                    'total_items' => $paginate->total_items,
                    'curent_page' => $paginate->current,
                    'total_page' => $paginate->total_pages
                ];
            } else {
                $arrObj = $listObj->toArray();
                $o = [
                    'total_items' => sizeof($arrObj),
                    'curent_page' => 1,
                    'total_page' => 1
                ];
            }
            return $this->manipulationSuccess($arrObj, "Thao tác thành công!", $o);
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

    public function updateCat($data)
    {
        try {
            $obj = self::findFirst($data['id']);
            if ($obj) {
                $obj->update($data);
                return $this->manipulationSuccess($obj->toArray(), 'Cập nhật thành công');
            }
        } catch (Exception $e) {
            return $this->manipulationError([], $e->getMessage());
        }
    }

}