<?php
/**
 * Created by PhpStorm.
 * User: hdba1
 * Date: 5/1/2018
 * Time: 8:53 PM
 */

use Phalcon\Paginator\Adapter\Model as PaginatorModel;

class Product extends DbModel
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
     * @Column(type="string", length=80, nullable=false)
     */
    public $name;

    /**
     *
     * @var string
     * @Column(type="text", length=1000, nullable=false)
     */
    public $slug;

    /**
     *
     * @var string
     * @Column(type="text", length=5000, nullable=true)
     */
    public $content;

    /**
     *
     * @var string
     * @Column(type="text", length=500, nullable=true)
     */
    public $avatar;

    /**
     *
     * @var integer
     * @Column(type="int", length=1, nullable=false)
     */
    public $status;

    /**
     *
     * @var string
     * @Column(type="json", length=100, nullable=true)
     */
    public $category_id;

    /**
     *
     * @var double
     * @Column(type="double", length=15, nullable=true)
     */
    public $price;

    /**
     *
     * @var double
     * @Column(type="double", length=15, nullable=true)
     */
    public $discount;

    /**
     *
     * @var double
     * @Column(type="double", length=15, nullable=false)
     */
    public $price_sell;

    /**
     *
     * @var double
     * @Column(type="double", length=15, nullable=false)
     */
    public $price_import;

    /**
     *
     * @var integer
     * @Column(type="int", length=1, nullable=true)
     */
    public $type_discount;

    /**
     *
     * @var double
     * @Column(type="double", length=15, nullable=true)
     */
    public $weight;

    /**
     *
     * @var string
     * @Column(type="text", length=5000, nullable=true)
     */
    public $descript;

    /**
     *
     * @var string
     * @Column(type="text", length=1000, nullable=true)
     */
    public $attribute;

    /**
     *
     * @var string
     * @Column(type="text", length=5000, nullable=true)
     */
    public $image;

    /**
     *
     * @var integer
     * @Column(type="int", length=10, nullable=true)
     */
    public $datecreate;

    /**
     *
     * @var string
     * @Column(type="string", length=450, nullable=true)
     */
    public $seo_title;

    /**
     *
     * @var string
     * @Column(type="string", length=450, nullable=true)
     */
    public $seo_key;

    /**
     *
     * @var string
     * @Column(type="string", length=450, nullable=true)
     */
    public $seo_description;

    /**
     *
     * @var integer
     * @Column(type="int", length=1, nullable=true)
     */
    public $del_lag;

    /**
     *
     * @var string
     * @Column(type="string", length=50, nullable=true)
     */
    public $zalo_id;

    /**
     * @return string
     */
    public function getZaloId()
    {
        return $this->zalo_id;
    }

    /**
     * @param string $zalo_id
     */
    public function setZaloId($zalo_id)
    {
        $this->zalo_id = $zalo_id;
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
     * @return string
     */
    public function getSlug()
    {
        return $this->slug;
    }

    /**
     * @param string $slug
     */
    public function setSlug($slug)
    {
        $this->slug = $slug;
    }

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
    public function getCategoryId()
    {
        return $this->category_id;
    }

    /**
     * @param int $category_id
     */
    public function setCategoryId($category_id)
    {
        $this->category_id = $category_id;
    }

    /**
     * @return float
     */
    public function getPrice()
    {
        return $this->price;
    }

    /**
     * @param float $price
     */
    public function setPrice($price)
    {
        $this->price = $price;
    }

    /**
     * @return float
     */
    public function getDiscount()
    {
        return $this->discount;
    }

    /**
     * @param float $discount
     */
    public function setDiscount($discount)
    {
        $this->discount = $discount;
    }

    /**
     * @return float
     */
    public function getPriceSell()
    {
        return $this->price_sell;
    }

    /**
     * @param float $price_sell
     */
    public function setPriceSell($price_sell)
    {
        $this->price_sell = $price_sell;
    }

    /**
     * @return float
     */
    public function getPriceImport()
    {
        return $this->price_import;
    }

    /**
     * @param float $price_import
     */
    public function setPriceImport($price_import)
    {
        $this->price_import = $price_import;
    }

    /**
     * @return int
     */
    public function getTypeDiscount()
    {
        return $this->type_discount;
    }

    /**
     * @param int $type_discount
     */
    public function setTypeDiscount($type_discount)
    {
        $this->type_discount = $type_discount;
    }

    /**
     * @return float
     */
    public function getWeight()
    {
        return $this->weight;
    }

    /**
     * @param float $weight
     */
    public function setWeight($weight)
    {
        $this->weight = $weight;
    }

    /**
     * @return string
     */
    public function getDescript()
    {
        return $this->descript;
    }

    /**
     * @param string $descript
     */
    public function setDescript($descript)
    {
        $this->descript = $descript;
    }

    /**
     * @return string
     */
    public function getAttribute()
    {
        return $this->attribute;
    }

    /**
     * @param string $attribute
     */
    public function setAttribute($attribute)
    {
        $this->attribute = $attribute;
    }

    /**
     * @return string
     */
    public function getImage()
    {
        return $this->image;
    }

    /**
     * @param string $image
     */
    public function setImage($image)
    {
        $this->image = $image;
    }

    /**
     * @return int
     */
    public function getDatecreate()
    {
        return $this->datecreate;
    }

    /**
     * @param int $datecreate
     */
    public function setDatecreate($datecreate)
    {
        $this->datecreate = $datecreate;
    }

    /**
     * @return string
     */
    public function getSeoTitle()
    {
        return $this->seo_title;
    }

    /**
     * @param string $seo_title
     */
    public function setSeoTitle($seo_title)
    {
        $this->seo_title = $seo_title;
    }

    /**
     * @return string
     */
    public function getSeoKey()
    {
        return $this->seo_key;
    }

    /**
     * @param string $seo_key
     */
    public function setSeoKey($seo_key)
    {
        $this->seo_key = $seo_key;
    }

    /**
     * @return string
     */
    public function getSeoDescription()
    {
        return $this->seo_description;
    }

    /**
     * @param string $seo_description
     */
    public function setSeoDescription($seo_description)
    {
        $this->seo_description = $seo_description;
    }

    /**
     * @return int
     */
    public function getDelLag()
    {
        return $this->del_lag;
    }

    /**
     * @param int $del_lag
     */
    public function setDelLag($del_lag)
    {
        $this->del_lag = $del_lag;
    }

    /**
     * @return string
     */
    public function getContent()
    {
        return $this->content;
    }

    /**
     * @param string $content
     */
    public function setContent($content)
    {
        $this->content = $content;
    }

    /**
     * Returns table name mapped in the model.
     *
     * @return string
     */

    public function getSource()
    {
        return 'mod_product';
    }

    public function createObj($data)
    {
        try {
            $data['datecreate'] = time();
            $data['del_flag'] = 0;
            $rs = self::newInstance($data);
            $rs->save();
            if (!empty($rs->getMessages())) {
                return $this->manipulationError([], 'Có lỗi xảy ra');
            } else {
                return $this->manipulationSuccess($rs->toArray(), 'Thêm mới sản phẩm thành công!');
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
                ->andwhere('del_flag != 1')
                ->orderBy(isset($optional['order_by']) ? $optional['order_by'] : 'id DESC')
                ->getQuery()
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
                $data = $obj->toArray();
                $data['attribute'] = json_decode($data['attribute']);

                /* Xử lý thuộc tính sản phẩm */
                $attrObj = new Attribute();
                $listAttr = $attrObj->getListObj()->data;
                foreach ($data['attribute'] as &$val) {
                    foreach ($listAttr as $attr) {
                        if($attr['id'] == $val->id) {
                            $val->name = $attr['name'];
                            break;
                        }
                    }
                }
                $data['attribute'] = json_encode($data['attribute']);
                return $this->manipulationSuccess($data, 'Thao tác thành công');
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

    public function findObj()
    {
        try {
            $obj = self::find([
                'conditions' => 'JSON_CONTAINS(category_id, ":category_id:"',
                'bind' => [
                    'category_id' => [1, 16]
                ]
            ]);
            d($obj);
        } catch (Exception $e) {
            return $this->manipulationError([], $e->getMessage());
        }
    }
}