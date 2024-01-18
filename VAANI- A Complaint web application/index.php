<?php
session_start();

if (isset($_SESSION['user_id']) && isset($_SESSION['user_email'])) {
    // print_r($_SESSION);
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
    <?php
include 'db_conn.php';
    $flag = 1;
    $stmt = $conn->prepare("SELECT * FROM complaint_tb INNER JOIN users ON complaint_tb.u_id = users.id where 1=?");
    $stmt->execute([$flag]);
    $rows = $stmt->fetchAll(PDO::FETCH_OBJ);
    $state = $_SESSION['user_state'];
    $s = $conn->prepare("SELECT count(users.state) as stat FROM complaint_tb INNER JOIN users ON complaint_tb.u_id = users.id where users.state=?");
    $s->execute([$state]);
    $r = $s->fetchAll(PDO::FETCH_OBJ);
    // dist
    $di = $_SESSION['user_district'];
    $d = $conn->prepare("SELECT count(users.district) as dis FROM complaint_tb INNER JOIN users ON complaint_tb.u_id = users.id where users.district=?");
    $d->execute([$di]);
    $dist = $d->fetchAll(PDO::FETCH_OBJ);
    $i = 1;
    $ind = $conn->prepare("SELECT count(complaint_tb.u_id) as n from complaint_tb where 1= ?");
    $ind->execute([$i]);
    $in = $ind->fetchAll(PDO::FETCH_OBJ);

    // print_r($stmt);

    ?>
    <header class="header">
        <div class="header-content">
            <div class="head-left">
                <a href="#" class="head-logo-a">
                    <img src="img/logo-head.png" alt="" class="header-logo" />
                </a>
            </div>
            <div class="head-right">
                <a href="index.php" class="head-a-link">Home</a>
                <a href="complaint.php" class="head-a-link">Raise Complaint</a>
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
                <div class="cases-heading">Registered Cases</div>
                <div class="cases-desc">
                    <a href="catIndia.php" class="state-a">
                        <div class="state">
                            <h2 class="state-heading">India</h2>
                            <p class="state-para">
                                <?php
foreach ($in as $t):
        echo $t->n;
    endforeach;

    ?>
                            </p>
                        </div>
                    </a>
                    <a href="catStat.php" class="state-a">
                        <div class="state">
                            <h2 class="state-heading"><?php echo $_SESSION['user_state']; ?></h2>
                            <p class="state-para">
                                <?php
foreach ($r as $w):
        echo $w->stat;
    endforeach;

    ?>
                            </p>
                        </div>
                    </a>
                    <a href="catDist.php" class="state-a">
                        <div class="state">
                            <h2 class="state-heading"><?php echo $_SESSION['user_district']; ?></h2>
                            <p class="state-para">
                                <?php
foreach ($dist as $dit):
        echo $dit->dis;
    endforeach;
    ?>
                            </p>
                        </div>
                    </a>
                </div>
            </div>
        </div>
    </section>
    <main class="mid-post">
        <div class="mid-post-content">
            <h2 class="mid-recent-heading">Recent Cases</h2>
            <div class="card-grid">
                <!-- start fore Each -->
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
                <!-- <a href="#card" class="card-a">
                    <div class="card">
                        <div class="left-card">
                            <img src="img/logo-head.png" alt="" class="card-img" />
                        </div>
                        <div class="right-card">
                            <div class="card-header">
                                <div class="profile card-profile-img">
                                    <img src="https://cdn.pixabay.com/photo/2018/08/28/13/29/avatar-3637561_640.png"
                                        alt="" class="head-profile" />
                                </div>
                                <div class="card-name-time">
                                    <div class="card-user-name">firstName lastName</div>
                                    <p class="card-date-time">17:23:PM 00/00/2023</p>
                                </div>
                            </div>
                            <h3 class="card-subject-heading">Complaint Subject</h3>
                            <div class="card-content">
                                <p class="card-content-para">
                                    Lorem ipsum dolor sit amet consectetur adipisicing elit.
                                    Delectus voluptates doloribus, aspernatur libero facere ipsa
                                    necessitatibus excepturi ab quasi, est perferendis deserunt
                                    enim sunt molestias, qui voluptatibus ex nihil. Culpa!
                                    <span class="para-fade">....</span>
                                </p>
                            </div>
                            <div class="card-stats">
                                Process: <span class="cmp-status">Pending</span>
                            </div>
                        </div>
                    </div>
                </a> -->
            </div>
        </div>
    </main>
    <!-- float button -->
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" />
    <a href="complaint.php" class="floating-a">
        <div class="floating-container">
            <div class="floating-button">
                <i class="m-icon">
                    <img src="img/icon/complaint.png" alt="" class="float-img" />
                </i>
            </div>
        </div>
    </a>
</body>

</html>

<?php
} else {
    header("Location: login.php");
}
?>