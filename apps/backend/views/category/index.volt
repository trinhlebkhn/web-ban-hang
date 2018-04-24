{% include "layouts/header.volt" %}
<!-- Left side column. contains the logo and sidebar -->
{% include "layouts/sidebar.volt" %}
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
    {% include "layouts/widget/category/widget-add-category.volt" %}
    {% include "layouts/widget/category/widget-list-category.volt" %}
</div>
<!-- /.content-wrapper -->
{% include "layouts/footer.volt" %}
<!-- ./wrapper -->
