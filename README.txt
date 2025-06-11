# 🌐 Globe Travel – System rezerwacji wycieczek

Kompletny projekt strony internetowej do zarządzania wycieczkami z rozróżnieniem ról użytkowników.

---

## ✨ Funkcjonalności

- Rejestracja użytkowników (rola domyślna: klient)
- Logowanie z przekierowaniem w zależności od roli (admin / użytkownik)
- Panel administratora do zarządzania
- Panel użytkownika z podglądem rezerwacji
- Obsługa sesji i wylogowania

---

## 📁 Struktura projektu

```
globe_travel/
├── index.html          <- formularz logowania
├── register.html       <- formularz rejestracji (opcjonalnie)
├── admin.html          <- panel administratora
├── Rezerw.html         <- panel użytkownika
├── styles.css          <- stylizacja interfejsu
├── db.php              <- połączenie z bazą danych
├── login.php           <- obsługa logowania
├── logout.php          <- wylogowanie użytkownika
├── register.php        <- zapis nowego konta (jeśli używane)
└── test.php            <- test połączenia z bazą
```

---

## 🛠 Wymagania

- XAMPP (Apache + MySQL lub MariaDB)
- Przeglądarka (Chrome, Firefox)
- MySQL Workbench lub phpMyAdmin (do importu bazy)

---

## 🧱 Konfiguracja bazy danych

1. Uruchom MySQL w XAMPP
2. Otwórz phpMyAdmin lub Workbench
3. Utwórz nową bazę danych: `globe_travel`
4. Zaimportuj plik `globe_travel.sql`
5. Upewnij się, że port MySQL to `3307` lub `3308`

---

## ⚙️ Konfiguracja połączenia – `db.php`

```php
<?php
$host = "localhost";
$user = "root";
$password = "";
$dbname = "globe_travel";
$port = 3307;

$conn = new mysqli($host, $user, $password, $dbname, $port);
if ($conn->connect_error) {
    die("Błąd połączenia: " . $conn->connect_error);
}
?>
```

Zmodyfikuj port, jeśli używasz innego (np. `3306`, `3308`).

---

## 🚀 Uruchomienie

1. Umieść cały folder projektu w `C:/xampp/htdocs/globe_travel/`
2. W XAMPP uruchom:
   - Apache ✅
   - MySQL ✅
3. Otwórz w przeglądarce:

```
http://localhost/globe_travel/index.html
```

---

## 👤 Konto administratora

Aby nadać użytkownikowi rolę administratora, użyj w MySQL:

```sql
UPDATE uzytkownicy SET RolaID = 1 WHERE Email = 'admin@globe.com';
```

Użytkownik z `RolaID = 1` będzie przekierowany do `admin.html`.

---

## 🧪 Test połączenia z bazą

Aby sprawdzić połączenie z MySQL, otwórz w przeglądarce:

```
http://localhost/globe_travel/test.php
```

Powinieneś zobaczyć komunikat: `Połączono z bazą!`

---

## 👨‍💻 Autorzy

- Martynenko Mykhailo
- Vyshnovetskii Volodymyr
