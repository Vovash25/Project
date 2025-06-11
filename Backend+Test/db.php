<?php
$host = "localhost";
$port = 3307;
$user = "root";
$password = ""; 
$dbname = "globe_travel";

file_put_contents("debug_login.txt", "⚙️ próba połączenia z DB\n", FILE_APPEND);

$conn = new mysqli($host, $user, $password, $dbname, $port);
if ($conn->connect_error) {
    file_put_contents("debug_login.txt", "❌ Błąd połączenia: " . $conn->connect_error . "\n", FILE_APPEND);
    die("Błąd połączenia: " . $conn->connect_error);
}

file_put_contents("debug_login.txt", "✅ Połączenie z DB OK\n", FILE_APPEND);
?>
