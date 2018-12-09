<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin - Dashboard</title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <!-- Bootstrap 3.3.7 -->
    <link rel="stylesheet" href="/assets_backend/source/bower_components/bootstrap/dist/css/bootstrap.css">
    <link rel="stylesheet" href="/assets_backend/assets/css/bootstrapValidator.css">
    <link rel="stylesheet" href="/assets_backend/source/bower_components/bootstrap/dist/css/bootstrap-theme.css">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="/assets_backend/source/bower_components/font-awesome/css/font-awesome.min.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="/assets_backend/source/dist/css/AdminLTE.min.css">
    <!-- Custom CSS of Daily-Bizsale -->
    {#<link rel="stylesheet" href="/assets_backend/source/dist/css/custom.css">#}
    <link rel="stylesheet" href="/assets_backend/assets/css/custom.css">
    <link rel="stylesheet" href="/assets_backend/assets/css/res.css">

    <link rel="stylesheet" href="/assets_backend/assets/css/skin-bizsale.css">

    <!-- bootstrap wysihtml5 - text editor -->
    <link rel="stylesheet" href="/selectpicker/bootstrap-select.css">

    <!-- Google Font -->
    <link rel="stylesheet"
          href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">

    <!-- jQuery 3 -->
    <script src="/assets_backend/source/bower_components/jquery/dist/jquery.min.js"></script>
    <!-- jQuery UI 1.11.4 -->
    <script src="/assets_backend/source/bower_components/jquery-ui/jquery-ui.min.js"></script>
</head>
<body class="hold-transition skin-bizsale sidebar-mini">
<div class="wrapper">
    {{ content() }}
    {% include "layouts/control-sidebar.volt" %}
    <div class="control-sidebar-bg"></div>
    <div id="QuickView" class="modal fade" role="dialog" tabindex="-1" aria-labelledby="myLargeModalLabel"
         aria-hidden="true">
        <div class="modal-dialog">
            <button type="button" class="modal__close" data-dismiss="modal"><span
                        class="icon -ap icon-ion-android-close"></span></button>
            <div class="qcontent" data-product-id="" style="min-height: 400px;"></div>
        </div>
    </div>
</div>

<!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
<script>
    $.widget.bridge('uibutton', $.ui.button);
</script>
<!-- Bootstrap 3.3.7 -->
<script src="/assets_backend/source/bower_components/bootstrap/dist/js/bootstrap.js"></script>
<script src="/assets_backend/assets/js/bootstrapValidator.js"></script>

<!-- Custom JS of Daily-Bizsale -->
<script src="/assets_backend/assets/js/custom.js"></script>
<script src="/assets_backend/assets/js/zalo.js"></script>
<script src="/assets_backend/assets/js/uploadImage.js"></script>
<script src="/assets_backend/source/dist/js/adminlte.min.js"></script>
<script src="/selectpicker/bootstrap-select.js"></script>
{#<script src="/ckeditor/ckeditor.js"></script>#}
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
            z-index: 11111; /* Add a z-index if needed */
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
