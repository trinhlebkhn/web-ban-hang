<?php
/**
 * Created by PhpStorm.
 * User: admin
 * Date: 4/24/2018
 * Time: 4:39 PM
 */
use Phalcon\Paginator\Adapter\Model as PaginatorModel;

class User extends DbModel {
    /**
     * @var integer
     * @Primary
     * @Identity
     * @Column(type="integer", length=11, nullable=false)
     */
    public $id;
    /**
     * @var string
     * @Column(type="string", length=50, nullable=false)
     */
    public $fullname;
    /**
     * @var string
     * @Column(type="string", length=40, nullable=false)
     */
    public $email;
    /**
     * @var string
     * @Column(type="string", length=50, nullable=false)
     */
    public $password;
    /**
     * @var string
     * @Column(type="text", length=1000, nullable=true)
     */
    public $avatar;
    /**
     * @var integer
     * @Column(type="integer", length=1, nullable=false)
     */
    public $role;
    /**
     * @var integer
     * @Column(type="integer", length=1, nullable=true)
     */
    public $gender;
    /**
     * @var string
     * @Column(type="string", length=14, nullable=false)
     */
    public $phone;
    /**
     * @var integer
     * @Column(type="integer", length=11, nullable=true)
     */
    public $dob;
    /**
     * @var string
     * @Column(type="string", length=200, nullable=true)
     */
    public $address;
    /**
     * @var integer
     * @Column(type="integer", length=11, nullable=true)
     */
    public $datecreate;
    /**
     * @var integer
     * @Column(type="integer", length=1, nullable=true)
     */
    public $status;

    /**
     * @return int
     */
    public function getId() {
        return $this->id;
    }

    /**
     * @param int $id
     */
    public function setId($id) {
        $this->id = $id;
    }

    /**
     * @return string
     */
    public function getFullname() {
        return $this->fullname;
    }

    /**
     * @param string $fullname
     */
    public function setFullname($fullname) {
        $this->fullname = $fullname;
    }

    /**
     * @return string
     */
    public function getEmail() {
        return $this->email;
    }

    /**
     * @param string $email
     */
    public function setEmail($email) {
        $this->email = $email;
    }

    /**
     * @return string
     */
    public function getPassword() {
        return $this->password;
    }

    /**
     * @param string $password
     */
    public function setPassword($password) {
        $this->password = $password;
    }

    /**
     * @return int
     */
    public function getRole() {
        return $this->role;
    }

    /**
     * @param int $role
     */
    public function setRole($role) {
        $this->role = $role;
    }

    /**
     * @return int
     */
    public function getGender() {
        return $this->gender;
    }

    /**
     * @param int $gender
     */
    public function setGender($gender) {
        $this->gender = $gender;
    }

    /**
     * @return string
     */
    public function getPhone() {
        return $this->phone;
    }

    /**
     * @param string $phone
     */
    public function setPhone($phone) {
        $this->phone = $phone;
    }

    /**
     * @return int
     */
    public function getDob() {
        return $this->dob;
    }

    /**
     * @param int $dob
     */
    public function setDob($dob) {
        $this->dob = $dob;
    }

    /**
     * @return string
     */
    public function getAddress() {
        return $this->address;
    }

    /**
     * @param string $address
     */
    public function setAddress($address) {
        $this->address = $address;
    }

    /**
     * @return int
     */
    public function getDatecreate() {
        return $this->datecreate;
    }

    /**
     * @param int $datecreate
     */
    public function setDatecreate($datecreate) {
        $this->datecreate = $datecreate;
    }

    /**
     * @return int
     */
    public function getStatus() {
        return $this->status;
    }

    /**
     * @param int $status
     */
    public function setStatus($status) {
        $this->status = $status;
    }

    /**
     * @return string
     */
    public function getAvatar() {
        return $this->avatar;
    }

    /**
     * @param string $avatar
     */
    public function setAvatar($avatar) {
        $this->avatar = $avatar;
    }

    /**
     * Returns table name mapped in the model.
     * @return string
     */
    public function getSource() {
        return 'mod_user';
    }

