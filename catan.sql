DROP DATABASE IF EXISTS catan;
CREATE DATABASE catan;

USE catan;

CREATE TABLE Jugador (
    id INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(20) NOT NULL UNIQUE,
    pass VARCHAR(20),
    PRIMARY KEY (id)
)ENGINE=InnoDB;

CREATE TABLE Partida (
    id INT NOT NULL AUTO_INCREMENT,
    fechahora VARCHAR(16),
    duracion INT,
    ganador INT,
    PRIMARY KEY (id),
    FOREIGN KEY (ganador) REFERENCES Jugador(id)
)ENGINE=InnoDB;

CREATE TABLE Participacion (
    idJ INT NOT NULL,
    idP INT NOT NULL,
    puntos INT DEFAULT 0,
    PRIMARY KEY (idJ, idP),
    FOREIGN KEY (idJ) REFERENCES Jugador(id),
    FOREIGN KEY (idP) REFERENCES Partida(id)
)ENGINE=InnoDB;

INSERT INTO Jugador VALUES (0, 'Jonathan', 'jonathan123');
INSERT INTO Jugador VALUES (0, 'Alba', '00albieta');
INSERT INTO Jugador VALUES (0, 'Raul', '123456');
INSERT INTO Jugador VALUES (0, 'Manuel', 'manu56');
INSERT INTO Jugador VALUES (0, 'Fernando', 'muchasrisas');

INSERT INTO Partida VALUES (0, '09/07/2019 13:30', 75, 2);
INSERT INTO Partida VALUES (0, '09/07/2019 22:00', 62, 1);
INSERT INTO Partida VALUES (0, '10/08/2020 11:15', 80, 0);

INSERT INTO Participacion VALUES (3, 1, 7);
INSERT INTO Participacion VALUES (2, 1, 6);
INSERT INTO Participacion VALUES (4, 1, 3);
INSERT INTO Participacion VALUES (5, 1, 4);

INSERT INTO Participacion VALUES (3, 2, 4);
INSERT INTO Participacion VALUES (2, 2, 7);
INSERT INTO Participacion VALUES (1, 2, 6);

INSERT INTO Participacion VALUES (1, 3, 7);
INSERT INTO Participacion VALUES (2, 3, 5);
INSERT INTO Participacion VALUES (5, 3, 4);

