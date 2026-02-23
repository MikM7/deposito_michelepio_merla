CREATE DATABASE IF NOT EXISTS gestione_libreria;
USE gestione_libreria;

CREATE TABLE IF NOT EXISTS Libri (
    id INT PRIMARY KEY AUTO_INCREMENT,
    titolo VARCHAR(100),
    autore VARCHAR(100),
    genere VARCHAR(50),
    anno_pubblicazione INT,
    prezzo DECIMAL(6,2)
);

CREATE TABLE IF NOT EXISTS Vendite (
    id INT PRIMARY KEY AUTO_INCREMENT,
    id_libro INT,
    data_vendita DATE,
    quantita INT,
    negozio VARCHAR(100)
);

INSERT INTO Libri (titolo, autore, genere, anno_pubblicazione, prezzo) VALUES
('It', 'Stephen King', 'Horror', 1986, 20.00),
('Shining', 'Stephen King', 'Horror', 1977, 18.50),
('Il Signore degli Anelli', 'J.R.R. Tolkien', 'Fantasy', 1954, 30.00),
('Harry Potter', 'J.K. Rowling', 'Fantasy', 1997, 15.00),
('Il nome della rosa', 'Umberto Eco', 'Giallo', 1980, 12.00),
('Dieci piccoli indiani', 'Agatha Christie', 'Giallo', 1939, 10.00),
('22/11/63', 'Stephen King', 'Fantasy', 2011, 22.00),
('Il codice Da Vinci', 'Dan Brown', 'Giallo', 2003, 14.00),
('Cronache del ghiaccio', 'G.R.R. Martin', 'Fantasy', 1996, 25.00),
('Carrie', 'Stephen King', 'Horror', 1974, 11.00),
('Il Silmarillion', 'J.R.R. Tolkien', 'Fantasy', 1977, 20.00),
('Misery', 'Stephen King', 'Horror', 1987, 16.00),
('Dracula', 'Bram Stoker', 'Horror', 1897, 9.00),
('L''ombra dello scorpione', 'Stephen King', 'Horror', 1978, 24.00),
('Sotto cupola', 'Stephen King', 'Fantasy', 2009, 19.00),
('Cujo', 'Stephen King', 'Horror', 1981, 13.00),
('Pet Sematary', 'Stephen King', 'Horror', 1983, 15.00),
('Cell', 'Stephen King', 'Horror', 2006, 14.00),
('Joyland', 'Stephen King', 'Giallo', 2013, 12.00),
('The Dome', 'Stephen King', 'Fantasy', 2009, 21.00),
('La zona morta', 'Stephen King', 'Horror', 1979, 14.00),
('Christine', 'Stephen King', 'Horror', 1983, 16.00),
('Mucchio d''ossa', 'Stephen King', 'Giallo', 1998, 15.00),
('Il gioco di Gerald', 'Stephen King', 'Horror', 1992, 13.00),
('Duma Key', 'Stephen King', 'Horror', 2008, 17.00),
('La storia di Lisey', 'Stephen King', 'Fantasy', 2006, 16.00),
('Revival', 'Stephen King', 'Horror', 2014, 18.00),
('Fine turno', 'Stephen King', 'Giallo', 2016, 19.00),
('Chi perde paga', 'Stephen King', 'Giallo', 2015, 18.00),
('Mr. Mercedes', 'Stephen King', 'Giallo', 2014, 17.00);

INSERT INTO Vendite (id_libro, data_vendita, quantita, negozio) VALUES
(1, '2021-05-10', 2, 'Libreria Centrale'),
(2, '2022-06-15', 1, 'BookCity Milano'),
(3, '2020-01-20', 3, 'Cartoleria Roma'),
(1, '2022-12-01', 1, 'King Store'),
(5, '2021-08-11', 2, 'Libreria Centrale'),
(10, '2022-02-14', 5, 'Book Store'),
(999, '2021-03-20', 1, 'Book Store'), -- Esempio Orfano
(28, '2023-01-10', 1, 'Store Online'),
(29, '2022-11-20', 2, 'Libreria Centrale'),
(30, '2021-09-05', 1, 'BookCity Milano'),
(7, '2020-10-10', 4, 'Cartoleria Roma'),
(12, '2021-07-22', 1, 'King Store'),
(15, '2022-05-30', 2, 'Store Centrale'),
(20, '2021-12-25', 1, 'Book Store'),
(25, '2022-04-18', 3, 'Libreria Centrale'),
(1, '2021-01-01', 1, 'Book Store'),
(2, '2020-05-05', 2, 'Libreria Centrale'),
(3, '2022-08-08', 1, 'King Store'),
(4, '2021-09-09', 3, 'BookCity Milano'),
(5, '2020-11-11', 1, 'Cartoleria Roma'),
(6, '2022-02-02', 2, 'Libreria Centrale'),
(7, '2021-03-03', 1, 'Book Store'),
(8, '2020-04-04', 1, 'King Store'),
(9, '2022-05-05', 4, 'BookCity Milano'),
(10, '2021-06-06', 2, 'Cartoleria Roma'),
(11, '2020-07-07', 1, 'Libreria Centrale'),
(12, '2022-08-08', 3, 'Book Store'),
(13, '2021-09-09', 1, 'King Store'),
(14, '2020-10-10', 2, 'BookCity Milano'),
(15, '2022-11-11', 1, 'Cartoleria Roma');


-- Esercizio 1: INNER JOIN + WHERE + LIKE (Autore "King")
SELECT l.titolo, l.autore, v.data_vendita, v.negozio
FROM Libri l
INNER JOIN Vendite v ON l.id = v.id_libro
WHERE l.autore LIKE '%King%';

-- Esercizio 2: LEFT JOIN + WHERE + BETWEEN (Pubblicati 2000-2010)
SELECT l.titolo, l.anno_pubblicazione, l.prezzo, v.data_vendita
FROM Libri l
LEFT JOIN Vendite v ON l.id = v.id_libro
WHERE l.anno_pubblicazione BETWEEN 2000 AND 2010;

