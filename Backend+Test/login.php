<?php
session_start();
file_put_contents("debug_login.txt", "🔥 start login.php\n", FILE_APPEND);

require 'db.php'; // подключение к базе
file_put_contents("debug_login.txt", "✅ DB included\n", FILE_APPEND);

// Получаем данные из POST
$email = $_POST['email'] ?? '';
$password = $_POST['password'] ?? '';
file_put_contents("debug_login.txt", "📩 Email: $email | Hasło: $password\n", FILE_APPEND);
file_put_contents("debug_login.txt", "✅ _POST = " . var_export($_POST, true) . "\n", FILE_APPEND);

// Готовим запрос
$stmt = $conn->prepare("SELECT UzytkownikID, Haslo, RolaID FROM uzytkownicy WHERE Email = ?");
$stmt->bind_param("s", $email);
$stmt->execute();
$result = $stmt->get_result();
file_put_contents("debug_login.txt", "📥 Query executed\n", FILE_APPEND);

// Обработка результата
if ($user = $result->fetch_assoc()) {
    file_put_contents("debug_login.txt", "👤 Użytkownik znaleziony\n", FILE_APPEND);
    file_put_contents("debug_login.txt", "🔐 Hasło z bazy: " . $user['Haslo'] . "\n", FILE_APPEND);

    $verified = ($password === $user['Haslo']);

    file_put_contents("debug_login.txt", "🔍 password_verify: " . ($verified ? "TAK" : "NIE") . "\n", FILE_APPEND);

    if ($verified) {
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
    file_put_contents("debug_login.txt", "❌ Użytkownik NIE znaleziony\n", FILE_APPEND);
    echo "not_found";
}
?>
