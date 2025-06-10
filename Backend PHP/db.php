<?php
$host = "localhost";
$port = 3307;
$user = "root";
$password = ""; 
$dbname = "globe_travel";

$conn = new mysqli($host, $user, $password, $dbname, $port);
if ($conn->connect_error) {
    die("Błąd połączenia: " . $conn->connect_error);
}
?>
