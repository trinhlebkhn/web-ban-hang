<!-- footer -->
<footer id="footer">
    <section class="section">
        <div class="container">
            <div class="row element-top-40 element-bottom-40 footer-columns-4">
                <div class="col-sm-3">
                    <div class="sidebar-widget widget_text" id="text-15">
                        <h3 class="sidebar-header">Thông tin liên hệ</h3>
                        <div class="textwidget">
                            <address>
                                <b>Địa chỉ: </b><?= $websiteConfig->address ?>
                            </address>
                        </div>
                    </div>
                    <div class="sidebar-widget widget_social">
                        <ul class="unstyled inline social-icons social-simple social-normal">
                            <?php if (!empty($websiteConfig->twitter_fanpage)) { ?>
                                <li><a href="<?= $websiteConfig->twitter_fanpage ?>"><i class="fa fa-twitter"></i></a></li>
                            <?php } ?>
                            <?php if (!empty($websiteConfig->facebook_fanpage)) { ?>
                                <li><a href="<?= $websiteConfig->facebook_fanpage ?>"><i class="fa fa-facebook"></i></a></li>
                            <?php } ?>
                            <?php if (!empty($websiteConfig->google_page)) { ?>
                                <li><a href="<?= $websiteConfig->google_page ?>"><i class="fa fa-google-plus"></i></a></li>
                            <?php } ?>
                            <?php if (!empty($websiteConfig->youtube_fanpage)) { ?>
                                <li><a href="<?= $websiteConfig->youtube_fanpage ?>"><i class="fa fa-youtube"></i></a></li>
                            <?php } ?>
                        </ul>
                    </div>
                </div>
                <?php $footer_menu = $uihelper->getMenu($websiteConfig->footer_menu->menu_id, 1); ?>
                <?php foreach ($footer_menu->menu->data as $index => $menu) { ?>
                    <div class="col-sm-3">
                        <div class="sidebar-widget widget_text">
                            <h3 class="sidebar-header"><?= $menu->name ?></h3>
                            <div class="list">
                                <ul>
                                    <?php foreach ($menu->menu as $item) { ?>
                                        <li><a href="<?= $item->link ?>"><?= $item->name ?></a></li>
                                    <?php } ?>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <?php if ($index == 2 || ($index > 2 && ($index + 1) % 4 == 0)) { ?>
                        <div class="clear-fix"></div>
                    <?php } ?>
                <?php } ?>
            </div>
        </div>
    </section>
    <section class="section subfooter">
        <div class="container">
            <div class="row element-top-10 element-bottom-10 footer-columns-2">
                <div class="col-sm-6">
                    <div class="sidebar-widget widget_text">
                        <div class="textwidget"> Copyright � 2018 - <a href="bizsale.vn">Bizsale.vn</a></div>
                    </div>
                </div>
                <div class="col-sm-6">
                    <div class="sidebar-widget widget_text">
                        <div class="textwidget">
                            <?php $menu_bottom_footer = $uihelper->getMenu($websiteConfig->menu_bottom_footer->menu_id, 1); ?>
                            <?php $count = $this->length($menu_bottom_footer->menu->data); ?>
                            <?php foreach ($menu_bottom_footer->menu->data as $index => $item) { ?>
                                <a href="<?= $item->link ?>"><?= $item->name ?> </a>
                                <?php if (($index < $count - 1)) { ?>|<?php } ?>
                            <?php } ?>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</footer>
