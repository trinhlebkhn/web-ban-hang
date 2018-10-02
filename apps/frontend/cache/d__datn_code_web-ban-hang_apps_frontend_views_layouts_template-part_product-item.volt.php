<?php $link = $this->uiHelper->makeLinkProduct($product); ?>
<?php $images = json_decode($product['image']); ?>
<li class="product col-md-3 product__price__view productJson" data-product="<?= $this->escaper->escapeHtmlAttr(json_encode($product)) ?>">
    <div class="w">
        <a href="<?= $link ?>">
            <?php if (($product['price'] > $product['price_sel'])) { ?>
                <span class="onsale">Sale!</span>
            <?php } ?>
            <div class="product-image">
                <div class="product-image-front">
                    <img alt="<?= $product['name'] ?>" height="893" src="<?= $product['avatar'] ?>" width="700">
                </div>
                <?php if (!empty($images[0])) { ?>
                    <div class="product-image-back"><img alt="<?= $product['name'] ?>" src="<?= $images[0] ?>"></div>
                <?php } ?>
                <div class="product-image-overlay">
                    <a href="<?= $link ?>"><h4>Xem chi tiết</h4></a>
                </div>
            </div>
        </a>
        <div class="product-info">
            <h3 class="product-title"><a href="<?= $link ?>"><?= $product['name'] ?></a></h3> <span class="product-categories"></span>
            <h3 class="price">
                <?php $price_sell = $product['price_sell']; ?>
                <?php $price = $product['price']; ?>
                <del class="<?= ($price == 0 || $price <= $price_sell ? 'hidden' : '') ?>">
                    <span class="amount">&#36;<?= number_format($price) ?></span>
                </del>
                &nbsp;&nbsp;<ins><span class="amount">&#36;<?= number_format($price_sell) ?></span></ins>
            </h3>
            <input type="text" class="input-number" style="display: none" value="1">
            <a class="add-to-cart-button product__view__button__cart" href="#" rel="nofollow" title="Thêm vào giỏ hàng"> <i class="icon-bag"></i> </a>
        </div>
    </div>
</li>