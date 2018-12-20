<?php
/**
 * Created by PhpStorm.
 * User: An Viet Computer
 * Date: 12/21/2018
 * Time: 12:04 AM
 */
use Phalcon\Paginator\Adapter\Model as PaginatorModel;

class Contact extends DbModel
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
     * @Column(type="string", length=50, nullable=false)
     */
    public $name;

    /**
     *
     * @var string
     * @Column(type="string", length=40, nullable=false)
     */
    public $email;

    /**
     *
     * @var string
     * @Column(type="string", length=10, nullable=false)
     */
    public $phone;

    /**
     *
     * @var string
     * @Column(type="string", length=1000, nullable=false)
     */
    public $message;

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
    public function getEmail()
    {
        return $this->email;
    }

    /**
     * @param string $email
     */
    public function setEmail($email)
    {
        $this->email = $email;
    }

    /**
     * @return string
     */
    public function getPhone()
    {
        return $this->phone;
    }

    /**
     * @param string $phone
     */
    public function setPhone($phone)
    {
        $this->phone = $phone;
    }

    /**
     * @return string
     */
    public function getMessage()
    {
        return $this->message;
    }

    /**
     * @param string $message
     */
    public function setMessage($message)
    {
        $this->message = $message;
    }


    /**
     * Returns table name mapped in the model.
     *
     * @return string
     */
    public function getSource()
    {
        return 'mod_contact';
    }

    public function createObj($data)
    {
        try {
            $obj = self::findFirst([
                'conditions' => 'email = :email: or phone = :phone:',
                'bind' => [
                    'email' => $data['email'],
                    'phone' => $data['phone']
                ],
            ]);
            if (!$obj) {
                $rs = self::newInstance($data);
                $rs->save();
                if (!empty($rs->getMessages())) {
                    return $this->manipulationError([], $rs->getMessages());
                } else return $this->manipulationSuccess($rs->toArray(), 'Thao tác thành công!');
            } else {
                $obj = $obj->toArray();
                if ($obj['email'] == $data['email']) {
                    return $this->manipulationError([], 'Email đã tồn tại trên hệ thống!');
                } else {
                    return $this->manipulationError([], 'Số điện thoại đã tồn tại trên hệ thống!');
                }
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
//                ->getSql();
                ->execute();
            $page = $optional['p'] ? $optional['p'] : 1;
            if (!empty($optional['limit'])) {
                $paginator = new PaginatorModel([
                    "data" => $listObj,
                    "limit" => $optional['limit'],
                    "page" => $page
                ]);
                $paginate = $paginator->getPaginate();
                foreach ($paginate->items as &$item) {
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


}