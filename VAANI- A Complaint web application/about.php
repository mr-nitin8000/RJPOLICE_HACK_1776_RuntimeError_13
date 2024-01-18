<?php
session_start();

if (isset($_SESSION['user_id']) && isset($_SESSION['user_email'])) {
    ?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>About Vaani- Women's Complaint Platform</title>
</head>
<link rel="stylesheet" href="style/style.css" />

<body>
    <header class="header">
        <div class="header-content">
            <div class="head-left">
                <a href="#" class="head-logo-a">
                    <img src="img/logo-head.png" alt="" class="header-logo" />
                </a>
            </div>
            <div class="head-right">
                <a href="index.php" class="head-a-link">Home</a>
                <a href="profile.php" class="profile-img">
                    <div class="profile">
                        <img src="https://cdn.pixabay.com/photo/2018/08/28/13/29/avatar-3637561_640.png" alt=""
                            class="head-profile" />
                    </div>
                </a>
            </div>
        </div>
    </header>
    <div class="about-us-content">
        <img src="img/logo.png" alt="logo Vaani" class="about-img" />
        <h2 class="mid-recent-heading">About Us</h2>

        <main class="mid-post">
            <div class="mid-post-content">
                <div class="about">
                    <div class="about-main">
                        Vaani is a complaint registration web application that provides a
                        platform for women to report incidents of violence and harassment.
                        The application is designed to be user-friendly, secure, and
                        accessible, with features such as real-time reporting, anonymous
                        reporting, and multi-lingual support. Vaani aims to empower women
                        by providing them with a means to seek help and support in dealing
                        with violent or distressing incidents. The platform can be
                        integrated with local support services, such as counseling and
                        legal aid, to provide women with comprehensive support. Vaani also
                        collects and analyzes data on incidents of violence and
                        harassment, providing valuable insights for policy and program
                        development. Overall, Vaani is a promising initiative to enhance
                        women's safety and well-being, particularly in the context of
                        India.
                    </div>
                    <div class="about-contact">
                        To contact Vaani Techlabs Private Limited, the developer of the
                        Vaani complaint registration web application, you can call us on
                        +91-9485948539 with your inquiries, collaborations, or questions.
                        You can also reach out to them via email at info@vaanitechlabs.com
                        or call them at +918159842029. Additionally, you can visit their
                        registered office at 154/163 Hospital Para, Jaipur, RajAsthan,
                        India.
                    </div>
                </div>
            </div>
        </main>
    </div>
</body>

</html>

<?php
} else {
    header("Location: login.php");
}
?>