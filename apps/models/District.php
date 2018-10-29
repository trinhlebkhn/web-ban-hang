<?php
/**
 * Created by PhpStorm.
 * User: An Viet Computer
 * Date: 8/21/2018
 * Time: 12:47 AM
 */

class District extends DbModel
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
     * @Column(type="string", length=100, nullable=false)
     */
    public $name;

    /**
     * @var string
     * @Column(type="string", length=30, nullable=false)
     */
    public $type;

    /**
     *
     * @var integer
     * @Column(type="integer", length=11, nullable=false)
     */
    public $city_id;

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
    public function getType()
    {
        return $this->type;
    }

    /**
     * @param string $type
     */
    public function setType($type)
    {
        $this->type = $type;
    }

    /**
     * @return int
     */
    public function getCityId()
    {
        return $this->city_id;
    }

    /**
     * @param int $city_id
     */
    public function setCityId($city_id)
    {
        $this->city_id = $city_id;
    }


    /**
     * Returns table name mapped in the model.
     *
     * @return string
     */

    public function getSource()
    {
        return 'mod_districts';
    }

    public function getListObj($city_id) {
        try {
            $listData = self::find([
                'conditions' => 'city_id = :city_id:',
                'bind' => [
                    'city_id' => $city_id
                ],
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