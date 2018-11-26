<?php
/**
 * Created by PhpStorm.
 * User: An Viet Computer
 * Date: 11/26/2018
 * Time: 10:58 PM
 */

class Location extends DbModel
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
     * @var string
     * @Column(type="string", length=150, nullable=false)
     */
    public $name;

    /**
     * @var string
     * @Column(type="string", length=10, nullable=false)
     */
    public $location_type;

    /**
     * @var integer
     * @Column(type="integer", length=11, nullable=false)
     */
    public $parent_id;

    /**
     * @var integer
     * @Column(type="integer", length=11, nullable=false)
     */
    public $viettelpost_id;

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
     * @return string
     */
    public function getLocationType()
    {
        return $this->location_type;
    }

    /**
     * @param string $location_type
     */
    public function setLocationType($location_type)
    {
        $this->location_type = $location_type;
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
    public function getViettelpostId()
    {
        return $this->viettelpost_id;
    }

    /**
     * @param int $viettelpost_id
     */
    public function setViettelpostId($viettelpost_id)
    {
        $this->viettelpost_id = $viettelpost_id;
    }

    /**
     * Returns table name mapped in the model.
     *
     * @return string
     */
    public function getSource()
    {
        return 'mod_location';
    }

    public function getListObj($type, $parent_id) {
        try {
            $listData = self::find([
                'conditions' => 'location_type = :location_type: and parent_id = :parent_id:',
                'bind' => [
                    'location_type' => $type,
                    'parent_id' => $parent_id,
                ]
            ]);
            if (empty($listData->getMessages())) {
                $result = $listData->toArray();
                return $this->manipulationSuccess($result, 'Thao tác thành công!');
            } else {
                return $this->manipulationError([], 'Có lỗi xảy ra!');
            }
        } catch (Exception $e) {
            return $this->manipulationError([], $e->getMessage());
        }
    }
}