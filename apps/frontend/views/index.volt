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
    <meta property="og:url" content="{{ mainMenu.link }}"/>
    <meta property="og:image" content="{{ header.image }}"/>
    <meta property="og:site_name" content="{{ websiteInfo.name }}"/>
    <meta property="fb:app_id" content="{{ config.facebook.app_id }}"/>
    <meta property="og:description" content="{{ header.desc }}"/>

    <link rel="stylesheet" href="/assets_frontend/vendor/css/bootstrap.min.css">
    <link rel="stylesheet" href="/assets_frontend/vendor/css/theme.min.css">
    <link rel="stylesheet" href="/assets_frontend/vendor/css/shop.min.css">
    <link rel="stylesheet" href="/assets_frontend/vendor/css/ap8.css">
    <link rel="stylesheet" href="/assets_frontend/css/menu.css">
    <link rel="stylesheet" href="/assets_frontend/css/style.css">
    <link rel="stylesheet" href="/assets_frontend/css/cart.css">
    <link rel="stylesheet" href="/assets_frontend/css/bank.css">
    <link rel="stylesheet" href="/assets_frontend/css/article.css">
    <script type="text/javascript" src="/assets_frontend/assets/js/jquery-3.3.1.min.js"></script>
    <script type="text/javascript" src="/assets_frontend/assets/js/shopping.js"></script>
    <script type="text/javascript" src="/assets_frontend/assets/js/custom.js"></script>
    <script>
        (function (i, s, o, g, r, a, m) {
            i['GoogleAnalyticsObject'] = r;
            i[r] = i[r] || function () {
                (i[r].q = i[r].q || []).push(arguments)
            }, i[r].l = 1 * new Date();
            a = s.createElement(o),
                m = s.getElementsByTagName(o)[0];
            a.async = 1;
            a.src = g;
            m.parentNode.insertBefore(a, m)
        })(window, document, 'script', 'https://www.google-analytics.com/analytics.js', 'ga');

        ga('create', 'UA-106650013-1', 'auto');
        ga('send', 'pageview');

    </script>
    <script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
    <script>
        (adsbygoogle = window.adsbygoogle || []).push({
            google_ad_client: "ca-pub-7093211495135765",
            enable_page_level_ads: true
        });
    </script>
    {#//        Google Analytics Code#}
    {{ websiteConfig.google_analytics }}

    {% if reCaptEnabled == true or (reCaptEnabled is not defined and loginAttempts > 2) %}
        {# <script src="https://www.google.com/recaptcha/api.js" async defer></script> #}
    {% endif %}
</head>

<body class="pace-on pace-dot">
<div class="pace-overlay"></div>
{{ content() }}
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
<script type="text/javascript" src="/assets_frontend/assets/js/jquery.validate.min.js"></script>
<script src="/assets_frontend/vendor/js/theme.min.js"></script>
<script src="/assets_frontend/vendor/js/slick.min.js"></script>
<div class="hidden" id="loading">
    <img src="/app/img/loading.svg" alt="">
</div>

<script src="/app/js/shopping.js"></script>
<script src="/assets_frontend/js/custom.js"></script>
{% if websiteConfig.chatbox.isShow %}    {{ websiteConfig.chatbox.code }}{% endif %}
<div id="fb-root"></div>
<script>(function (d, s, id) {
        var js, fjs = d.getElementsByTagName(s)[0];
        if (d.getElementById(id)) return;
        js = d.createElement(s);
        js.id = id;
        js.src = "//connect.facebook.net/vi_VN/sdk.js#xfbml=1&version=v2.10";
        fjs.parentNode.insertBefore(js, fjs);
    }(document, 'script', 'facebook-jssdk'));
</script>
<script src="https://apis.google.com/js/platform.js" async defer>
    {
        lang: 'vi'
    }
</script>
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
