<?php
/**
 * Created by PhpStorm.
 * User: An Viet Computer
 * Date: 8/21/2018
 * Time: 12:50 AM
 */

class Ward extends DbModel
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
    public $district_id;

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
    public function getDistrictId()
    {
        return $this->district_id;
    }

    /**
     * @param int $district_id
     */
    public function setDistrictId($district_id)
    {
        $this->district_id = $district_id;
    }

    /**
     * Returns table name mapped in the model.
     *
     * @return string
     */

    public function getSource()
    {
        return 'mod_wards';
    }

    public function getListObj($district_id) {
        try {
            $listData = self::find([
                'conditions' => 'district_id = :district_id:',
                'bind' => [
                    'district_id' => $district_id
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