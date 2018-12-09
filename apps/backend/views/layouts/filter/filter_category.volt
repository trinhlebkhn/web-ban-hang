<form method="post">
    <div class="row filter">
        <div class="col-md-4 item">
            <div class="form-group search ">
                <select class="form-control" name="type" id="type" onchange="this.form.submit()">
                    <option value="">Chọn danh mục</option>
                    <option value="1" {{ TypeSearch == 1 ? 'selected' : '' }}>Sản phẩm</option>
                    <option value="2" {{ TypeSearch == 2 ? 'selected' : '' }}>Bài vết</option>
                </select>
            </div>
        </div>
        <div class="col-md-4 item">
            <div class="form-group search ">
                <select class="form-control" name="stt" id="stt" onchange="this.form.submit()">
                    <option value="">Chọn trạng thái</option>
                    <option value="1" {{ SttSearch == 1 ? 'selected' : '' }} >Hoạt động</option>
                    <option value="2" {{ SttSearch == 2 ? 'selected'  : '' }}>Không hoạt động</option>
                </select>
            </div>
        </div>
        <div class="col-md-4 item">
            <div class="form-group search">
                <input type="text" class="form-control" name="q" id="strSearch" placeholder="Nhập vào tên danh mục" value="{{ StrSearch | length > 0 ? StrSearch : '' }}">
                <button style="border-radius: 0px; font-size: 15px;"
                        type="submit" class="btn btn-primary btn-sm pointer" title="Tìm kiếm..."><i class="fa fa-search" aria-hidden="true"></i></button>
            </div>
        </div>
    </div>
</form>