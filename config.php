<?php
const DB_SERVER = "localhost";
const DB_USERNAME = "root";
const DB_PASSWORD = "root";
const DB_NAME = "pop";

function getDB() {
    try {
        $pdo = new PDO("mysql:host=" . DB_SERVER . ";dbname=" . DB_NAME,
            DB_USERNAME, DB_PASSWORD);
        $pdo -> setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        return $pdo;
    } catch (PDOException $e) {
        die("Error: Could not connect." . $e -> getMessage());
    }
}
?>