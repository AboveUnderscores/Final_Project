<?php
session_start();
//if (!isset($_SESSION["loggedin"]) || $_SESSION["loggedin"] !== true) {
//    header("location: home.php");
//    exit;
//}

require_once("config.php");
$db = getDB();
$sql = "SELECT * from quizzes";
if ($stmt = $db -> prepare($sql)) {
    if ($stmt -> execute()) {
        $rows = $stmt -> fetchAll();
    }
}

$_SESSION["questions"] = [];
?>

<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Choose a Quiz</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="css/home_page.css">
</head>
<div>
    <nav class="navbar navbar-expand-lg navbar_bg">
        <div class="container-fluid">
            <a class="navbar-brand" style="color: white" href="home.php">
                <img style="width: 60px; height 60px;" src="./images/pop%20logo.svg" alt="logo">
            </a>
            <?php
                if (!isset($_SESSION["loggedin"]) || $_SESSION["loggedin"] !== true) {
                    ?>
                    <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
                        <div class="navbar-nav ms-auto">
                            <a class="btn btn-outline-light me-2 auth_button" href="login.php">Login</a>
                            <a class="btn btn-outline-light me-2 auth_button" href="register.php">Register</a>
                        </div>
                    </div>
            <?php
                } else {
                    ?>
                    <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
                        <div class="navbar-nav ms-auto">
                            <a class="nav-link text-light">Welcome back, <?= $_SESSION["username"]?>!</a>
                            <a class="btn btn-outline-light me-2 auth_button" href="logout.php">Logout</a>
                        </div>
                    </div>
            <?php
                }
                ?>
        </div>
    </nav>
        <?php
        if (!isset($_SESSION["loggedin"]) || $_SESSION["loggedin"] !== true) {
            ?>
            <div class="message_container">
                <div class="content_wrapper">
                    <div class="home_message">
                        <h1>Welcome to Pop!</h1>
                        <p>
                            A pop quiz website made for all your pop quiz needs! <br>
                            With an expansive <?php echo (sizeof($rows)) ?> quiz library you can find the right pop quiz for you!
                        </p>
                    </div>
                    <div>
                        <a class="get_started_button" href="login.php">
                            Get Started
                            <svg class="arrow" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="3" stroke-linecap="round" stroke-linejoin="round">
                                <line x1="3" y1="12" x2="19" y2="12"></line>
                                <polyline points="12 5 19 12 12 19"></polyline>
                            </svg>
                        </a>
                    </div>
                </div>
            </div>
            <?php
        } else {
            ?>
            <div class="message_container">
                 <div class="home_message">
                    <h1>Welcome to Pop!</h1>
                    <p>
                        A pop quiz website made for all your pop quiz needs! <br>
                        With an expansive <?php echo (sizeof($rows)) ?> quiz library you can find the right pop quiz for you!
                    </p>
                </div>
            </div>
            <div class="library_container">
                <h1 class="py-2" style="text-align: center;">Quiz Library</h1>
                <div class="card_group" style="text-align: center;">
                    <?php
                    foreach ($rows as $row) {
                        ?>
                        <form action="quiz.php">
                            <div class="card mx-1" style="width: 18rem;padding: 5px;">
                                <div class="card-body">
                                    <h5 class="card-title"><?= $row["quiz_name"]?></h5>
                                    <input type="hidden" name="choice" value=<?= $row["id"]?>>
                                    <input type="submit" class="btn btn-primary" value="Go to <?= $row["quiz_name"]?>!">
                                </div>
                            </div>
                        </form>
                        <?php
                    }
                    ?>
                </div>
            </div>
        <?php
        }
        ?>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>

