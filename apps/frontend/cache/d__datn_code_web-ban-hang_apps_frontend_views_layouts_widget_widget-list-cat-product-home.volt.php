<?php foreach ($cat_home_data as $item) { ?>
    <section class="section">
        <div class="container container-vertical-middle">
            <div class="row vertical-middle">
                <div class="col-md-3">
                    <h2 class="text-left element-top-20 element-bottom-20 text-normal os-animation normal default" data-os-animation="fadeIn" data-os-animation-delay="0s">
                        <a class="category_home" href="<?= $this->uiHelper->makeLinkCategory($item) ?>"><?= $item->name ?></a>
                    </h2>
                </div>
                <div class="col-md-9">
                    <hr class="element-top-0 element-bottom-0 os-animation" data-os-animation="fadeIn" data-os-animation-delay="0s">
                </div>
            </div>
        </div>
    </section>
    <section class="section">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="divider-wrapper">
                        <div class="visible-xs element-height-30"></div>
                        <div class="visible-sm element-height-30"></div>
                        <div class="visible-md element-height-30"></div>
                        <div class="visible-lg element-height-30"></div>
                    </div>
                    <div class="woocommerce columns-4">
                        <div class="row">
                            <ul class="products">
                                <?php $arrayListProduct = array_chunk($item->product, 4); ?>
                                <?php foreach ($arrayListProduct[0] as $product) { ?>
                                    <?= $this->partial('layouts/template-part/product-item', ['product' => $product]) ?>
                                <?php } ?>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <?php if ($index == 0) { ?>
        <section class="section">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="figure element-top-30 element-bottom-30 os-animation" data-os-animation="fadeIn" data-os-animation-delay="0s">
                            <a class="figure-image" href="shop-mens-category.html" target="_self"> <img alt="box_feature_1" src="<?= $websiteConfig->box_feature->images[0]->image ?>"> </a>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    <?php } elseif ($index == 1) { ?>
        <section class="section">
            <div class="container">
                <div class="row">
                    <?php foreach ($websiteConfig->box_feature->images as $i => $v) { ?>
                        <?php if ($i > 0) { ?>
                            <div class="col-md-4 text-center">
                                <div class="figure element-top-20 element-bottom-20 image-effect-zoom-in os-animation" data-os-animation="fadeIn" data-os-animation-delay="0s">
                                    <a class="figure-image" href="shop-mens-category.html" target="_self"> <img alt="" src="<?= $v->image ?>"> </a>
                                </div>
                            </div>
                        <?php } ?>
                    <?php } ?>
                </div>
            </div>
        </section>
    <?php } ?>
<?php } ?>
