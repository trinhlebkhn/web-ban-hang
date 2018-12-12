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
     * @Column(type="string", length=500, nullable=true)
     */
    public $website_name;

    /**
     *
     * @var string
     * @Column(type="string", length=1000, nullable=true)
     */
    public $avatar;

    /**
     *
     * @var string
     * @Column(type="string", length=1000, nullable=true)
     */
    public $favicon;

    /**
     *
     * @var string
     * @Column(type="string", length=5000, nullable=true)
     */
    public $sliders;

    /**
     *
     * @var string
     * @Column(type="string", length=1000, nullable=true)
     */
    public $seo_key;

    /**
     *
     * @var string
     * @Column(type="string", length=1000, nullable=true)
     */
    public $seo_title;

    /**
     *
     * @var string
     * @Column(type="string", length=1000, nullable=true)
     */
    public $seo_description;

    /**
     *
     * @var string
     * @Column(type="string", length=5000, nullable=true)
     */
    public $advances;

    /**
     *
     * @var string
     * @Column(type="string", length=5000, nullable=true)
     */
    public $branch;

    /**
     *
     * @var string
     * @Column(type="string", length=1000, nullable=true)
     */
    public $facebook_link;

    /**
     *
     * @var string
     * @Column(type="string", length=1000, nullable=true)
     */
    public $google_link;

    /**
     *
     * @var string
     * @Column(type="string", length=1000, nullable=true)
     */
    public $twitter_link;

    /**
     *
     * @var string
     * @Column(type="string", length=1000, nullable=true)
     */
    public $linkedin_link;

    /**
     *
     * @var string
     * @Column(type="string", length=1000, nullable=true)
     */
    public $youtube_link;

    /**
     *
     * @var string
     * @Column(type="string", length=1000, nullable=true)
     */
    public $list_block_menu_footer;

    /**
     *
     * @var integer
     * @Column(type="integer", length=11, nullable=true)
     */
    public $block_menu_bottom_footer;

    /**
     *
     * @var string
     * @Column(type="string", length=1000, nullable=true)
     */
    public $time_open;

    /**
     *
     * @var string
     * @Column(type="string", length=1000, nullable=true)
     */
    public $time_close;

    /**
     * @return string
     */
    public function getTimeOpen()
    {
        return $this->time_open;
    }

    /**
     * @param string $time_open
     */
    public function setTimeOpen($time_open)
    {
        $this->time_open = $time_open;
    }

    /**
     * @return string
     */
    public function getTimeClose()
    {
        return $this->time_close;
    }

    /**
     * @param string $time_close
     */
    public function setTimeClose($time_close)
    {
        $this->time_close = $time_close;
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
    public function getWebsiteName()
    {
        return $this->website_name;
    }

    /**
     * @param string $website_name
     */
    public function setWebsiteName($website_name)
    {
        $this->website_name = $website_name;
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
     * @return string
     */
    public function getFavicon()
    {
        return $this->favicon;
    }

    /**
     * @param string $favicon
     */
    public function setFavicon($favicon)
    {
        $this->favicon = $favicon;
    }

    /**
     * @return string
     */
    public function getSliders()
    {
        return $this->sliders;
    }

    /**
     * @param string $sliders
     */
    public function setSliders($sliders)
    {
        $this->sliders = $sliders;
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
    public function getAdvances()
    {
        return $this->advances;
    }

    /**
     * @param string $advances
     */
    public function setAdvances($advances)
    {
        $this->advances = $advances;
    }

    /**
     * @return string
     */
    public function getBranch()
    {
        return $this->branch;
    }

    /**
     * @param string $branch
     */
    public function setBranch($branch)
    {
        $this->branch = $branch;
    }

    /**
     * @return string
     */
    public function getFacebookLink()
    {
        return $this->facebook_link;
    }

    /**
     * @param string $facebook_link
     */
    public function setFacebookLink($facebook_link)
    {
        $this->facebook_link = $facebook_link;
    }

    /**
     * @return string
     */
    public function getGoogleLink()
    {
        return $this->google_link;
    }

    /**
     * @param string $google_link
     */
    public function setGoogleLink($google_link)
    {
        $this->google_link = $google_link;
    }

    /**
     * @return string
     */
    public function getTwitterLink()
    {
        return $this->twitter_link;
    }

    /**
     * @param string $twitter_link
     */
    public function setTwitterLink($twitter_link)
    {
        $this->twitter_link = $twitter_link;
    }

    /**
     * @return string
     */
    public function getLinkedinLink()
    {
        return $this->linkedin_link;
    }

    /**
     * @param string $linkedin_link
     */
    public function setLinkedinLink($linkedin_link)
    {
        $this->linkedin_link = $linkedin_link;
    }

    /**
     * @return string
     */
    public function getYoutubeLink()
    {
        return $this->youtube_link;
    }

    /**
     * @param string $youtube_link
     */
    public function setYoutubeLink($youtube_link)
    {
        $this->youtube_link = $youtube_link;
    }

    /**
     * @return string
     */
    public function getListBlockMenuFooter()
    {
        return $this->list_block_menu_footer;
    }

    /**
     * @param string $list_block_menu_footer
     */
    public function setListBlockMenuFooter($list_block_menu_footer)
    {
        $this->list_block_menu_footer = $list_block_menu_footer;
    }

    /**
     * @return int
     */
    public function getBlockMenuBottomFooter()
    {
        return $this->block_menu_bottom_footer;
    }

    /**
     * @param int $block_menu_bottom_footer
     */
    public function setBlockMenuBottomFooter($block_menu_bottom_footer)
    {
        $this->block_menu_bottom_footer = $block_menu_bottom_footer;
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
//                d($data);
                $obj->update($data);
                return $this->manipulationSuccess($obj->toArray(), 'Thao tác thành công!');
            }
        } catch (Exception $e) {
            d($e->getMessage());
            return $this->manipulationError([], $e->getMessage());
        }
    }

    public function getConfig($id)
    {
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