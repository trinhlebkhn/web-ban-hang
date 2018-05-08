<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Đại lý Bizsale - Dashboard</title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <!-- Bootstrap 3.3.7 -->
    <link rel="stylesheet" href="/assets_backend/source/bower_components/bootstrap/dist/css/bootstrap.css">
    <link rel="stylesheet" href="/assets_backend/source/bower_components/bootstrap/dist/css/bootstrap-theme.css">
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
    <div id="QuickView" class="modal fade" role="dialog" tabindex="-1" aria-labelledby="myLargeModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <button type="button" class="modal__close" data-dismiss="modal"><span class="icon -ap icon-ion-android-close"></span></button>
            <div class="qcontent" data-product-id="" style="min-height: 400px;"></div>
        </div>
    </div>
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
<script src="/assets_backend/assets/js/uploadImage.js"></script>
<script src="/selectpicker/bootstrap-select.min.js"></script>
<script src="/assets_backend/source/plugins/iCheck/icheck.min.js"></script>
<style>
    @media (min-width: 320px) {
        /* The snackbar - position it at the bottom and in the middle of the screen */
        #snackbar {
            visibility: hidden; /* Hidden by default. Visible on click */
            min-width: 250px; /* Set a default minimum width */
            max-width: 300px;
            margin-left: -125px; /* Divide value of min-width by 2 */
            background-color: #007b76; /* Black background color */
            color: #fff; /* White text color */
            text-align: center; /* Centered text */
            border-radius: 2px; /* Rounded borders */
            padding: 16px; /* Padding */
            position: fixed; /* Sit on top of the screen */
            z-index: 1000; /* Add a z-index if needed */
            right: 30px; /* Center the snackbar */
            top: 215px; /* 30px from the bottom */
            color: #fff !important;
        }

        /* Show the snackbar when clicking on a button (class added with JavaScript) */
        #snackbar.show {
            visibility: visible; /* Show the snackbar */

            /* Add animation: Take 0.5 seconds to fade in and out the snackbar.
            However, delay the fade out process for 2.5 seconds */
            -webkit-animation: fadein 0.5s, fadeout 0.5s 2.5s;
            animation: fadein 0.5s, fadeout 0.5s 2.5s;
        }

        /* Animations to fade the snackbar in and out */
        @-webkit-keyframes fadein {
            from {
                top: 0;
                opacity: 0;
            }
            to {
                top: 215px;
                opacity: 1;
            }
        }

        @keyframes fadein {
            from {
                top: 0;
                opacity: 0;
            }
            to {
                top: 215px;
                opacity: 1;
            }
        }

        @-webkit-keyframes fadeout {
            from {
                top: 215px;
                opacity: 1;
            }
            to {
                top: 0;
                opacity: 0;
            }
        }

        @keyframes fadeout {
            from {
                top: 215px;
                opacity: 1;
            }
            to {
                top: 0;
                opacity: 0;
            }
        }
    }
</style>
</body>
</html>
