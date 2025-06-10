<?php
$conn = new mysqli("localhost", "root", "", "globe_travel", 3307);
if ($conn->connect_error) {
    die("❌ Błąd połączenia: " . $conn->connect_error);
}
echo "✅ Połączono z bazą!";
?>
