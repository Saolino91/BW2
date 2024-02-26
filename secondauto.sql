CREATE DATABASE secondauto;

USE secondauto;

-- Tabella CONCESSIONARIA esistente
CREATE TABLE CONCESSIONARIA (
    ID_Concessionaria INT AUTO_INCREMENT,
    Città VARCHAR(50),
    Indirizzo VARCHAR(100),
    Telefono VARCHAR(15),
    Responsabile VARCHAR(100),
    PRIMARY KEY (ID_Concessionaria)
);

-- Tabella AUTO esistente
CREATE TABLE AUTO (
    Numero_Telaio VARCHAR(17) PRIMARY KEY,
    Marca VARCHAR(50),
    Targa VARCHAR(8),
    Colore VARCHAR(20),
    Cilindrata INT,
    Tipo_Cambio VARCHAR(10),
	ID_Concessionaria INT,
    FOREIGN KEY (ID_Concessionaria) REFERENCES CONCESSIONARIA(ID_Concessionaria)
);


-- Tabella PERSONE (precedentemente PROPRIETARI)
CREATE TABLE PERSONE (
    ID_Persona INT AUTO_INCREMENT,
    Nominativo VARCHAR(100),
    Città_Residenza VARCHAR(50),
    PRIMARY KEY (ID_Persona)
);

SELECT *
FROM VENDITE

-- Tabella ACQUISTI
CREATE TABLE ACQUISTI (
    ID_Acquisto INT AUTO_INCREMENT,
    ID_Persona INT,
    Numero_Telaio VARCHAR(17),
    ID_Concessionaria INT,
    Data_Acquisto DATE,
    Prezzo_Acquisto DECIMAL(10, 2),
    PRIMARY KEY (ID_Acquisto),
    FOREIGN KEY (ID_Persona) REFERENCES PERSONE(ID_Persona),
    FOREIGN KEY (Numero_Telaio) REFERENCES AUTO(Numero_Telaio),
    FOREIGN KEY (ID_Concessionaria) REFERENCES CONCESSIONARIA(ID_Concessionaria)
);


-- Tabella VENDITE
CREATE TABLE VENDITE (
    ID_Vendita INT AUTO_INCREMENT,
    ID_Persona INT,
    Numero_Telaio VARCHAR(17),
    ID_Concessionaria INT,
    Data_Vendita DATE,
    Prezzo_Vendita DECIMAL(10, 2),
    PRIMARY KEY (ID_Vendita),
    FOREIGN KEY (ID_Persona) REFERENCES PERSONE(ID_Persona),
    FOREIGN KEY (Numero_Telaio) REFERENCES AUTO(Numero_Telaio),
    FOREIGN KEY (ID_Concessionaria) REFERENCES CONCESSIONARIA(ID_Concessionaria)
);

DROP TABLE VENDITE

SELECT *
FROM vendite v
JOIN auto au USING(Numero_Telaio)
JOIN acquisti a USING(Numero_Telaio)

SELECT *
FROM acquisti 
WHERE Numero_Telaio = "VIN51992"