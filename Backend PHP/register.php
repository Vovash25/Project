<?php
require 'db.php';

$email = $_POST['email'];
$password = password_hash($_POST['password'], PASSWORD_DEFAULT);
$roleId = 3; 

$check = $conn->prepare("SELECT * FROM uzytkownicy WHERE Email = ?");
$check->bind_param("s", $email);
$check->execute();
$result = $check->get_result();
if ($result->num_rows > 0) {
    echo "duplicate";
    exit;
}

$stmt = $conn->prepare("INSERT INTO uzytkownicy (Email, Haslo, RolaID) VALUES (?, ?, ?)");
$stmt->bind_param("ssi", $email, $password, $roleId);

if ($stmt->execute()) {
    echo "success";
} else {
    echo "error";
}
?>