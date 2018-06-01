{% include "/layouts/header.volt" %}
<div class="login-page">
    <div class="container">
        <div class="card card-container">
            {{ flash.output() }}
            <div class="image-user">
                <img id="profile-img" class="profile-img-card" src="//ssl.gstatic.com/accounts/ui/avatar_2x.png" />
            </div>
            <form class="form-login" method="post">
                <span id="reauth-email" class="reauth-email"></span>
                <div class="form-group">
                    <input type="text" name="dataLogin[email]" id="inputEmail" class="form-control" placeholder="Email quản trị" required autofocus>
                </div>
                <div class="form-group">
                    <input type="password" name="dataLogin[password]" id="inputPassword" class="form-control" placeholder="Mật khẩu" required>
                </div>
                <div id="remember" class="checkbox">
                    <label>
                        <input type="checkbox" value="remember-me"> Ghi nhớ tài khoản
                    </label>
                </div>
                <button class="btn btn-lg btn-primary btn-block btn-signin" type="submit" style="margin-bottom: 10px">Đăng nhập</button>
            </form>
            {#<a href="#" class="forgot-password">#}
            {#Quên mật khẩu?#}
            {#</a>#}
        </div>
    </div>
</div>
