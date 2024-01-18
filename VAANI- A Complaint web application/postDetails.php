<?php
session_start();

if (isset($_SESSION['user_id']) && isset($_SESSION['user_email'])) {
    // print_r($_SESSION);
    // echo "<br>";
    ?>

<?php
require "db_conn.php";
    $id = $_GET['id'];
    $select = $conn->prepare('SELECT * FROM complaint_tb INNER JOIN users ON complaint_tb.u_id = users.id where  complaint_tb.cmp_id=?');
    $select->execute([$id]);
//   echo $user_id;
    $rows = $select->fetchAll(PDO::FETCH_OBJ);
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
                <a href="index.html" class="head-a-link">Home</a>
                <a href="about.html" class="head-a-link">About Us</a>
                <a href="profile.html" class="profile-img">
                    <div class="profile">
                        <img src="https://cdn.pixabay.com/photo/2018/08/28/13/29/avatar-3637561_640.png" alt=""
                            class="head-profile" />
                    </div>
                </a>
            </div>
        </div>
    </header>
    <?php
foreach ($rows as $row):
    ?>
    <main class="mid-post">
        <div class="mid-post-content">
            <div class="post-section">
                <div class="post-head">
                    <img src="https://source.unsplash.com/random/800x600?sad" alt="Post Img" class="post-img"
                        loading="lazy" />
                </div>
                <div class="post-bottom">
                    <div class="post-subject">
                        <h2 class="post-sub-heading">
                            <?php echo $row->subject; ?>
                        </h2>
                    </div>
                    <div class="post-header">
                        <img src="img/icon/navigation.png" alt="" class="location" />
                        <div class="case-add">
                            <?php echo '' . $row->district . '-' . $row->state;

    ?></div>
                        <img src="img/icon/time.png" alt="" class="location time" />
                        <div class="case-add time"><?php echo $row->creat_date; ?></div>
                    </div>
                    <div class="complaint-desc">
                        " <?php echo $row->comp_desc; ?> "
                    </div>
                    <div class="complaint-status">
                        <h2 class="status-complaint">
                            Status: <i><b><?php echo $row->status; ?></b></i>
                        </h2>
                    </div>
                </div>
            </div>
        </div>
    </main>
    <?php endforeach;?>
</body>

</html>
<?php
} else {
    header("Location: login.php");
}
?>