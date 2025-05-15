<?php

    require_once "config.php";
    $db = getDB();

    if (!empty($_SESSION["quiz_id"])) {
        $quizId = $_SESSION["quiz_id"];
    } else {
        $quizId = $_GET["choice"];
    }
    $sql = "SELECT * FROM questions WHERE quiz_id = :quizId";


function read_words($filename){
    $parts_of_speech = array("noun", "verb", "adjective");
    shuffle($parts_of_speech);
    $answer_part = array_pop($parts_of_speech);

    $lines = file($filename);
    shuffle($lines);

    $choices = array();
    while(count($choices) <5){
        $line  = array_pop($lines);
        list($word, $part, $defn) = explode("\t", $line);
        if($answer_part == $part) {
            $choices[] = $line;
        }
    }
    return $choices;
}

$correct = 0;
$total = 0;
if (isset($_POST["guess"])) {
    $total = $_POST["total"];
    $correct = $_POST["correct"];
    if ($_POST["guess"] == ($_POST["correct_defn"])){
        $correct++;
    }
    $total++;
}

    $choices = read_words("allwords.txt");
    $answer_index = rand(0, count($choices) - 1);
    list($correct_answer, $correct_part, $correct_defn) = explode("\t", $choices[$answer_index]);

    if($_POST){ #this was magic to get working
        if($_POST["guess"]== $_POST["correct_defn"])
            print("<h2 id ='correct'> Correct. <h2>");
        else{
            print("<h2 id='incorrect'> Incorrect. The right definition is " . $_POST["correct_defn"] . "<h2>");
        }
    }
?>


<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="style.css">
    <title>Devin's Word Quiz</title>
</head>
<body>

    <h1>Devin's Word Quiz</h1>
    <h2>Score : <?= $correct ?> / <?= $total?></h2>

    <h2><?= $correct_answer ?> - <?= $correct_part ?></h2>
    <form action="quiz_form.php" method="post">
        <ol id="choices">
            <?php
            foreach($choices as $choice){
                list($word, $part, $defn) = explode("\t", $choice);
                ?>
                <li>
                    <label>
                        <input type="radio" name="guess" value ="<?= $defn ?>"/>
                        <?= $defn ?>
                    </label>
                </li>
                <?php
            }
            ?>
        </ol>
        <input type="hidden" name="correct_defn" value="<?= $correct_defn?>">
        <input type="hidden" name="total" value="<?= $total?>">
        <input type="hidden" name="correct" value="<?= $correct?>">
        <input type="submit" value="submit">
    </form>
</body>
</html>