<form method="post">
    <div class="row">
        {#<div class="col-md-4" style="padding-left: 0px">#}
            {#<div class="form-group">#}
                {#<div class="input-group">#}
                    {#<button type="button" class="btn btn-default pull-right" id="daterange-btn">#}
                        {#<span>#}
                            {#<i class="fa fa-calendar"></i> Chọn thời gian#}
                        {#</span>#}
                        {#<i class="fa fa-caret-down"></i>#}
                    {#</button>#}
                {#</div>#}
            {#</div>#}
        {#</div>#}
        <div class="col-md-4" style="padding-left: 0px">
            <div class="form-group search ">
                <select class="form-control" name="stt" id="stt" onchange="this.form.submit()">
                    <option value="">Chọn trạng thái</option>
                    <option value="1" {{ SttSearch == 1 ? 'selected' : '' }} >Hoạt động</option>
                    <option value="2" {{ SttSearch == 2 ? 'selected'  : '' }}>Không hoạt động</option>
                </select>
            </div>
        </div>
        <div class="col-md-8" style="padding-right: 0px">
            <div class="form-group search">
                <input type="text" class="form-control" name="q" id="strSearch" placeholder="Nhập vào email khách hàng" value="{{ StrSearch | length > 0 ? StrSearch : '' }}">
                <button style="border-radius: 0px; font-size: 15px;"
                        type="submit" class="btn btn-primary btn-sm pointer" title="Tìm kiếm..."><i class="fa fa-search" aria-hidden="true"></i></button>
            </div>
        </div>
    </div>
</form>