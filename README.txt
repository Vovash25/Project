# 🌐 Globe Travel – System rezerwacji wycieczek

Kompletny projekt strony internetowej do zarządzania wycieczkami z rozróżnieniem ról użytkowników.

---

## 📌 Funkcjonalności

- Rejestracja użytkowników (rola domyślna: klient)
- Logowanie z przekierowaniem w zależności od roli (admin lub użytkownik)
- Panel administratora z możliwością podglądu danych
- Panel użytkownika z rezerwacjami
- Obsługa sesji i wylogowania

---

## 📁 Struktura projektu

```
globe_travel/
├── index.html          <- strona logowania
├── register.html       <- formularz rejestracji
├── admin.html          <- panel administratora
├── Rezerw.html         <- panel użytkownika
├── styles.css          <- stylizacja globalna
├── db.php              <- konfiguracja bazy danych
├── login.php           <- obsługa logowania
├── register.php        <- obsługa rejestracji
├── logout.php          <- wylogowanie
└── test.php            <- test połączenia z bazą
```

---

## 🛠 Wymagania

- **XAMPP** (Apache + MySQL)
- **MySQL Workbench** lub **phpMyAdmin**
- Przeglądarka

---

## 🔧 Konfiguracja bazy danych

1. Uruchom `phpMyAdmin` lub `MySQL Workbench`
2. Stwórz bazę danych o nazwie: `globe_travel`
3. Zaimportuj strukturę z pliku `globe_travel.sql`
4. Upewnij się, że port bazy danych to `3307` lub `3308`

---

## ⚙️ Konfiguracja pliku `db.php`

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

Zmień port `3307` jeśli używasz innego.

---

## 🚀 Uruchomienie aplikacji

1. Skopiuj folder `globe_travel/` do `C:/xampp/htdocs/`
2. W XAMPP uruchom:
   - Apache ✅
   - MySQL ✅ (jeśli baza działa lokalnie)
3. Otwórz przeglądarkę i wpisz:

```
http://localhost/globe_travel/index.html
```

---

## 👤 Konto administratora

Możesz ręcznie ustawić użytkownika jako administratora:

```sql
UPDATE uzytkownicy SET RolaID = 1 WHERE Email = 'admin@globe.com';
```

---

## 🧪 Test połączenia z bazą

Otwórz:
```
http://localhost/globe_travel/test.php
```

Powinieneś zobaczyć komunikat `Połączono z bazą!`

---

## 📄 Autorzy
Martynenko Mykhailo
Vyshnovetskii Volodymyr
