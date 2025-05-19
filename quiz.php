<?php
session_start();
if (!isset($_SESSION["loggedin"]) || $_SESSION["loggedin"] !== true) {
    header("location: home.php");
    exit;
}

require_once "config.php";
$db = getDB();
if (!empty($_SESSION["quiz_id"])) {
    $quizId = $_SESSION["quiz_id"];
} else {
    $quizId = $_GET["choice"];
}
$sql = "SELECT * FROM questions WHERE quiz_id = :quizId";

if ($stmt = $db->prepare($sql)) {
    $stmt->bindParam(":quizId", $quizId);
    if ($stmt->execute()) {
        $rows = $stmt->fetchAll();
    }
}

$_SESSION["quiz_id"] = $quizId;
$randomIndexes = [];
?>

<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Quiz</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="css/quiz_page.css">
</head>
<body>
    <nav class="navbar bg-transparent">
        <div class="container-fluid">
            <a class="navbar-brand" style="color: white" href="home.php">
                <img style="width: 60px; height 60px;" src="./images/pop%20logo.svg" alt="logo">
            </a>
        </div>
    </nav>
    <div class="container">
        <h1>Pop Quiz!</h1>

        <form action="results.php" method="post">
            <?php
            $chosenQstns = array();
            if (empty($_SESSION["questions"])) {
                for ($i = 0; $i < 10; $i++) {
                    $chosenNum = rand(0, 14);
                    while (in_array($chosenNum, $chosenQstns)) {
                        $chosenNum = rand(0, 14);
                    }
                    $chosenQstns[] = $chosenNum;
                    ?>
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title"><?= $i+1 ?>. <?= $rows[$chosenNum]["text"] ?></h5>

                            <?php
                            $questionId = $rows[$chosenNum]["id"];
                            $randomIndexes[] = $chosenNum;

                            $sql = "SELECT * FROM answers WHERE question_id = :questionId";
                            if ($stmt = $db->prepare($sql)) {
                                $stmt->bindParam(":questionId", $questionId);
                                if ($stmt->execute()) {
                                    $answers = $stmt->fetchAll();
                                }
                            }

                            $chosenAnswers = array();
                            for ($j = 0; $j < 4; $j++) {
                                $chosenNum = rand(0, 3);
                                while (in_array($chosenNum, $chosenAnswers)) {
                                    $chosenNum = rand(0, 3);
                                }
                                $chosenAnswers[] = $chosenNum;
                                ?>

                                <label class="answer-label">
                                    <input type="radio" name="answer<?= $i ?>" value="<?= $answers[$chosenNum]["id"] ?>">
                                    <?= $answers[$chosenNum]["text"] ?>
                                </label>

                                <?php
                            }
                            ?>
                        </div>
                    </div>
                    <?php
                }
            } else {
                ?><h3>Please answer all the questions!</h3>
                <?php
                for ($i = 0; $i < 10; $i++) {
                    $questionIdx = $_SESSION["questions"][$i];
                    ?>
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title"><?= $i+1 ?>. <?= $rows[$questionIdx]["text"] ?></h5>

                            <?php
                            $questionId = $rows[$questionIdx]["id"];
                            $sql = "SELECT * FROM answers WHERE question_id = :questionId";
                            if ($stmt = $db->prepare($sql)) {
                                $stmt->bindParam(":questionId", $questionId);
                                if ($stmt->execute()) {
                                    $answers = $stmt->fetchAll();
                                }
                            }

                            $chosenAnswers = array();
                            for ($j = 0; $j < 4; $j++) {
                                $chosenNum = rand(0, 3);
                                while (in_array($chosenNum, $chosenAnswers)) {
                                    $chosenNum = rand(0, 3);
                                }
                                $chosenAnswers[] = $chosenNum;
                                ?>

                                <label class="answer-label">
                                    <input type="radio" name="answer<?= $i ?>" value="<?= $answers[$chosenNum]["id"] ?>">
                                    <?= $answers[$chosenNum]["text"] ?>
                                </label>

                                <?php
                            }
                            ?>
                        </div>
                    </div>
                    <?php
                }
            }
            if (empty($_SESSION["questions"]))
                $_SESSION["questions"] = $randomIndexes;
            ?>

            <input type="submit" value="Submit Quiz!">
        </form>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>

