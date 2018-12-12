<div class="sidebar-profile">
    <div class="profiles">
        <div class="avatar" id="avatar_customer">
           <img src="{{ userInfo.avatar|length > 0?userInfo.avatar: '/assets_frontend/vendor/images/no-image.png' }}" alt="userInfo.fullname">
            <input id="auth_token" value="{{ auth_token }}" class="hidden" type="text">
        </div>
        <div class="headline">Tài khoản của</div>
        <div class="username">{{ auth['email'] }}</div>
    </div>
    <div class="user-profile__menu">
        <ul class="user-profile__menu__wrap">
            <li class="user-profile__item {{ router.getActionName() == 'index' ? 'active' : '' }}">
                <a href="/thong-tin-khach-hang.html" class="user-profile__link"><span class="-ap icon-user6 icon"></span> <span class="txt">Thông tin tài khoản</span></a>
            </li>
            <li class="user-profile__item {{ router.getControllerName() == 'customer' and (router.getActionName() == 'order' or router.getActionName() == 'order_detail')  ? 'active' : '' }}">
                <a href="/don-hang.html" class="user-profile__link"><span class="-ap icon-file-text icon"></span> <span class="txt">Quản lý đơn hàng</span></a>
            </li>
            <li class="user-profile__item {{ router.getControllerName() == 'customer' and router.getActionName() == 'update_password'  ? 'active' : '' }}">
                <a href="/thay-doi-mat-khau.html" class="user-profile__link"><span class="fa fa-exchange icon"></span> <span class="txt">Thay đổi mật khẩu</span></a>
            </li>
        </ul>
    </div>
</div>