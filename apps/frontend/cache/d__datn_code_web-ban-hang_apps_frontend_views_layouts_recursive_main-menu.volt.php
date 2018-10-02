<?php foreach ($data as $item) { ?>
    
    <li class="menu-item <?= (!empty($item['child']) ? 'dropdown' : '') ?> "><a href="<?= $item['link'] ?>"><?= $item['name'] ?></a>
        <?php if (!empty($item['child'])) { ?>
            <ul class="dropdown-menu dropdown-menu-left ">
                <?= $this->uiHelper->drawRecursiveMenu('layouts/recursive/main-menu', $item['child']) ?>
            </ul>
        <?php } ?>
    </li>
<?php } ?>