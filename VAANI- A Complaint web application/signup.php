<?php

$showAlert = false;
$showError = false;
$exists = false;

if ($_SERVER["REQUEST_METHOD"] == "POST") {

    // Include file which makes the
    // Database Connection.
    include 'db_sign.php';

    $first_name = $_POST["first_name"];
    $last_name = $_POST["last_name"];
    $email = $_POST["email"];
    $phone = $_POST["phone"];
    $password = $_POST["password"];
    $cpassword = $_POST["cpassword"];
    $state = $_POST["state"];
    $district = $_POST["district"];
    $gender = $_POST["gender"];

    $sql = "Select * from users where email='$email'";
    $result = mysqli_query($conn, $sql);
    $num = mysqli_num_rows($result);

    // $num = 0;

    // This sql query is use to check if
    // the username is already present
    // or not in our Database
    if ($num == 0) {

        $hash = password_hash($password,
            PASSWORD_DEFAULT);

        // Password Hashing is used here.
        // $sql = "INSERT INTO `users` (`f_name`,`l_name`, `email`,`phone`,
        //         `password`, `cpassword`,`state`,`district`,`gender`) VALUES ('$first_name','$last_name','$email','$phone'
        //         '$hash','$hash','$state','$district','$gender')";

        $sql = "INSERT INTO `users` (`id`, `f_name`, `l_name`, `email`, `phone`, `password`, `cpassword`, `state`, `district`, `gender`, `imgid`, `reg_complaints`, `u_status`) VALUES (NULL, '$first_name', '$last_name', '$email', '$phone', '$hash', '$hash', '$state', '$district', '$gender', NULL, '0', '1')";
        $result = mysqli_query($conn, $sql);

        // $result = mysqli_query($conn, $sql);

        // , current_timestamp(), '$location'

        if ($result) {
            $showAlert = true;
        }
    } // end if

    if ($num > 0) {
        $exists = "Email Is already register";
    }

} //end if

?>

<!doctype html>

<html lang="en">

<head>

    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1,
        shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
        integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
</head>

<body>

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
    <style>
    body {
        text-align: center;
    }

    .form-group {
        width: 90%;
        text-align: left;
        margin: 5%;
    }
    </style>
    <div class="container" style="min-height: 60vh;padding-top: 2vh;">

        <h1 class="text-center">Create Account</h1>
        <form action="#" method="post">

            <div class="form-group">
                <label for="full_name">First Name</label>
                <input type="text" class="form-control" id="full_name" name="first_name" placeholder="Enter First Name"
                    aria-describedby="emailHelp" required>
            </div>
            <div class="form-group">
                <label for="full_name">Last Name</label>
                <input type="text" class="form-control" id="last_name" name="last_name" placeholder="Enter First Name"
                    aria-describedby="emailHelp" required>
            </div>
            <div class="form-group">
                <label for="email">Email</label>
                <input type="email" class="form-control" id="email" name="email" placeholder="Enter Email"
                    aria-describedby="emailHelp" required>
            </div>
            <div class="form-group">
                <label for="phone">Phone Number</label>
                <input type="tel" class="form-control" id="phone" placeholder="Phone Number" name="phone"
                    aria-describedby="emailHelp" required>
            </div>
            <div class="form-group">
                <label for="state">State</label>
                <input type="text" class="form-control" id="state" name="state" aria-describedby="emailHelp"
                    placeholder="States" value="Rajasthan" required>
            </div>
            <div class="form-group">
                <label for="district">district</label>
                <input type="text" class="form-control" id="district" name="district" aria-describedby="emailHelp"
                    placeholder="District" value="Jaipur" required>
            </div>
            <div class="form-group">
                <label for="Gender">Gender</label>
                <input type="text" class="form-control" id="gender" name="gender" aria-describedby="emailHelp"
                    placeholder="Gender" value="Female" required>
            </div>

            <div class="form-group">
                <label for="password">Password</label>
                <input type="password" class="form-control" id="password" name="password" required>
            </div>

            <div class="form-group">
                <label for="cpassword">Confirm Password</label>
                <input type="password" class="form-control" id="cpassword" name="cpassword" required>

                <small id="emailHelp" class="form-text text-muted">
                    Make sure to type the same password
                </small>
            </div>

            <button type="submit" class="btn btn-primary mybtn">
                Create Account
            </button>
        </form>
    </div>
    <div class="d-flex justify-content-center align-items-center" style="min-height: 28vh">
        If you have an account than <a href="login.php">&#x200B;&#x200B; login </a>
    </div>
    <style>
    body {
        background-color: black;
        color: rgb(131, 193, 247);
        background: radial-gradient(ellipse at bottom, #0d1d31 0%, #0c0d13 100%);
    }
    </style>
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->

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
</body>
<style>
* {
    transition: all 0.4s ease 0s;
}

body {
    background-color: #11181d;
    color: white;
}

.logo {
    height: auto;
    width: 100%;
}

.mybtn {
    width: 90%;
    background-color: #c9d6df;
    color: #11181d;
    font-weight: bold;
}

.mybtn:hover {
    background-color: #a8b2b9;
}
</style>

</html>