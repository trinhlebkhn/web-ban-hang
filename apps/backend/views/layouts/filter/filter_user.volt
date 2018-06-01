<form method="post">
        <div class="col-md-4 pull-right" style="padding-right: 0px">
            <div class="form-group search">
                <input type="text" class="form-control" name="q" id="strSearch" placeholder="Nhập vào tên hoặc email thành viên" value="{{ StrSearch | length > 0 ? StrSearch : '' }}">
                <button style="border-radius: 0px; font-size: 15px;" type="submit" class="btn btn-primary btn-sm pointer" title="Tìm kiếm..."><i class="fa fa-search" aria-hidden="true"></i></button>
            </div>
        </div>
</form>