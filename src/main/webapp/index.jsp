<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="UTF-8">

<meta name="viewport"
      content="width=device-width, initial-scale=1.0">

<title>Last Minute Slot Booking</title>


<style>

/* =====================================================
   RESET
===================================================== */

* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: Arial, Helvetica, sans-serif;
}


body {
    background: #f5f8fc;
    color: #111b3a;
    overflow-x: hidden;
}


/* =====================================================
   NAVBAR
===================================================== */

.navbar {

    height: 68px;

    background: #061d3d;

    display: flex;

    align-items: center;

    justify-content: space-between;

    padding: 0 5%;

    position: sticky;

    top: 0;

    z-index: 1000;

    box-shadow:
        0 4px 18px
        rgba(0,0,0,0.15);

    animation:
        navbarSlide
        0.7s
        ease-out;
}


@keyframes navbarSlide {

    from {
        opacity: 0;
        transform: translateY(-100%);
    }

    to {
        opacity: 1;
        transform: translateY(0);
    }
}


/* =====================================================
   LOGO
===================================================== */

.logo {

    display: flex;

    align-items: center;

    gap: 10px;

    color: white;

    font-size: 21px;

    font-weight: bold;

    text-decoration: none;

    white-space: nowrap;
}


.logo-icon {
    font-size: 28px;
}


.logo span {
    color: #1683ff;
}


/* =====================================================
   NAVIGATION
===================================================== */

.nav-links {

    height: 100%;

    display: flex;

    align-items: center;

    gap: 35px;
}


.nav-links a {

    height: 100%;

    display: flex;

    align-items: center;

    position: relative;

    color: white;

    text-decoration: none;

    font-size: 15px;

    font-weight: 500;

    transition:
        color 0.25s ease;
}


.nav-links a:hover {

    color: #1683ff;
}


.nav-links .active {

    color: white;
}


.nav-links .active::after {

    content: "";

    position: absolute;

    bottom: 0;

    left: 0;

    right: 0;

    height: 4px;

    background: #1683ff;

    border-radius:
        5px 5px 0 0;
}


/* =====================================================
   HERO SECTION
===================================================== */

.hero {

    min-height: 475px;

    background:

        linear-gradient(
            rgba(3, 18, 40, 0.40),
            rgba(3, 18, 40, 0.58)
        ),

        url("https://static.vecteezy.com/system/resources/thumbnails/071/825/744/small_2x/illuminated-stadium-night-view-with-lush-green-field-neural-network-photo.jpg");

    background-size: cover;

    background-position: center;

    display: flex;

    align-items: center;

    justify-content: center;

    text-align: center;

    color: white;

    animation:
        heroLoad
        1s
        ease-out;
}


@keyframes heroLoad {

    from {

        opacity: 0;

        background-size: 115%;
    }

    to {

        opacity: 1;

        background-size: cover;
    }
}


.hero-content {

    max-width: 900px;

    padding: 30px;

    animation:
        heroContent
        0.9s
        ease-out;
}


@keyframes heroContent {

    from {

        opacity: 0;

        transform:
            translateY(35px)
            scale(0.97);
    }

    to {

        opacity: 1;

        transform:
            translateY(0)
            scale(1);
    }
}


.hero h1 {

    font-size: 50px;

    font-weight: 700;

    margin-bottom: 12px;

    text-shadow:
        0 3px 10px
        rgba(0,0,0,0.4);
}


.hero h2 {

    font-size: 28px;

    font-weight: 600;

    margin-bottom: 18px;
}


.hero p {

    font-size: 17px;

    line-height: 1.6;

    max-width: 650px;

    margin:
        0 auto 30px;

    color: #f1f5fb;
}


/* =====================================================
   HERO BUTTONS
===================================================== */

.hero-buttons {

    display: flex;

    justify-content: center;

    gap: 12px;

    animation:
        buttonsAppear
        0.8s
        ease-out
        0.35s
        both;
}


@keyframes buttonsAppear {

    from {

        opacity: 0;

        transform:
            translateY(20px);
    }

    to {

        opacity: 1;

        transform:
            translateY(0);
    }
}


