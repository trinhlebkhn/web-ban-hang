<div class="sidebar-profile">
    <div class="profiles">
        <div class="avatar" id="avatar_customer">
            <a href="#image_cus"><img src="{{ userInfo.avatar|length > 0?userInfo.avatar: resourcePath~'vendor/images/no-image.png' }}" alt="userInfo.fullname" onclick="image_cus.click()"></a>
            <input id="image_cus" #image_cus class="hidden" type="file" onchange="upload_customer_image.upload_img(image_cus.files[0])">
            <input id="auth_token" value="{{ auth_token }}" class="hidden" type="text">
        </div>
        <div class="headline">Tài khoản của</div>
        <div class="username">{{ userInfo.email }}</div>
    </div>
    <div class="user-profile__menu">
        <ul class="user-profile__menu__wrap">
            <li class="user-profile__item {{ router.getActionName() == null ? 'active' : '' }}">
                <a href="/customer" class="user-profile__link"><span class="-ap icon-user6 icon"></span> <span class="txt">Thông tin tài khoản</span></a>
            </li>
            <li class="user-profile__item {{ router.getControllerName() == 'customer' and (router.getActionName() == 'order' or router.getActionName() == 'order_detail')  ? 'active' : '' }}">
                <a href="/customer/order" class="user-profile__link"><span class="-ap icon-file-text icon"></span> <span class="txt">Quản lý đơn hàng</span></a>
            </li>
            <li class="user-profile__item {{ router.getControllerName() == 'customer' and router.getActionName() == 'update_password'  ? 'active' : '' }}">
                <a href="/customer/update_password" class="user-profile__link"><span class="fa fa-exchange icon"></span> <span class="txt">Thay đổi mật khẩu</span></a>
            </li>
        </ul>
    </div>
</div>