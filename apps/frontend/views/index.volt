<!DOCTYPE html>
<html lang="vi">

<head>
    <title>{{ header.title }}</title>
    <meta charset="utf-8"/>
    <meta content="IE=edge" http-equiv="X-UA-Compatible"/>
    <meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" name="viewport" id="viewport"/>
    <meta content="index, follow" name="ROBOTS">

    <meta name="robots" content="index, follow"/>
    <meta content='index, follow' name='GOOGLEBOT'/>
    <meta content='index, follow' name='yahooBOT'/>
    <meta name="Slurp" content="index,follow"/>
    <meta name="revisit-after" content="1 days"/>
    <meta name="MSNBot" content="index,follow"/>
    <meta http-equiv="Content-Language" content="vi"/>
    <meta name="revisit-after" content="1 days"/>
    <meta content="{{ header.desc }}" name='author'/>
    <link rel="shortcut icon" type="{{ websiteConfig['favicon'] }}" href="{{ websiteConfig['favicon'] }}"/>
    <link rel="canonical" href="{{ header.canonial }}"/>
    <meta name="description" content="{{ header.desc }}"/>
    <meta name="keywords" content="{{ header.key }}"/>
    <meta property="og:title" content="{{ header.title }}"/>
    <meta property="og:url" content="{{ url_link }}"/>
    <meta property="og:image" content="{{ header.image }}"/>
    <meta property="og:site_name" content="{{ websiteConfig['website_name'] }}"/>
    <meta property="og:description" content="{{ header.desc }}"/>

    <link rel="stylesheet" href="/assets_frontend/vendor/css/bootstrap.min.css">
    <link rel="stylesheet" href="/assets_frontend/assets/css/bootstrapValidator.css">
    <link rel="stylesheet" href="/assets_frontend/vendor/css/theme.min.css">
    <link rel="stylesheet" href="/assets_frontend/vendor/css/shop.min.css">
    <link rel="stylesheet" href="/assets_frontend/vendor/css/ap8.css">
    <link rel="stylesheet" href="/assets_frontend/css/menu.css">
    <link rel="stylesheet" href="/assets_frontend/css/style.css">
    <link rel="stylesheet" href="/assets_frontend/css/cart.css">
    <link rel="stylesheet" href="/assets_frontend/css/bank.css">
    <link rel="stylesheet" href="/assets_frontend/css/article.css">
    <link rel="stylesheet" href="/assets_frontend/css/res.css">
    <script type="text/javascript" src="/assets_frontend/assets/js/jquery-3.3.1.min.js"></script>
    <script type="text/javascript" src="/assets_frontend/assets/js/shopping.js"></script>
    <script type="text/javascript" src="/assets_frontend/assets/js/custom.js"></script>
</head>

<body class="pace-on pace-dot">
<div class="pace-overlay"></div>
{{ content() }}

<a class="go-top go-top-square" href="javascript:void(0)"> <i class="fa fa-angle-up"></i> </a>
<script type="text/javascript">
    var oxyThemeData = {
        navbarHeight: 130,
        navbarScrolled: 120,
        navbarScrolledPoint: 200,
        menuClose: 'off',
        scrollFinishedMessage: 'No more items to load.',
        hoverMenu:
            {
                hoverActive: true,
                hoverDelay: 200,
                hoverFadeDelay: 200
            },
        siteLoader: 'on'
    };
</script>
<script src="/assets_frontend/vendor/js/theme.min.js"></script>

<script src="/assets_frontend/vendor/js/slick.min.js"></script>
<div class="hidden" id="loading">
    <img src="/app/img/loading.svg" alt="">
</div>
<script type="text/javascript" src="/assets_frontend/assets/js/bootstrap.js"></script>
<script type="text/javascript" src="/assets_frontend/assets/js/bootstrapValidator.js"></script>
<div id="fb-root"></div>
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

        #snackbar.error {
            background: #f3c413;
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