.hero-btn {

    min-width: 190px;

    padding:
        15px 25px;

    border-radius: 9px;

    text-decoration: none;

    font-size: 17px;

    font-weight: bold;

    display: inline-flex;

    align-items: center;

    justify-content: center;

    gap: 10px;

    transition:
        transform 0.25s ease,
        box-shadow 0.25s ease;
}


.login-btn {

    background: #087df5;

    color: white;

    border:
        2px solid #087df5;
}


.register-btn {

    background: white;

    color: #087df5;

    border:
        2px solid white;
}


.hero-btn:hover {

    transform:
        translateY(-4px);

    box-shadow:
        0 10px 25px
        rgba(0,0,0,0.25);
}


.hero-btn:active {

    transform:
        translateY(0)
        scale(0.97);
}


/* =====================================================
   FEATURES
===================================================== */

.features {

    padding:
        35px 5% 25px;

    display: flex;

    justify-content: center;

    gap: 18px;

    background: #f5f8fc;
}


.feature-card {

    background: white;

    width: 31%;

    min-height: 175px;

    padding: 22px;

    text-align: center;

    border:
        1px solid #e2e8f0;

    border-radius: 12px;

    box-shadow:
        0 3px 12px
        rgba(0,0,0,0.06);

    transition:
        transform 0.3s ease,
        box-shadow 0.3s ease;

    animation:
        featureAppear
        0.7s
        ease-out
        both;
}


.feature-card:nth-child(1) {

    animation-delay: 0.15s;
}


.feature-card:nth-child(2) {

    animation-delay: 0.30s;
}


.feature-card:nth-child(3) {

    animation-delay: 0.45s;
}


@keyframes featureAppear {

    from {

        opacity: 0;

        transform:
            translateY(25px);
    }

    to {

        opacity: 1;

        transform:
            translateY(0);
    }
}


.feature-card:hover {

    transform:
        translateY(-7px);

    box-shadow:
        0 12px 28px
        rgba(0,0,0,0.12);
}


.feature-icon {

    width: 58px;

    height: 58px;

    margin:
        0 auto 12px;

    display: flex;

    align-items: center;

    justify-content: center;

    border-radius: 50%;

    background: #087df5;

    color: white;

    font-size: 27px;

    transition:
        transform 0.3s ease;
}


.feature-card:hover .feature-icon {

    transform:
        scale(1.1)
        rotate(-5deg);
}


.feature-card h3 {

    font-size: 18px;

    margin-bottom: 9px;
}


.feature-card p {

    color: #4c5b75;

    font-size: 15px;

    line-height: 1.5;
}


/* =====================================================
   FOOTER
===================================================== */

footer {

    background: #061d3d;

    color: white;

    padding:
        25px 5% 12px;
}


.footer-content {

    display: flex;

    justify-content: space-between;

    gap: 30px;

    max-width: 1200px;

    margin: auto;
}


.footer-section {

    width: 30%;
}


.footer-brand {

    display: flex;

    align-items: center;

    gap: 10px;

    margin-bottom: 8px;
}


.footer-brand-icon {

    font-size: 27px;
}


.footer-section h3 {

    font-size: 15px;

    margin-bottom: 8px;
}


.footer-section p {

    color: #c7d2e4;

    font-size: 13px;

    line-height: 1.7;
}


.footer-section a {

    color: #c7d2e4;

    text-decoration: none;

    font-size: 13px;

    line-height: 1.8;

    transition:
        color 0.2s ease;
}


.footer-section a:hover {

    color: #1683ff;
}


.copyright {

    text-align: center;

    border-top:
        1px solid #29415f;

    margin-top: 20px;

    padding-top: 12px;

    color: #c7d2e4;

    font-size: 12px;
}


/* =====================================================
   RESPONSIVE
===================================================== */

