<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Đại lý Bizsale - Dashboard</title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <!-- Bootstrap 3.3.7 -->
    <link rel="stylesheet" href="/assets_backend/source/bower_components/bootstrap/dist/css/bootstrap.min.css">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="/assets_backend/source/bower_components/font-awesome/css/font-awesome.min.css">
    <!-- DataTables -->
    <link rel="stylesheet" href="/assets_backend/source/bower_components/datatables.net-bs/css/dataTables.bootstrap.min.css">
    <!-- Ionicons -->
    <link rel="stylesheet" href="/assets_backend/source/bower_components/Ionicons/css/ionicons.min.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="/assets_backend/source/dist/css/AdminLTE.min.css">
    <!-- Custom CSS of Daily-Bizsale -->
    {#<link rel="stylesheet" href="/assets_backend/source/dist/css/custom.css">#}
    <link rel="stylesheet" href="/assets_backend/assets/css/custom.css">
    <!-- AdminLTE Skins. Choose a skin from the css/skins
         folder instead of downloading all of them to reduce the load. -->
    <link rel="stylesheet" href="/assets_backend/source/dist/css/skins/_all-skins.min.css">
    <link rel="stylesheet" href="/assets_backend/source/plugins/iCheck/all.css">

    <link rel="stylesheet" href="/assets_backend/assets/css/skin-bizsale.css">
    <!-- Morris chart -->
    <link rel="stylesheet" href="/assets_backend/source/bower_components/morris.js/morris.css">
    <!-- jvectormap -->
    <link rel="stylesheet" href="/assets_backend/source/bower_components/jvectormap/jquery-jvectormap.css">
    <!-- Date Picker -->
    <link rel="stylesheet" href="/assets_backend/source/bower_components/bootstrap-datepicker/dist/css/bootstrap-datepicker.min.css">
    <!-- Daterange picker -->
    <link rel="stylesheet" href="/assets_backend/source/bower_components/bootstrap-daterangepicker/daterangepicker.css">
    <!-- bootstrap wysihtml5 - text editor -->
    <link rel="stylesheet" href="/assets_backend/source/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css">
    <link rel="stylesheet" href="/selectpicker/bootstrap-select.css">

    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>

    <![endif]-->

    <!-- Google Font -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
</head>
<body class="hold-transition skin-bizsale sidebar-mini">
<div class="wrapper">
    {{ content() }}
    {% include "layouts/control-sidebar.volt" %}
    <div class="control-sidebar-bg"></div>
</div>

<!-- jQuery 3 -->
<script src="/assets_backend/source/bower_components/jquery/dist/jquery.min.js"></script>
<!-- jQuery UI 1.11.4 -->
<script src="/assets_backend/source/bower_components/jquery-ui/jquery-ui.min.js"></script>
<!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
<script>
    $.widget.bridge('uibutton', $.ui.button);
</script>
<!-- Bootstrap 3.3.7 -->
<script src="/assets_backend/source/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
<!-- DataTables -->
<script src="/assets_backend/source/bower_components/datatables.net/js/jquery.dataTables.min.js"></script>
<script src="/assets_backend/source/bower_components/datatables.net-bs/js/dataTables.bootstrap.min.js"></script>
<!-- Morris.js charts -->
<script src="/assets_backend/source/bower_components/raphael/raphael.min.js"></script>
<script src="/assets_backend/source/bower_components/morris.js/morris.min.js"></script>
<!-- Sparkline -->
<script src="/assets_backend/source/bower_components/jquery-sparkline/dist/jquery.sparkline.min.js"></script>
<!-- jvectormap -->
<script src="/assets_backend/source/plugins/jvectormap/jquery-jvectormap-1.2.2.min.js"></script>
<script src="/assets_backend/source/plugins/jvectormap/jquery-jvectormap-world-mill-en.js"></script>
<!-- jQuery Knob Chart -->
<script src="/assets_backend/source/bower_components/jquery-knob/dist/jquery.knob.min.js"></script>
<!-- FLOT CHARTS -->
<script src="/assets_backend/source/bower_components/Flot/jquery.flot.js"></script>
<!-- FLOT RESIZE PLUGIN - allows the chart to redraw when the window is resized -->
<script src="/assets_backend/source/bower_components/Flot/jquery.flot.resize.js"></script>
<!-- FLOT PIE PLUGIN - also used to draw donut charts -->
<script src="/assets_backend/source/bower_components/Flot/jquery.flot.pie.js"></script>
<!-- FLOT CATEGORIES PLUGIN - Used to draw bar charts -->
<script src="/assets_backend/source/bower_components/Flot/jquery.flot.categories.js"></script>
<!-- ChartJS -->
<script src="/assets_backend/source/bower_components/Chart.js/Chart.js"></script>
<!-- daterangepicker -->
<script src="/assets_backend/source/bower_components/moment/min/moment.min.js"></script>
<script src="/assets_backend/source/bower_components/bootstrap-daterangepicker/daterangepicker.js"></script>
<!-- datepicker -->
<script src="/assets_backend/source/bower_components/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js"></script>
<!-- Bootstrap WYSIHTML5 -->
<script src="/assets_backend/source/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js"></script>
<!-- Slimscroll -->
<script src="/assets_backend/source/bower_components/jquery-slimscroll/jquery.slimscroll.min.js"></script>
<!-- FastClick -->
<script src="/assets_backend/source/bower_components/fastclick/lib/fastclick.js"></script>
<!-- AdminLTE App -->
<script src="/assets_backend/source/dist/js/adminlte.min.js"></script>
<!-- AdminLTE dashboard demo (This is only for demo purposes) -->
<script src="/assets_backend/source/dist/js/pages/dashboard.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="/assets_backend/source/dist/js/demo.js"></script>

<!-- Custom JS of Daily-Bizsale -->
<script src="/assets_backend/assets/js/jquery.validate.min.js"></script>
<script src="/assets_backend/assets/js/custom.js"></script>
<script src="/selectpicker/bootstrap-select.min.js"></script>
<script src="/assets_backend/source/plugins/iCheck/icheck.min.js"></script>
<script type="text/javascript">
    $.validator.addMethod(
        "regex",
        function (value, element, regexp) {
            var re = new RegExp(regexp);
            return this.optional(element) || re.test(value);
        },
        "Email nhập vào không đúng định dạng."
    );
    $(document).ready(function () {
        /* SELECTPICKER */
        $('#cat_product').selectpicker({
            liveSearch: true
        });
        $('#selectpicker').selectpicker({
            liveSearch: true,
            maxOptions: 1
        });

        $('input[type="checkbox"].flat-red, input[type="radio"].flat-red').iCheck({
            checkboxClass: 'icheckbox_flat-green',
            radioClass   : 'iradio_flat-green'
        });

        $("#data_filter").appendTo(".dataTables_wrapper .row:first-child .col-sm-6:first-child");

        {% if (isFilter) %}
        $('#daterange-btn span').html('{{ QueryArr['time_start'] }} đến {{ QueryArr['time_end'] }}');
        {% endif %}

        $('#daterange-btn').daterangepicker(
            {
                opens: "right",
                /*autoApply: true,*/
                locale: {
                    "format": "DD/MM/YYYY",
                    "separator": " - ",
                    "applyLabel": "Chọn",
                    "cancelLabel": "Hủy",
                    "fromLabel": "Từ",
                    "toLabel": "Đến",
                    "customRangeLabel": "Tùy chọn",
                    "weekLabel": "W",
                    "daysOfWeek": [
                        "CN",
                        "T2",
                        "T3",
                        "T4",
                        "T5",
                        "T6",
                        "T7"
                    ],
                    "monthNames": [
                        "Tháng 1",
                        "Tháng 2",
                        "Tháng 3",
                        "Tháng 4",
                        "Tháng 5",
                        "Tháng 6",
                        "Tháng 7",
                        "Tháng 8",
                        "Tháng 9",
                        "Tháng 10",
                        "Tháng 11",
                        "Tháng 12"
                    ],
                    "firstDay": 1
                },
                ranges   : {
                    'Hôm nay'       : [moment(), moment()],
                    'Hôm qua'   : [moment().subtract(1, 'days'), moment().subtract(1, 'days')],
                    '7 ngày trước' : [moment().subtract(6, 'days'), moment()],
                    '30 ngày trước': [moment().subtract(29, 'days'), moment()],
                    'Tháng này'  : [moment().startOf('month'), moment().endOf('month')],
                    'Tháng trước'  : [moment().subtract(1, 'month').startOf('month'), moment().subtract(1, 'month').endOf('month')]
                },
                {% if (isFilter) %}
                startDate: "{{ QueryArr['time_start'] }}",
                endDate  : "{{ QueryArr['time_end'] }}",
                {% else %}
                startDate: moment().subtract(1, 'year'),
                endDate  : moment(),
                {% endif %}
            },
            function (start, end) {
                $('#daterange-btn span').html(start.format('DD/MM/YYYY') + ' đến ' + end.format('DD/MM/YYYY'));
            }
        );

        $('#daterange-btn').on('apply.daterangepicker', function(ev, picker) {
            console.log(picker.startDate.format('DD/MM/YYYY'));
            console.log(picker.endDate.format('DD/MM/YYYY'));
            $("#filter_form input#time_start").val(picker.startDate.format('DD/MM/YYYY'));
            $("#filter_form input#time_end").val(picker.endDate.format('DD/MM/YYYY'));
            $('#filter_form').submit();
        });


        $("#agency_info_form").validate({
            rules: {
                "agency[name]": {
                    required: true,
                    maxlength: 200
                },
                'agency[company_name]': {
                    required: true,
                    maxlength: 250
                },
                "agency[address]": {
                    required: true
                },
                "agency[email]": {
                    required: true,
                    maxlength: 100,
                    regex: /^([a-zA-Z0-9_.\-+])+\@(([a-zA-Z0-9-])+.)+([a-zA-Z0-9]{2,4})+$/
                },
                "agency[phone]": {
                    required: true,
                    regex: /^([0-9_.\-+])+$/,
                    minlength: 9,
                    maxlength: 13
                },
                "agency[industry_id]": {
                    required: true
                },
            },
            messages: {
                "agency[name]": {
                    required: "Bạn vui lòng nhập tên người liên hệ chính.",
                    maxlength: "Tên người liên hệ chính không được quá 200 ký tự."
                },
                "agency[company_name]": {
                    required: "Bạn vui lòng nhập tên của công ty.",
                    maxlength: "Tên công ty không được quá 250 ký tự."
                },
                "agency[address]": {
                    required: "Bạn vui nhập địa chỉ."
                },
                "agency[email]": {
                    required: "Bạn vui lòng nhập email.",
                    regex: "Email chưa đúng định dạng",
                    email: "Email chưa đúng định dạng",
                    maxlength: "Địa chỉ email không được quá 100 ký tự."
                },
                "agency[phone]": {
                    required: "Bạn vui lòng nhập số điện thoại.",
                    regex: "Số điện thoại không được chứa ký tự là chữ.",
                    minlength: "Số điện thoại phải lớn 8 và nhỏ hơn 14 kí tự là số.",
                    maxlength: "Số điện thoại phải lớn 8 và nhỏ hơn 14 kí tự là số."
                },
                "agency[industry_id]": {
                    required: "Bạn vui lòng chọn ngành nghề kinh doanh."
                },
            }
        });
        $("#agency_payment_form").validate({
            rules: {
                "agency[bank_owner]": {
                    required: true,
                    maxlength: 250
                },
                "agency[bank_account]": {
                    required: true
                },
                "agency[bank_name]": {
                    required: true,
                    maxlength: 250
                },
                "agency[bank_branch]": {
                    required: true,
                    maxlength: 250
                }
            },
            messages: {
                "agency[bank_owner]": {
                    required: "Bạn vui lòng nhập tên chủ tài khoản.",
                    maxlength: "Địa chỉ email không được quá 100 ký tự."
                },
                "agency[bank_account]": {
                    required: "Bạn vui lòng nhập số tài khoản."
                },
                "agency[bank_name]": {
                    required: "Bạn vui lòng nhập tên ngân hàng.",
                    maxlength: "Địa chỉ email không được quá 100 ký tự."
                },
                "agency[bank_branch]": {
                    required: "Bạn vui lòng nhập chi nhánh ngân hàng.",
                    maxlength: "Địa chỉ email không được quá 100 ký tự."
                },
            }
        });
    });
</script>
</body>
</html>
