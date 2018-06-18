{% include "layouts/header.volt" %}
<div class="common-overlay"></div>
<div class="page-err">
    <div class="error-content">
        <img src="{{ resourcePath }}img/img-error.jpg" alt="">
        <h1 class="text">
            404
        </h1>
        <p class="content">
            Trang bạn yêu cầu không tìm thấy!
        </p>
        <p>&nbsp;</p>
        <p><a href="/" class="text-danger"><small>Bấm vào đây để quay về trang chủ</small></a></p>
    </div>
</div>

{% include "layouts/footer.volt" %}