@media (max-width: 768px) {

    .navbar {

        padding:
            0 20px;
    }


    .logo {

        font-size: 16px;
    }


    .nav-links {

        gap: 12px;
    }


    .nav-links a {

        font-size: 12px;
    }


    .hero {

        min-height: 500px;
    }


    .hero h1 {

        font-size: 35px;
    }


    .hero h2 {

        font-size: 22px;
    }


    .hero p {

        font-size: 15px;
    }


    .hero-buttons {

        flex-direction: column;

        align-items: center;
    }


    .hero-btn {

        width: 220px;
    }


    .features {

        flex-direction: column;

        padding:
            25px 20px;
    }


    .feature-card {

        width: 100%;
    }


    .footer-content {

        flex-direction: column;
    }


    .footer-section {

        width: 100%;
    }
}


@media (max-width: 480px) {

    .logo {

        font-size: 14px;
    }


    .nav-links {

        gap: 8px;
    }


    .nav-links a {

        font-size: 10px;
    }


    .hero h1 {

        font-size: 30px;
    }


    .hero h2 {

        font-size: 19px;
    }
}

</style>

</head>


<body>


<!-- =====================================================
     NAVBAR
===================================================== -->

<nav class="navbar">


    <!-- LOGO -->

    <a href="index.jsp"
       class="logo">

        📅 Last Minute
        <span>Slot Booking</span>

    </a>


    <!-- EXACTLY 4 NAVIGATION OPTIONS -->

    <div class="nav-links">

        <a href="index.jsp"
           class="active">

            Home

        </a>


        <a href="about.jsp">

            About

        </a>


        <a href="login.jsp">

            Login

        </a>


        <a href="register.jsp">

            Register

        </a>

    </div>

</nav>



<!-- =====================================================
     HERO
===================================================== -->

<section class="hero">

    <div class="hero-content">


        <h1>
            Last Minute Slot Booking
        </h1>


        <h2>
            Book Available Slots Quickly
        </h2>


        <p>
            Find and book sports grounds, courts
            and play areas at the last minute
            with real-time availability.
        </p>


        <!-- ONLY LOGIN + REGISTER HERE -->

        <div class="hero-buttons">


            <a href="login.jsp"
               class="hero-btn login-btn">

                👤 Login →

            </a>


            <a href="register.jsp"
               class="hero-btn register-btn">

                👤+ Register →

            </a>


        </div>

    </div>

</section>



<!-- =====================================================
     FEATURES
===================================================== -->

<section class="features">


    <!-- FEATURE 1 -->

    <div class="feature-card">

        <div class="feature-icon">
            ⚡
        </div>

        <h3>
            Fast Booking
        </h3>

        <p>
            Book available slots in seconds.
        </p>

    </div>


    <!-- FEATURE 2 -->

    <div class="feature-card">

        <div class="feature-icon">
            ◷
        </div>

        <h3>
            Real-Time Updates
        </h3>

        <p>
            Check live availability of
            grounds and courts.
        </p>

    </div>


    <!-- FEATURE 3 -->

    <div class="feature-card">

        <div class="feature-icon">
            ✓
        </div>

        <h3>
            Easy to Use
        </h3>

        <p>
            Simple and clean interface.
        </p>

    </div>


</section>



<!-- =====================================================
     FOOTER
===================================================== -->

<footer>


    <div class="footer-content">


        <!-- BRAND -->

        <div class="footer-section">

            <div class="footer-brand">

                <span class="footer-brand-icon">
                    📅
                </span>

                <h3>
                    Last Minute Slot Booking
                </h3>

            </div>


            <p>
                Play More. Wait Less.
            </p>

        </div>



        <!-- QUICK LINKS -->

        <div class="footer-section">

            <h3>
                Quick Links
            </h3>


            <p>

                <a href="index.jsp">
                    Home
                </a>

                <br>


                <a href="about.jsp">
                    About
                </a>

                <br>


                <a href="login.jsp">
                    Login
                </a>

                <br>


                <a href="register.jsp">
                    Register
                </a>

            </p>

        </div>



        <!-- CONTACT -->

        <div class="footer-section">

            <h3>
                Contact
            </h3>


            <p>
                ✉ support@lastminuteslotbooking.com
            </p>


            <p>
                📍 Pune, Maharashtra
            </p>

        </div>


    </div>



    <!-- COPYRIGHT -->

    <div class="copyright">

        © 2026 Last Minute Slot Booking.
        All Rights Reserved.

    </div>


</footer>


</body>

</html>