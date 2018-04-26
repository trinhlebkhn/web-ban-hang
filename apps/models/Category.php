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
    public $del_flag;

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
        $rs = self::newInstance($data);
        //d($data, $rs->toArray());//
        $rs->save();
        if (!empty($rs->getMessages())) {
            return $this->manipulationError([], 'Có lỗi xảy ra');
        } else {
            return $this->manipulationSuccess($rs->toArray(), 'Thao tác thành công!');
        }
    }

    public function getListObj($type = null)
    {
        try {
            $rs = self::find();
            return $rs;
        } catch (Exception $e) {
            d($e->getMessage());
            return $this->manipulationError([], $e->getMessage());
        }
    }
}