
<?php
/**
 * Created by PhpStorm.
 * User: An Viet Computer
 * Date: 9/27/2018
 * Time: 11:17 PM
 */

class Config extends DbModel
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
     * @var string
     * @Column(type="string", length=5000, nullable=true)
     */
    public $data_config;

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
    public function getDataConfig()
    {
        return $this->data_config;
    }

    /**
     * @param string $data_config
     */
    public function setDataConfig($data_config)
    {
        $this->data_config = $data_config;
    }

    /**
     * Returns table name mapped in the model.
     *
     * @return string
     */
    public function getSource()
    {
        return 'mod_config';
    }

    public function updateConfig($data)
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

    public function getConfig($id){
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
    }
}