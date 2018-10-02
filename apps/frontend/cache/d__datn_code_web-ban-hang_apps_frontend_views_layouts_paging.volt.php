<?php if ($Pagination['total'] > 0 && $Pagination['total_pages'] > 1 && $Pagination['current'] >= 1 && $Pagination['current'] <= $Pagination['total_pages']) { ?>
    <nav aria-label="Page navigation" class="navigation">
        <ul class="pagination">
            <?php if ($Pagination['current'] > 1) { ?>
                <li>
                    <a href="<?= $Pagination['current_link'] ?>p=<?= ($Pagination['current'] - 1) ?>" aria-label="Previous">
                        <span aria-hidden="true">&laquo;</span>
                    </a>
                </li>
            <?php } ?>
            <?php foreach (range(1, $Pagination['total_pages']) as $i) { ?>
                <li class="<?= ($i == $Pagination['current'] ? 'active' : '') ?>"><a href="<?= $Pagination['current_link'] ?>p=<?= $i ?>"><?= $i ?></a></li>
            <?php } ?>
            <?php if ($Pagination['current'] < $Pagination['total_pages']) { ?>
                <li>
                    <a href="<?= $Pagination['current_link'] ?>p=<?= ($Pagination['current'] + 1) ?>" aria-label="Next">
                        <span aria-hidden="true">&raquo;</span>
                    </a>
                </li>
            <?php } ?>
        </ul>
    </nav>
<?php } ?>
<?php if ($Pagination['total'] == 0) { ?>
    <p class="text-success text-center" style="font-size: 15px;padding-top: 10px">Không tìm thấy kết quả nào ở trang này</p>
<?php } ?>