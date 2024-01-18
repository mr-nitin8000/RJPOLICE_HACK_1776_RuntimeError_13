<?php
session_start();

if (isset($_SESSION['user_id']) && isset($_SESSION['user_email'])) {
    ?>
<?php

    $showAlert = false;
    $showError = false;
    $exists = false;

    if ($_SERVER["REQUEST_METHOD"] == "POST") {

        // Include file which makes the
        // Database Connection.
        include 'db_sign.php';

        $subject = $_POST["subject-name"];
        $compDesc = $_POST["complaint-desc"];

        // $sql = "Select * from users where email='$email'";
        // $result = mysqli_query($conn, $sql);
        // $num = mysqli_num_rows($result);

        // $num = 0;

        // This sql query is use to check if
        // the username is already present
        // or not in our Database

        // $hash = password_hash($password,
        //     PASSWORD_DEFAULT);

        // Password Hashing is used here.
        // $sql = "INSERT INTO `users` (`f_name`,`l_name`, `email`,`phone`,
        //         `password`, `cpassword`,`state`,`district`,`gender`) VALUES ('$first_name','$last_name','$email','$phone'
        //         '$hash','$hash','$state','$district','$gender')";
        $uid = $_SESSION['user_id'];
        $currentDate = date("Y-m-d");
        $sql = "INSERT INTO `complaint_tb` (`cmp_id`,`u_id`, `comp_desc`, `creat_date`, `status`, `sat`, `subject`) VALUES (NULL, '$uid', '$compDesc', '$currentDate','pending', 1, '$subject')";
        $result = mysqli_query($conn, $sql);

        // $result = mysqli_query($conn, $sql);

        // , current_timestamp(), '$location'

        if ($result) {
            $showAlert = true;
        }

        // if ($num > 0) {
        //     $exists = "Email Is already register";
        // }

    } //end if
    ?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Vaani- Women's Complaint Platform</title>
    <script src="
https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="
sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous">
    </script>

    <script src="
https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
        integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous">
    </script>

    <script src="
https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"
        integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous">
    </script>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
        integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">

</head>
<link rel="stylesheet" href="style/style.css" />

<body>

    <header class="header">
        <div class="header-content">
            <div class="head-left">
                <a href="index.php" class="head-logo-a">
                    <img src="img/logo-head.png" alt="" class="header-logo" />
                </a>
            </div>
            <div class="head-right">
                <a href="index.php" class="head-a-link">Home</a>
                <a href="about.php" class="head-a-link">About Us</a>
                <a href="profile.php" class="profile-img">
                    <div class="profile">
                        <img src="https://cdn.pixabay.com/photo/2018/08/28/13/29/avatar-3637561_640.png" alt=""
                            class="head-profile" />
                    </div>
                </a>
            </div>
        </div>
    </header>
    <?php

    if ($showAlert) {

        echo ' <div class="alert alert-success
            alert-dismissible fade show" role="alert">

            <strong>Success!</strong> Your account is
            now created and you can login.
            <button type="button" class="close"
                data-dismiss="alert" aria-label="Close">
                <span aria-hidden="true">×</span>
            </button>
        </div> ';
    }

    if ($showError) {

        echo ' <div class="alert alert-danger
            alert-dismissible fade show" role="alert">
        <strong>Error!</strong> ' . $showError . '

       <button type="button" class="close"
            data-dismiss="alert aria-label="Close">
            <span aria-hidden="true">×</span>
       </button>
     </div> ';
    }

    if ($exists) {
        echo ' <div class="alert alert-danger
            alert-dismissible fade show" role="alert">

        <strong>Error!</strong> ' . $exists . '
        <button type="button" class="close"
            data-dismiss="alert" aria-label="Close">
            <span aria-hidden="true">×</span>
        </button>
       </div> ';
    }

    ?>
    <main class="mid-post">
        <div class="mid-post-content">
            <h1 class="top-cmp-heading">Feel Free to tell Us...</h1>
            <div class="complaint-section">
                <h2 class="reg-comp-heading">Register Your Complaint Here</h2>
                <form action="#" class="complaint-form" method="post">
                    <input type="text" class="subject" name="subject-name" placeholder="Enter Subject Of Complaint" />
                    <textarea name="complaint-desc" id="comp-desc" cols="30" rows="10"
                        placeholder="Enter Complaint Here...."></textarea>
                    <div class="bottom">
                        <div class="privacy">
                            <input type="checkbox" id="public-show" name="privacy-show" value="0" />
                            <label for="public-show"> I want to public the complaint</label>
                            <div class="discla">
                                <span class="dis"><b>Note: </b>Vaani Can't reavale Your personal details in
                                    Any Public post</span>
                            </div>
                        </div>
                        <div class="send-btn">
                            <button type="submit" class="submit-btn">
                                Send
                            </button>

                        </div>
                    </div>
                </form>
            </div>
        </div>
    </main>
</body>
<style>
a {
    text-decoration: none;
    color white;
}

a:hover {
    color: white;
    text-decoration: none;
}
</style>

</html>
<?php
} else {
    header("Location: login.php");
}
?>