    public function createObj($data) {
        try {
            $obj = self::findFirst([
                'conditions' => 'email = :email: or phone = :phone:',
                'bind' => [
                    'email' => $data['email'],
                    'phone' => $data['phone']
                ],
            ]);
            if (!$obj) {
                $current_password = $data['password'];
                $data['password'] = md5($data['password']);
                $data['dob'] = strtotime($data['dob']);
                $data['datecreate'] = time();
                $rs = self::newInstance($data);
                $rs->save();
                if (!empty($rs->getMessages())) {
                    return $this->manipulationError([], 'Có lỗi xảy ra');
                }
                else {
                    $obj = $rs->toArray();
                    $obj['password'] = $current_password;
                    $login = $this->checkLogin($obj);
                    if(!$login->status) return $this->manipulationError([], 'Có lỗi xảy ra khi đăng nhập!');
                    return $login;
                }
            } else {
                $obj = $obj->toArray();
                if($obj['email'] == $data['email']) {
                    return $this->manipulationError([], 'Email đã được sử dụng!');
                } else {
                    return $this->manipulationError([], 'Số điện thoại đã được sử dụng!');
                }
            }
        } catch (Exception $e) {
            return $this->manipulationError([], $e->getMessage());
        }
    }

    public function getListObj($optional = []) {
        try {
            $arrObj = [];
            $o = [];
            $listObj = $this->modelsManager->createBuilder()->columns([
                    'id',
                    'fullname',
                    'email',
                    'avatar',
                    'role',
                    'gender',
                    'phone',
                    'dob',
                    'address',
                    'datecreate',
                    'status'
                ])->from(self::class)->where(isset($optional['q']) ? $optional['q'] : '1=1')->getQuery()//                ->getSql();
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
            }
            else {
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

    public function checkLogin($data) {
        try {
            $obj = self::findFirst([
                'conditions' => 'email like :email:',
                'bind' => [
                    'email' => $data['email']
                ],
            ]);
            if (!empty($obj->toArray())) {
                $user = $obj->toArray();
                $security = provider('security');
                $check_pass = md5($data['password']);
                if ($check_pass == $user['password']) {
                    unset($user['password']);
                    $user['dob'] = date("d/m/Y", intval($user['dob']));
                    return $this->manipulationSuccess($user, 'Thao tác thành công');
                }
                else {
                    return $this->manipulationError([], 'Sai mật khẩu!');
                }
            }
            else {
                return $this->manipulationError([], 'Tài khoản không tồn tại');
            }
        } catch (Exception $e) {
            return $this->manipulationError([], $e->getMessage());
        }
    }

    public function getDetail($id) {
        try {
            $obj = self::findFirst($id);
            if (!empty($obj->toArray())) {
                $data = $obj->toArray();
                $data['date_create'] = date("d/m/Y H:i:s", intval($data['date_create']));
                $data['dob'] = date("d/m/Y H:i:s", intval($data['dob']));
                return $this->manipulationSuccess($data, 'Thao tác thành công');
            }
            else {
                return $this->manipulationError([], 'Có lỗi xảy ra. Vui lòng liên hệ nhà quản trị!');
            }
        } catch (Exception $e) {
            return $this->manipulationError([], $e->getMessage());
        }
    }

    public function updateObj($data)
    {
        try {
            $obj = self::findFirst([
                'conditions' => 'email = :email: or phone = :phone:',
                'bind' => [
                    'email' => $data['email'],
                    'phone' => $data['phone']
                ],
            ]);
            if (!$obj || ($obj->toArray()['id'] == $data['id'])) {
                if(!empty($data['password'])) $data['password'] = md5($data['password']);
                $data['dob'] = strtotime($data['dob']);
                $objUpdate = self::findFirst($data['id']);
                if ($objUpdate) {
                    $objUpdate->update($data);
                    $rs = $objUpdate->toArray();
                    unset($rs['password']);
                    $rs['dob'] = date("d/m/Y", intval($rs['dob']));
                    return $this->manipulationSuccess($rs, 'Cập nhật thành công');
                } else {
                    return $this->manipulationError([], 'Tài khoản không tồn tại!');
                }
            } else {
                $dataObj = $obj->toArray();
                if(!empty($data['password'])) {
                    if(md5($data['current_password'] == $dataObj['password'])){
                        $data['password'] = md5($data['password']);
                        $obj->update($data);
                        $dataObj['dob'] = date("d/m/Y", intval($dataObj['dob']));
                        return $this->manipulationSuccess($dataObj, 'Cập nhật thành công');
                    } else {
                        return $this->manipulationError([], 'Mật khẩu hiện tại của bạn không đúng! Vui lòng nhập lại');
                    }
                } else {
                    if($dataObj['email'] == $data['email']) {
                        return $this->manipulationError([], 'Email đã được sử dụng!');
                    } else {
                        return $this->manipulationError([], 'Số điện thoại đã được sử dụng!');
                    }
                }
            }
        } catch (Exception $e) {
            return $this->manipulationError([], $e->getMessage());
        }
    }
}