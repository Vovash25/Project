<?php
session_start();
require 'db.php';

$email = $_POST['email'];
$password = $_POST['password'];

$stmt = $conn->prepare("SELECT UzytkownikID, Haslo, RolaID FROM uzytkownicy WHERE Email = ?");
$stmt->bind_param("s", $email);
$stmt->execute();
$result = $stmt->get_result();

if ($user = $result->fetch_assoc()) {
    if (password_verify($password, $user['Haslo'])) {
        $_SESSION['user_id'] = $user['UzytkownikID'];
        $_SESSION['role_id'] = $user['RolaID'];

        if ($user['RolaID'] == 1) {
            echo "admin";
        } else {
            echo "user";
        }
    } else {
        echo "invalid";
    }
} else {
    echo "not_found";
}
?>