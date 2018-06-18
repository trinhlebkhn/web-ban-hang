<?php
/**
 * Created by PhpStorm.
 * User: admin
 * Date: 5/30/2018
 * Time: 4:38 PM
 */
use Phalcon\Paginator\Adapter\Model as PaginatorModel;

class Bill extends DbModel {
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
     * @Column(type="integer", length=11, nullable=false)
     */
    public $customer_id;

    /**
     *
     * @var string
     * @Column(type="string", length=50, nullable=false)
     */
    public $customer_name;

    /**
     *
     * @var string
     * @Column(type="string", length=40, nullable=true)
     */
    public $email;

    /**
     *
     * @var string
     * @Column(type="string", length=14, nullable=false)
     */
    public $phone;

    /**
     *
     * @var string
     * @Column(type="string", length=450, nullable=false)
     */
    public $address;

    /**
     *
     * @var integer
     * @Column(type="integer", length=11, nullable=false)
     */
    public $price;

    /**
     *
     * @var integer
     * @Column(type="integer", length=11, nullable=true)
     */
    public $ship_price;

    /**
     *
     * @var integer
     * @Column(type="integer", length=11, nullable=true)
     */
    public $payment;

    /**
     *
     * @var integer
     * @Column(type="integer", length=11, nullable=false)
     */
    public $total_price;

    /**
     *
     * @var integer
     * @Column(type="integer", length=1, nullable=false)
     */
    public $status;

    /**
     *
     * @var integer
     * @Column(type="integer", length=1, nullable=false)
     */
    public $source_bill;

    /**
     *
     * @var string
     * @Column(type="text", length=11, nullable=true)
     */
    public $description;

    /**
     *
     * @var integer
     * @Column(type="integer", length=11, nullable=false)
     */
    public $date_create;

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
     * @return int
     */
    public function getCustomerId() {
        return $this->customer_id;
    }

    /**
     * @param int $customer_id
     */
    public function setCustomerId($customer_id) {
        $this->customer_id = $customer_id;
    }

    /**
     * @return string
     */
    public function getCustomerName() {
        return $this->customer_name;
    }

    /**
     * @param string $customer_name
     */
    public function setCustomerName($customer_name) {
        $this->customer_name = $customer_name;
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
    public function getPrice() {
        return $this->price;
    }

    /**
     * @param int $price
     */
    public function setPrice($price) {
        $this->price = $price;
    }

    /**
     * @return int
     */
    public function getShipPrice() {
        return $this->ship_price;
    }

    /**
     * @param int $ship_price
     */
    public function setShipPrice($ship_price) {
        $this->ship_price = $ship_price;
    }

    /**
     * @return int
     */
    public function getTotalPrice() {
        return $this->total_price;
    }

    /**
     * @param int $total_price
     */
    public function setTotalPrice($total_price) {
        $this->total_price = $total_price;
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
     * @return int
     */
    public function getSourceBill() {
        return $this->source_bill;
    }

    /**
     * @param int $source_bill
     */
    public function setSourceBill($source_bill) {
        $this->source_bill = $source_bill;
    }

    /**
     * @return string
     */
    public function getDescription() {
        return $this->description;
    }

    /**
     * @param string $description
     */
    public function setDescription($description) {
        $this->description = $description;
    }

    /**
     * @return int
     */
    public function getDateCreate() {
        return $this->date_create;
    }

    /**
     * @param int $date_create
     */
    public function setDateCreate($date_create) {
        $this->date_create = $date_create;
    }

    /**
     * @return int
     */
    public function getPayment()
    {
        return $this->payment;
    }

    /**
     * @param int $payment
     */
    public function setPayment($payment)
    {
        $this->payment = $payment;
    }



    /**
     * Returns table name mapped in the model.
     *
     * @return string
     */
    public function getSource()
    {
        return 'mod_bill';
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
                $paginator = new PaginatorModel(
                    [
                        "data" => $listObj,
                        "limit" => $optional['limit'],
                        "page" => $page
                    ]
                );
                $paginate = $paginator->getPaginate();
                foreach ($paginate->items as &$item) {
                    $obj = $item->toArray();
//                    $obj = $this->updateStatusObj($obj);
                    $obj['date_create'] = date("d/m/Y H:i:s", intval($obj['date_create']));
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
                foreach ($arrObj as &$item) {
//                    $item = $this->updateStatusObj($item);
                    $item['date_create'] = date("d/m/Y H:i:s", intval($item['date_create']));
                }
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
                $rs = $obj->toArray();
                $rs['date_create'] = date("d/m/Y H:i:s", intval($rs['date_create']));
                $rs['date_payment'] = date("d/m/Y H:i:s", intval($rs['date_payment']));
                $productBillObj = new ProductBill();
                $listProduct  = $productBillObj->getListObj($rs['id']);
                $rs['list_product'] = $listProduct;
                return $this->manipulationSuccess($rs, 'Thao tác thành công');
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
                return $this->manipulationSuccess($obj->toArray(), 'Cập nhật thành công');
            }
        } catch (Exception $e) {
            return $this->manipulationError([], $e->getMessage());
        }
    }

    public function updateStatusObj($obj){
        $check = round((time() - $obj['date_create'])/86400);
        if($check >= 1 && $obj['status'] == 1) {
            $obj['status'] = 6;
            $rs = $this->updateObj($obj);
            $obj = $rs->data;
        }
        return $obj;
    }

}