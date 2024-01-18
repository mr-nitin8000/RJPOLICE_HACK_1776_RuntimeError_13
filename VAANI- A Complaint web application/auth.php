<?php
session_start();
include 'db_conn.php';
// include 'db.php';

if (isset($_POST['email']) && isset($_POST['password'])) {

    $email = $_POST['email'];
    $password = $_POST['password'];

    if (empty($email)) {
        header("Location: login.php?error=Email is required");
    } else if (empty($password)) {
        header("Location: login.php?error=Password is required&email=$email");
    } else {
        $stmt = $conn->prepare("SELECT * FROM users WHERE u_status = 1 and email=?");
        $stmt->execute([$email]);

        if ($stmt->rowCount() === 1) {
            $user = $stmt->fetch();

            $user_id = $user['id'];
            $user_email = $user['email'];
            $user_password = $user['password'];
            $user_first_name = $user['f_name'];
            $user_last_name = $user['l_name'];
            $user_phone = $user['phone'];
            $user_state = $user['state'];
            $user_district = $user['district'];
            $user_gender = $user['gender'];
            $user_img = $user['imgid'];
            $user_reg_complaints = $user['reg_complaints'];
            $user_status = $user['u_status'];

            if ($email === $user_email) {
                if (password_verify($password, $user_password)) {
                    // if ($password === $user_password) {
                    $_SESSION['user_id'] = $user_id;
                    $_SESSION['user_email'] = $user_email;
                    $_SESSION['user_first_name'] = $user_first_name;
                    $_SESSION['user_last_name'] = $user_last_name;
                    $_SESSION['user_phone'] = $user_phone;
                    $_SESSION['user_state'] = $user_state;
                    $_SESSION['user_district'] = $user_district;
                    $_SESSION['user_gender'] = $user_gender;
                    $_SESSION['user_img'] = $user_imgid;
                    $_SESSION['user_reg_complaints'] = $user_reg_complaints;
                    $_SESSION['user_status'] = $user_status;
                    header("Location: index.php");

                } else {

                    header("Location: login.php?error=Incorrect User $password $user_password name or password&email=$email");
                }
            } else {
                header("Location: login.php?error=Incorrect User name or password&email=$email");
            }
        } else {
            header("Location: login.php?error=Incorrect User name or password&email=$email");
        }
    }
}
