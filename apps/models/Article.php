<?php
/**
 * Created by PhpStorm.
 * User: An Viet Computer
 * Date: 12/11/2018
 * Time: 11:44 PM
 */
use Phalcon\Paginator\Adapter\Model as PaginatorModel;
class Article extends DbModel
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
     * @var integer
     * @Column(type="integer", length=11, nullable=false)
     */
    public $category_id;

    /**
     *
     * @var string
     * @Column(type="string", length=450, nullable=false)
     */
    public $name;

    /**
     *
     * @var string
     * @Column(type="string", length=1000, nullable=false)
     */
    public $slug;

    /**
     *
     * @var string
     * @Column(type="string", length=450, nullable=false)
     */
    public $caption;

    /**
     *
     * @var string
     * @Column(type="string", length=5000, nullable=false)
     */
    public $content;

    /**
     *
     * @var string
     * @Column(type="string", length=450, nullable=true)
     */
    public $avatar;

    /**
     *
     * @var integer
     * @Column(type="integer", length=11, nullable=false)
     */
    public $datecreate;

    /**
     *
     * @var integer
     * @Column(type="integer", length=1, nullable=false)
     */
    public $status;

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
     * @Column(type="integer", length=1, nullable=false)
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
    public function getCaption()
    {
        return $this->caption;
    }

    /**
     * @param string $caption
     */
    public function setCaption($caption)
    {
        $this->caption = $caption;
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
        return 'mod_article';
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
                return $this->manipulationSuccess($rs->toArray(), 'Thêm mới bài viết thành công!');
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
                ->orderBy('id DESC')
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
                    $obj['datecreate'] = date("d/m/Y H:i:s", intval($obj['datecreate']));
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
            $obj = $this->modelsManager->createBuilder()
                ->from(self::class)
                ->join(Category::class)
                ->where('Category.id = Article.category_id')
                ->andwhere('Article.id = ' . $id)
                ->columns(['Article.id as id', 'Article.category_id as category_id', 'Category.name as category_name', 'Article.name as name',
                    'Article.slug as slug', 'Article.caption as caption', 'Article.content as content', 'Article.avatar as avatar',
                    'Article.status as status', 'Article.datecreate as datecreate', 'Article.seo_title as seo_title',
                    'Article.seo_key as seo_key', 'Article.seo_description as seo_description', 'Article.del_flag as del_flag'])
                ->getQuery()
//                ->getSql();
                ->execute();
//            $obj = self::findFirst($id);
            if (!empty($obj->toArray())) {
                $rs = $obj->toArray()[0];
                $rs['datecreate'] = date("d/m/Y H:i:s", intval($rs['datecreate']));
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