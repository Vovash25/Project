-- ================================
--  BAZA DANYCH: GLOBE_TRAVEL
--  SYSTEM REZERWACJI BIURA PODRÓŻY
-- ================================

CREATE DATABASE IF NOT EXISTS GLOBE_TRAVEL CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE GLOBE_TRAVEL;
SHOW TABLES;
SELECT * FROM uzytkownicy;

-- ================================
-- 1. Tabela: Role
-- ================================
CREATE TABLE Role (
    RolaID INT PRIMARY KEY AUTO_INCREMENT,
    Nazwa VARCHAR(50) UNIQUE NOT NULL
);

-- ================================
-- 2. Tabela: Uzytkownicy
-- ================================
CREATE TABLE Uzytkownicy (
    UzytkownikID INT PRIMARY KEY AUTO_INCREMENT,
    Email VARCHAR(100) UNIQUE NOT NULL,
    Haslo VARCHAR(255) NOT NULL,
    RolaID INT NOT NULL,
    UUID CHAR(36) UNIQUE NOT NULL DEFAULT (UUID()),
    DataUtworzenia DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (RolaID) REFERENCES Role(RolaID)
);

-- ================================
-- 3. Tabela: Klienci
-- ================================
CREATE TABLE Klienci (
    KlientID INT PRIMARY KEY AUTO_INCREMENT,
    Imie VARCHAR(50) NOT NULL,
    Nazwisko VARCHAR(50) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    Telefon VARCHAR(15),
    DataRejestracji DATE NOT NULL
);

-- ================================
-- 4. Tabela: Pracownicy
-- ================================
CREATE TABLE Pracownicy (
    PracownikID INT PRIMARY KEY AUTO_INCREMENT,
    Imie VARCHAR(50) NOT NULL,
    Nazwisko VARCHAR(50) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    Stanowisko VARCHAR(50) NOT NULL,
    DataZatrudnienia DATE NOT NULL
);

-- ================================
-- 5. Tabela: Wycieczki
-- ================================
CREATE TABLE Wycieczki (
    WycieczkaID INT PRIMARY KEY AUTO_INCREMENT,
    NazwaWycieczki VARCHAR(100) NOT NULL,
    Lokalizacja VARCHAR(100) NOT NULL,
    Cena DECIMAL(10,2) NOT NULL CHECK (Cena > 0),
    DataRozpoczecia DATE NOT NULL,
    DataZakonczenia DATE NOT NULL,
    CHECK (DataZakonczenia > DataRozpoczecia)
);

-- ================================
-- 6. Tabela: Rezerwacje
-- ================================
CREATE TABLE Rezerwacje (
    RezerwacjaID INT PRIMARY KEY AUTO_INCREMENT,
    KlientID INT NOT NULL,
    WycieczkaID INT NOT NULL,
    DataRezerwacji DATE NOT NULL,
    Status VARCHAR(20) NOT NULL CHECK (Status IN ('Oczekujaca', 'Zatwierdzona', 'Anulowana')),
    FOREIGN KEY (KlientID) REFERENCES Klienci(KlientID),
    FOREIGN KEY (WycieczkaID) REFERENCES Wycieczki(WycieczkaID)
);

-- ================================
-- 7. Tabela: Platnosci
-- ================================
CREATE TABLE Platnosci (
    PlatnoscID INT PRIMARY KEY AUTO_INCREMENT,
    RezerwacjaID INT NOT NULL,
    Kwota DECIMAL(10,2) NOT NULL CHECK (Kwota > 0),
    DataPlatnosci DATE NOT NULL,
    MetodaPlatnosci VARCHAR(50) NOT NULL CHECK (MetodaPlatnosci IN ('Karta', 'Przelew', 'Gotowka')),
    FOREIGN KEY (RezerwacjaID) REFERENCES Rezerwacje(RezerwacjaID)
);

-- ================================
-- 8. Tabela: Logi
-- ================================
CREATE TABLE Logi (
    LogID INT PRIMARY KEY AUTO_INCREMENT,
    UzytkownikID INT NOT NULL,
    Akcja VARCHAR(255) NOT NULL,
    Szczegoly TEXT,
    DataCzas DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (UzytkownikID) REFERENCES Uzytkownicy(UzytkownikID)
);

-- ================================
-- 9. Tabela: Powiadomienia
-- ================================
CREATE TABLE Powiadomienia (
    PowiadomienieID INT PRIMARY KEY AUTO_INCREMENT,
    UzytkownikID INT NOT NULL,
    Tytul VARCHAR(100) NOT NULL,
    Tresc TEXT NOT NULL,
    DataWyslania DATETIME DEFAULT CURRENT_TIMESTAMP,
    Stan ENUM('Przeczytane', 'Nieprzeczytane') DEFAULT 'Nieprzeczytane',
    FOREIGN KEY (UzytkownikID) REFERENCES Uzytkownicy(UzytkownikID)
);

-- ================================
-- 10. Wstępne dane do tabeli Role
-- ================================
INSERT INTO Role (Nazwa) VALUES
('Admin'),
('Agent'),
('Klient');

-- Przyklad administratora
INSERT INTO Uzytkownicy (Email, Haslo, RolaID)
VALUES ('admin@globe.com', '1234adminHASH', 1); -- 1 = Admin

INSERT INTO Uzytkownicy (Email, Haslo, RolaID)
VALUES ('user@globe.com', 'user123', 3);

INSERT INTO uzytkownicy (Email, Haslo, RolaID)
VALUES ('user1@globe.com', '$2y$10$jeVL3GcyuKwK9vX0sY9JBOnZ2cfECav.Q6ZT9vbmD/Rn.B2I.D/MW', 3);

UPDATE uzytkownicy 
SET Haslo = 'admin123' 
WHERE Email = 'admin@globe.com';



