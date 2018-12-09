<form method="post">
    <div class="row filter">
        <div class="pull-left col-md-4 col-sm-6 col-xs-12 item">
            <div class="form-group search ">
                <select class="form-control" name="stt" id="stt" onchange="this.form.submit()">
                    <option value="">Chọn trạng thái</option>
                    <option value="1" {{ SttSearch == 1 ? 'selected' : '' }} >Hoạt động</option>
                    <option value="2" {{ SttSearch == 2 ? 'selected'  : '' }}>Không hoạt động</option>
                </select>
            </div>
        </div>
        <div class="pull-right col-md-8 col-sm-6 col-xs-12 item" style="padding-right: 0px">
            <div class="form-group search">
                <input type="text" class="form-control" name="q" id="strSearch" placeholder="Nhập vào email khách hàng" value="{{ StrSearch | length > 0 ? StrSearch : '' }}">
                <button style="border-radius: 0px; font-size: 15px;"
                        type="submit" class="btn btn-primary btn-sm pointer" title="Tìm kiếm..."><i class="fa fa-search" aria-hidden="true"></i></button>
            </div>
        </div>
    </div>
</form>