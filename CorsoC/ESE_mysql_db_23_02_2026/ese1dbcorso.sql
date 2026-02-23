create database reparto_vendite;
use reparto_vendite;

create table clienti(
id int primary key auto_increment,
nome varchar(100),
cognome varchar(100),
email varchar(100),
eta INT,
citta varchar(100)
);

create table ordini(
id_ordine int primary key auto_increment,
data_ordine date,
importo decimal(10,2),
id_cliente int
);

INSERT INTO clienti (nome, cognome, email, eta, citta) VALUES
('Mario', 'Rossi', 'mario@gmail.com', 35, 'Roma'),
('Luca', 'Bianchi', 'luca@gmail.com', 22, 'Milano'),
('Elena', 'Verdi', 'elena@gmail.com', 40, 'Roma'),
('Anna', 'Neri', 'anna@gmail.com', 30, 'Napoli'),
('Paolo', 'Bruni', 'paolo@gmail.com', 45, 'Roma');

INSERT INTO ordini (data_ordine, importo, id_cliente) VALUES
('2024-01-10', 150.00, 1), -- Ordine di Mario
('2024-01-15', 50.00, 1),  -- Secondo ordine di Mario
('2024-02-01', 200.00, 3), -- Ordine di Elena
('2024-02-10', 99.99, 99); -- Ordine "ORFANO" (id cliente 99 non esiste)


-- Clienti Attivi (Usa INNER JOIN)
-- Mostra chi ha effettuato ordini, quanti e la spesa totale
SELECT c.nome, COUNT(o.id_ordine) AS totale_ordini, SUM(o.importo) AS spesa_totale
FROM clienti c
INNER JOIN ordini o ON c.id = o.id_cliente
GROUP BY c.id;

-- Clienti Inattivi 
SELECT c.nome, c.citta
FROM clienti c
LEFT JOIN ordini o ON c.id = o.id_cliente
WHERE o.id_ordine IS NULL;

SELECT o.id_ordine, o.data_ordine, o.importo, 'Cliente = NULL' AS stato
FROM clienti c
RIGHT JOIN ordini o ON c.id = o.id_cliente
WHERE c.id IS NULL;