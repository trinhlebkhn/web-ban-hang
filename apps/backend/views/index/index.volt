{% include "/layouts/header.volt" %}
<div class="login-page">
    <div class="container">
        <div class="card card-container">
            {{ flash.output() }}
            <div class="image-user">
                <img id="profile-img" class="profile-img-card" src="//ssl.gstatic.com/accounts/ui/avatar_2x.png" />
            </div>
            {% if isnt_active is empty %}
                <form class="form-login" method="post">
                    <span id="reauth-email" class="reauth-email"></span>
                    <div class="form-group">
                        <input type="text" name="dataLogin[username]" id="inputEmail" class="form-control" placeholder="Tên tài khoản" required autofocus>
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
                <div class="account_login__social ">
                    <div class="title text-center"><span>Đăng nhập với</span></div>
                    <div class="list__buttons">
                        <div class="row">
                            <div class="col-sm-6 col-xs-12">
                                <a href="/auth/facebook" class="btn btn-facebook" style="font-size: 13px; line-height: 2.4rem; width: 100%; margin-bottom: 10px">
                                    Đăng nhập với Facebook
                                </a>
                            </div>
                            <div class="col-sm-6 col-xs-12">
                                <a href="/auth/google" class="btn btn-google" style="font-size: 13px; line-height: 2.4rem; width: 100%">
                                    Đăng nhập với Google
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
                {#<a href="#" class="forgot-password">#}
                {#Quên mật khẩu?#}
                {#</a>#}
            {% endif %}
        </div>
    </div>
</div>
