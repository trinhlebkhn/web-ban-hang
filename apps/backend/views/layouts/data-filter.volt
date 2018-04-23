<div id="data_filter" class="data_filter">
    <form id="filter_form" method="get">
        <!-- Date and time range -->
        <div class="form-group">
            <label>Lọc theo ngày: </label>

            <div class="input-group">
                <button type="button" class="btn btn-default pull-right" id="daterange-btn">
                    <span><i class="fa fa-calendar"></i> Lọc theo ngày</span>
                    <i class="fa fa-caret-down"></i>
                </button>
            </div>
        </div>
        <!-- /.form group -->
        <input type="hidden" name="time_start" id="time_start" value="{{ QueryArr['time_start'] }}">
        <input type="hidden" name="time_end" id="time_end" value="{{ QueryArr['time_end'] }}">
    </form>
</div>