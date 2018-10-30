{% include "layouts/header.volt" %}
<section class="section">
    <div class="row checkout">
        <div class="col-12 col-md-12 payment-header text-center bg-f0 py-2">
            <h3 style="font-size: 23px">Chọn phương thức thanh toán</h3>
        </div>
        <div class="col-12 col-md-12">
            <div class="FlashAlert">
                {{ flash.output() }}
            </div>
            <div class="payment-form">
                <form name="NLpayBank" action="/service/nlCheckout" method="post">
                    <input type="hidden" name="total_amount" value="{{ package_option['price'] }}">
                    <input type="hidden" name="buyer_fullname" value="{{ user_info['fullname'] }}">
                    <input type="hidden" name="buyer_email" value="{{ user_info['email'] }}">
                    <input type="hidden" name="buyer_mobile" value="{{ user_info['phone'] }}">

                    <input type="hidden" name="package_name"
                           value="{{ package_service['name'] }} - {{ package_option['package_name'] }}">
                    <input type="hidden" name="package_option_price" value="{{ package_option['price'] }}">
                    <input type="hidden" name="order_id" value="{{ order_id }}">

                    <div class="row mg-0">
                        <div class="col-12 text-center" style="display: flex;">
                            <strong class="text-danger" style="font-size: 17px; float: left; line-height: 40px;">
                                THÔNG TIN HÓA ĐƠN
                            </strong>
                        </div>
                        <div class="col-12 table-responsive">
                            <table class="table">
                                <tbody>
                                <tr>
                                    <th scope="row">Số tiền thanh toán:</th>
                                    <td>{{ number_format(money) }} VNĐ</td>
                                </tr>
                                <tr>
                                    <th scope="row">Họ và tên:</th>
                                    <td>{{ user_info['fullname'] }}</td>
                                </tr>
                                <tr>
                                    <th scope="row">Email:</th>
                                    <td>{{ user_info['email'] }}</td>
                                </tr>
                                <tr>
                                    <th scope="row">Số điện thoại:</th>
                                    <td>{{ user_info['phone'] }}</td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div class="flip clearfix active pointer" id="payment_online">
                        <div class="imgFlip">
                            <img alt="" src="/assets_frontend/images/nganluong.jpg">
                        </div>
                        <p>
                            <b>THANH TOÁN QUA CHUYỂN KHOẢN<br>
                            </b><span class="w-100" style="font-size: 12px">Quý khách có thể thanh toán cho chúng tôi bằng cách chuyển khoản trực tiếp tại ngân hàng, chuyển qua thẻ ATM, hoặc qua Internet banking.</span>
                        </p>
                        <span class="arraw">&nbsp;</span>
                        <div class="clr"></div>
                    </div>
                    <div class="choose_payment display-none">
                        <ul class="col-sm-12 list-content">
                            <li class="active">
                                <label><input type="radio" value="NL" name="option_payment" checked>Thanh toán bằng
                                    Ví điện tử NgânLượng</label>
                                <div class="boxContent">
                                    <p>
                                        Thanh toán trực tuyến AN TOÀN và ĐƯỢC BẢO VỆ, sử dụng thẻ ngân hàng trong và
                                        ngoài nước hoặc nhiều hình thức tiện lợi khác.
                                        Được bảo hộ & cấp phép bởi NGÂN HÀNG NHÀ NƯỚC, ví điện tử duy nhất được cộng
                                        đồng ƯA THÍCH NHẤT 2 năm liên tiếp, Bộ Thông tin Truyền thông trao giải
                                        thưởng Sao Khuê
                                        <br/>Giao dịch. Đăng ký ví NgânLượng.vn miễn phí <a
                                                href="https://www.nganluong.vn/?portal=nganluong&amp;page=user_register"
                                                target="_blank">tại đây</a></p>
                                </div>
                            </li>
                            <li>
                                <label><input type="radio" value="ATM_ONLINE" name="option_payment">Thanh toán
                                    online bằng thẻ ngân hàng nội địa</label>
                                <div class="boxContent">
                                    <p><i>
                                            <span style="color:#ff5a00;font-weight:bold;text-decoration:underline;">Lưu ý</span>:
                                            Bạn cần đăng ký Internet-Banking hoặc dịch vụ thanh toán trực tuyến tại
                                            ngân hàng trước khi thực hiện.</i></p>

                                    <ul class="cardList clearfix">
                                        <li class="bank-online-methods ">
                                            <label for="vcb_ck_on">
                                                <i class="BIDV"
                                                   title="Ngân hàng TMCP Đầu tư &amp; Phát triển Việt Nam"></i>
                                                <input type="radio" value="BIDV" name="bankcode">

                                            </label></li>
                                        <li class="bank-online-methods ">
                                            <label for="vcb_ck_on">
                                                <i class="VCB" title="Ngân hàng TMCP Ngoại Thương Việt Nam"></i>
                                                <input type="radio" value="VCB" name="bankcode">

                                            </label></li>

                                        <li class="bank-online-methods ">
                                            <label for="vnbc_ck_on">
                                                <i class="DAB" title="Ngân hàng Đông Á"></i>
                                                <input type="radio" value="DAB" name="bankcode">

                                            </label></li>

                                        <li class="bank-online-methods ">
                                            <label for="tcb_ck_on">
                                                <i class="TCB" title="Ngân hàng Kỹ Thương"></i>
                                                <input type="radio" value="TCB" name="bankcode">

                                            </label></li>

                                        <li class="bank-online-methods ">
                                            <label for="sml_atm_mb_ck_on">
                                                <i class="MB" title="Ngân hàng Quân Đội"></i>
                                                <input type="radio" value="MB" name="bankcode">

                                            </label></li>

                                        <li class="bank-online-methods ">
                                            <label for="sml_atm_vib_ck_on">
                                                <i class="VIB" title="Ngân hàng Quốc tế"></i>
                                                <input type="radio" value="VIB" name="bankcode">

                                            </label></li>

                                        <li class="bank-online-methods ">
                                            <label for="sml_atm_vtb_ck_on">
                                                <i class="ICB" title="Ngân hàng Công Thương Việt Nam"></i>
                                                <input type="radio" value="ICB" name="bankcode">

                                            </label></li>

                                        <li class="bank-online-methods ">
                                            <label for="sml_atm_exb_ck_on">
                                                <i class="EXB" title="Ngân hàng Xuất Nhập Khẩu"></i>
                                                <input type="radio" value="EXB" name="bankcode">

                                            </label></li>

                                        <li class="bank-online-methods ">
                                            <label for="sml_atm_acb_ck_on">
                                                <i class="ACB" title="Ngân hàng Á Châu"></i>
                                                <input type="radio" value="ACB" name="bankcode">

                                            </label></li>

                                        <li class="bank-online-methods ">
                                            <label for="sml_atm_hdb_ck_on">
                                                <i class="HDB" title="Ngân hàng Phát triển Nhà TPHCM"></i>
                                                <input type="radio" value="HDB" name="bankcode">

                                            </label></li>

                                        <li class="bank-online-methods ">
                                            <label for="sml_atm_msb_ck_on">
                                                <i class="MSB" title="Ngân hàng Hàng Hải"></i>
                                                <input type="radio" value="MSB" name="bankcode">

                                            </label></li>

                                        <li class="bank-online-methods ">
                                            <label for="sml_atm_nvb_ck_on">
                                                <i class="NVB" title="Ngân hàng Nam Việt"></i>
                                                <input type="radio" value="NVB" name="bankcode">

                                            </label></li>

                                        <li class="bank-online-methods ">
                                            <label for="sml_atm_vab_ck_on">
                                                <i class="VAB" title="Ngân hàng Việt Á"></i>
                                                <input type="radio" value="VAB" name="bankcode">

                                            </label></li>

                                        <li class="bank-online-methods ">
                                            <label for="sml_atm_vpb_ck_on">
                                                <i class="VPB" title="Ngân Hàng Việt Nam Thịnh Vượng"></i>
                                                <input type="radio" value="VPB" name="bankcode">

                                            </label></li>

                                        <li class="bank-online-methods ">
                                            <label for="sml_atm_scb_ck_on">
                                                <i class="SCB" title="Ngân hàng Sài Gòn Thương tín"></i>
                                                <input type="radio" value="SCB" name="bankcode">

                                            </label></li>


                                        <li class="bank-online-methods ">
                                            <label for="bnt_atm_pgb_ck_on">
                                                <i class="PGB" title="Ngân hàng Xăng dầu Petrolimex"></i>
                                                <input type="radio" value="PGB" name="bankcode">

                                            </label></li>

                                        <li class="bank-online-methods ">
                                            <label for="bnt_atm_gpb_ck_on">
                                                <i class="GPB" title="Ngân hàng TMCP Dầu khí Toàn Cầu"></i>
                                                <input type="radio" value="GPB" name="bankcode">

                                            </label></li>

                                        <li class="bank-online-methods ">
                                            <label for="bnt_atm_agb_ck_on">
                                                <i class="AGB"
                                                   title="Ngân hàng Nông nghiệp &amp; Phát triển nông thôn"></i>
                                                <input type="radio" value="AGB" name="bankcode">

                                            </label></li>

                                        <li class="bank-online-methods ">
                                            <label for="bnt_atm_sgb_ck_on">
                                                <i class="SGB" title="Ngân hàng Sài Gòn Công Thương"></i>
                                                <input type="radio" value="SGB" name="bankcode">

                                            </label></li>
                                        <li class="bank-online-methods ">
                                            <label for="sml_atm_bab_ck_on">
                                                <i class="BAB" title="Ngân hàng Bắc Á"></i>
                                                <input type="radio" value="BAB" name="bankcode">

                                            </label></li>
                                        <li class="bank-online-methods ">
                                            <label for="sml_atm_bab_ck_on">
                                                <i class="TPB" title="Tền phong bank"></i>
                                                <input type="radio" value="TPB" name="bankcode">

                                            </label></li>
                                        <li class="bank-online-methods ">
                                            <label for="sml_atm_bab_ck_on">
                                                <i class="NAB" title="Ngân hàng Nam Á"></i>
                                                <input type="radio" value="NAB" name="bankcode">

                                            </label></li>
                                        <li class="bank-online-methods ">
                                            <label for="sml_atm_bab_ck_on">
                                                <i class="SHB" title="Ngân hàng TMCP Sài Gòn - Hà Nội (SHB)"></i>
                                                <input type="radio" value="SHB" name="bankcode">

                                            </label></li>
                                        <li class="bank-online-methods ">
                                            <label for="sml_atm_bab_ck_on">
                                                <i class="OJB" title="Ngân hàng TMCP Đại Dương (OceanBank)"></i>
                                                <input type="radio" value="OJB" name="bankcode">

                                            </label></li>


                                    </ul>

                                </div>
                            </li>
                            <li>
                                <label><input type="radio" value="IB_ONLINE" name="option_payment">Thanh toán bằng
                                    IB</label>
                                <div class="boxContent">
                                    <p><i>
                                            <span style="color:#ff5a00;font-weight:bold;text-decoration:underline;">Lưu ý</span>:
                                            Bạn cần đăng ký Internet-Banking hoặc dịch vụ thanh toán trực tuyến tại
                                            ngân hàng trước khi thực hiện.</i></p>

                                    <ul class="cardList clearfix">
                                        <li class="bank-online-methods ">
                                            <label for="vcb_ck_on">
                                                <i class="BIDV"
                                                   title="Ngân hàng TMCP Đầu tư &amp; Phát triển Việt Nam"></i>
                                                <input type="radio" value="BIDV" name="bankcode">

                                            </label></li>
                                        <li class="bank-online-methods ">
                                            <label for="vcb_ck_on">
                                                <i class="VCB" title="Ngân hàng TMCP Ngoại Thương Việt Nam"></i>
                                                <input type="radio" value="VCB" name="bankcode">

                                            </label></li>

                                        <li class="bank-online-methods ">
                                            <label for="vnbc_ck_on">
                                                <i class="DAB" title="Ngân hàng Đông Á"></i>
                                                <input type="radio" value="DAB" name="bankcode">

                                            </label></li>

                                        <li class="bank-online-methods ">
                                            <label for="tcb_ck_on">
                                                <i class="TCB" title="Ngân hàng Kỹ Thương"></i>
                                                <input type="radio" value="TCB" name="bankcode">

                                            </label></li>


                                    </ul>

                                </div>
                            </li>
                            <li>
                                <label><input type="radio" value="ATM_OFFLINE" name="option_payment">Thanh toán atm
                                    offline</label>
                                <div class="boxContent">

                                    <ul class="cardList clearfix">
                                        <li class="bank-online-methods ">
                                            <label for="vcb_ck_on">
                                                <i class="BIDV"
                                                   title="Ngân hàng TMCP Đầu tư &amp; Phát triển Việt Nam"></i>
                                                <input type="radio" value="BIDV" name="bankcode">

                                            </label></li>

                                        <li class="bank-online-methods ">
                                            <label for="vcb_ck_on">
                                                <i class="VCB" title="Ngân hàng TMCP Ngoại Thương Việt Nam"></i>
                                                <input type="radio" value="VCB" name="bankcode">

                                            </label></li>

                                        <li class="bank-online-methods ">
                                            <label for="vnbc_ck_on">
                                                <i class="DAB" title="Ngân hàng Đông Á"></i>
                                                <input type="radio" value="DAB" name="bankcode">

                                            </label></li>

                                        <li class="bank-online-methods ">
                                            <label for="tcb_ck_on">
                                                <i class="TCB" title="Ngân hàng Kỹ Thương"></i>
                                                <input type="radio" value="TCB" name="bankcode">

                                            </label></li>

                                        <li class="bank-online-methods ">
                                            <label for="sml_atm_mb_ck_on">
                                                <i class="MB" title="Ngân hàng Quân Đội"></i>
                                                <input type="radio" value="MB" name="bankcode">

                                            </label></li>

                                        <li class="bank-online-methods ">
                                            <label for="sml_atm_vtb_ck_on">
                                                <i class="ICB" title="Ngân hàng Công Thương Việt Nam"></i>
                                                <input type="radio" value="ICB" name="bankcode">

                                            </label></li>

                                        <li class="bank-online-methods ">
                                            <label for="sml_atm_acb_ck_on">
                                                <i class="ACB" title="Ngân hàng Á Châu"></i>
                                                <input type="radio" value="ACB" name="bankcode">

                                            </label></li>

                                        <li class="bank-online-methods ">
                                            <label for="sml_atm_msb_ck_on">
                                                <i class="MSB" title="Ngân hàng Hàng Hải"></i>
                                                <input type="radio" value="MSB" name="bankcode">

                                            </label></li>

                                        <li class="bank-online-methods ">
                                            <label for="sml_atm_scb_ck_on">
                                                <i class="SCB" title="Ngân hàng Sài Gòn Thương tín"></i>
                                                <input type="radio" value="SCB" name="bankcode">

                                            </label></li>
                                        <li class="bank-online-methods ">
                                            <label for="bnt_atm_pgb_ck_on">
                                                <i class="PGB" title="Ngân hàng Xăng dầu Petrolimex"></i>
                                                <input type="radio" value="PGB" name="bankcode">

                                            </label></li>

                                        <li class="bank-online-methods ">
                                            <label for="bnt_atm_agb_ck_on">
                                                <i class="AGB"
                                                   title="Ngân hàng Nông nghiệp &amp; Phát triển nông thôn"></i>
                                                <input type="radio" value="AGB" name="bankcode">

                                            </label></li>
                                        <li class="bank-online-methods ">
                                            <label for="sml_atm_bab_ck_on">
                                                <i class="SHB" title="Ngân hàng TMCP Sài Gòn - Hà Nội (SHB)"></i>
                                                <input type="radio" value="SHB" name="bankcode">

                                            </label></li>


                                    </ul>

                                </div>
                            </li>
                            <li>
                                <label><input type="radio" value="NH_OFFLINE" name="option_payment">Thanh toán tại
                                    văn phòng ngân hàng</label>
                                <div class="boxContent">

                                    <ul class="cardList clearfix">
                                        <li class="bank-online-methods ">
                                            <label for="vcb_ck_on">
                                                <i class="BIDV"
                                                   title="Ngân hàng TMCP Đầu tư &amp; Phát triển Việt Nam"></i>
                                                <input type="radio" value="BIDV" name="bankcode">

                                            </label></li>
                                        <li class="bank-online-methods ">
                                            <label for="vcb_ck_on">
                                                <i class="VCB" title="Ngân hàng TMCP Ngoại Thương Việt Nam"></i>
                                                <input type="radio" value="VCB" name="bankcode">

                                            </label></li>

                                        <li class="bank-online-methods ">
                                            <label for="vnbc_ck_on">
                                                <i class="DAB" title="Ngân hàng Đông Á"></i>
                                                <input type="radio" value="DAB" name="bankcode">

                                            </label></li>

                                        <li class="bank-online-methods ">
                                            <label for="tcb_ck_on">
                                                <i class="TCB" title="Ngân hàng Kỹ Thương"></i>
                                                <input type="radio" value="TCB" name="bankcode">

                                            </label></li>

                                        <li class="bank-online-methods ">
                                            <label for="sml_atm_mb_ck_on">
                                                <i class="MB" title="Ngân hàng Quân Đội"></i>
                                                <input type="radio" value="MB" name="bankcode">

                                            </label></li>

                                        <li class="bank-online-methods ">
                                            <label for="sml_atm_vib_ck_on">
                                                <i class="VIB" title="Ngân hàng Quốc tế"></i>
                                                <input type="radio" value="VIB" name="bankcode">

                                            </label></li>

                                        <li class="bank-online-methods ">
                                            <label for="sml_atm_vtb_ck_on">
                                                <i class="ICB" title="Ngân hàng Công Thương Việt Nam"></i>
                                                <input type="radio" value="ICB" name="bankcode">

                                            </label></li>

                                        <li class="bank-online-methods ">
                                            <label for="sml_atm_acb_ck_on">
                                                <i class="ACB" title="Ngân hàng Á Châu"></i>
                                                <input type="radio" value="ACB" name="bankcode">

                                            </label></li>

                                        <li class="bank-online-methods ">
                                            <label for="sml_atm_msb_ck_on">
                                                <i class="MSB" title="Ngân hàng Hàng Hải"></i>
                                                <input type="radio" value="MSB" name="bankcode">

                                            </label></li>

                                        <li class="bank-online-methods ">
                                            <label for="sml_atm_scb_ck_on">
                                                <i class="SCB" title="Ngân hàng Sài Gòn Thương tín"></i>
                                                <input type="radio" value="SCB" name="bankcode">

                                            </label></li>


                                        <li class="bank-online-methods ">
                                            <label for="bnt_atm_pgb_ck_on">
                                                <i class="PGB" title="Ngân hàng Xăng dầu Petrolimex"></i>
                                                <input type="radio" value="PGB" name="bankcode">

                                            </label></li>

                                        <li class="bank-online-methods ">
                                            <label for="bnt_atm_agb_ck_on">
                                                <i class="AGB"
                                                   title="Ngân hàng Nông nghiệp &amp; Phát triển nông thôn"></i>
                                                <input type="radio" value="AGB" name="bankcode">

                                            </label></li>
                                        <li class="bank-online-methods ">
                                            <label for="sml_atm_bab_ck_on">
                                                <i class="TPB" title="Tền phong bank"></i>
                                                <input type="radio" value="TPB" name="bankcode">

                                            </label></li>


                                    </ul>

                                </div>
                            </li>
                            <li>
                                <label><input type="radio" value="VISA" name="option_payment" selected="true">Thanh
                                    toán bằng thẻ Visa hoặc MasterCard</label>
                                <div class="boxContent">
                                    <p>
                                        <span style="color:#ff5a00;font-weight:bold;text-decoration:underline;">Lưu ý</span>:Visa
                                        hoặc MasterCard.</p>
                                    <ul class="cardList clearfix">
                                        <li class="bank-online-methods ">
                                            <label for="vcb_ck_on">
                                                Visa:
                                                <input type="radio" value="VISA" name="bankcode">

                                            </label></li>

                                        <li class="bank-online-methods ">
                                            <label for="vnbc_ck_on">
                                                Master:<input type="radio" value="MASTER" name="bankcode">
                                            </label></li>
                                    </ul>
                                </div>
                            </li>
                            <li>
                                <label><input type="radio" value="CREDIT_CARD_PREPAID" name="option_payment"
                                              selected="true">Thanh toán bằng thẻ Visa hoặc MasterCard trả
                                    trước</label>

                            </li>
                        </ul>
                        <div class="pay">
                            <input type="submit" class="btn btn-success" name="nlpayment" value="Thanh toán"/>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</section>
<script language="javascript">
    $('input[name="option_payment"]').bind('click', function () {
        $('.list-content li').removeClass('active');
        $(this).parent().parent('li').addClass('active');
    });
</script>
{% include "layouts/footer.volt" %}