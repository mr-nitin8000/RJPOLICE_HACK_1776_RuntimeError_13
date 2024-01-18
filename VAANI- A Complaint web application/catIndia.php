<?php
session_start();

if (isset($_SESSION['user_id']) && isset($_SESSION['user_email'])) {
    // print_r($_SESSION);
    // echo "<br>";
    require "db_conn.php";
    $flag = 1;
    $select = $conn->prepare('SELECT * FROM complaint_tb INNER JOIN users ON complaint_tb.u_id = users.id where  1=?');
    $select->execute([$flag]);
//   echo $user_id;
    $rows = $select->fetchAll(PDO::FETCH_OBJ);
    // print_r($rows);
// print_r($rows);

    ?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Vaani- Women's Complaint Platform</title>
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
    <section class="active-cases-section">
        <div class="active-cases-section-content">
            <div class="state-content">
                <div class="cases-heading">
                    Registered Cases in India :
                    <span class="state-heading" style="color: red"> 10</span>
                </div>
            </div>
        </div>
    </section>
    <main class="mid-post">
        <div class="mid-post-content">
            <h2 class="mid-recent-heading">Recent Cases in India</h2>
            <div class="card-grid">
                <?php
$num = 0;
    foreach ($rows as $row): ?>

                <?php
$id = $row->cmp_id;
    echo '<a href="postDetails.php?id=' . $id . '" class="card-a">';?>
                <div class="card">
                    <div class="left-card">
                        <img src="img/logo-head.png" alt="" class="card-img" />
                    </div>
                    <div class="right-card">
                        <div class="card-header">
                            <div class="profile card-profile-img">
                                <img src="https://cdn.pixabay.com/photo/2018/08/28/13/29/avatar-3637561_640.png" alt=""
                                    class="head-profile" />
                            </div>
                            <div class="card-name-time">
                                <div class="card-user-name"> <?php echo $row->state;
    echo $row->district; ?>
                                </div>
                                <p class="card-date-time"><?php echo $row->creat_date; ?></p>
                            </div>
                        </div>
                        <h3 class="card-subject-heading"><?php echo $row->subject; ?></h3>
                        <div class="card-content">
                            <p class="card-content-para">
                                <?php echo $row->comp_desc; ?>
                                <span class="para-fade">....</span>
                            </p>
                        </div>
                        <div class="card-stats">
                            Process: <span class="cmp-status"><?php echo $row->status; ?></span>
                        </div>
                    </div>
                </div>
                <?php echo '</a>'; ?>


                <?php endforeach;?>
                <!--  -->

            </div>
        </div>
    </main>
</body>

</html>
<?php
} else {
    header("Location: login.php");
}
?>