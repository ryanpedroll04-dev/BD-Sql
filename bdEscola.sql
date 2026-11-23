--Ryan Pedro e Kaue Ormundo 1 ds

CREATE DATABASE bdEscola;

USE bdEscola;

CREATE TABLE tblperiodo (
    codperiodo INT NOT NULL PRIMARY KEY,
    nomeperiodo VARCHAR(20) NOT NULL
);

CREATE TABLE tblcurso (
    codcurso INT NOT NULL PRIMARY KEY,
    nomecurso VARCHAR(50) NOT NULL,
    cargahoraria INT NOT NULL,
    codperiodo INT NULL,
    CONSTRAINT fk_curso_periodo FOREIGN KEY (codperiodo) REFERENCES tblperiodo (codperiodo)
);

CREATE TABLE tblaluno (
    codaluno INT NOT NULL PRIMARY KEY,
    nomealuno VARCHAR(50) NOT NULL,
    datanascaluno  DATE NULL,
    ruaaluno VARCHAR(80) NULL,
    numcasaaluno VARCHAR(10) NULL,
    bairroaluno VARCHAR(50) NULL,
    telefonealuno VARCHAR(15) NULL
);

CREATE TABLE tblmatricula (
    codmatricula INT  NOT NULL PRIMARY KEY,
    datamatricula DATE NOT NULL,
    codaluno INT  NOT NULL,
    codcurso INT  NOT NULL,
    codperiodo INT  NOT NULL,
    CONSTRAINT fk_matricula_aluno FOREIGN KEY (codaluno) REFERENCES tblaluno (codaluno),
    CONSTRAINT fk_matricula_curso FOREIGN KEY (codcurso) REFERENCES tblcurso (codcurso),
    CONSTRAINT fk_matricula_periodo FOREIGN KEY (codperiodo) REFERENCES tblperiodo (codperiodo)
);

INSERT INTO tblperiodo (codperiodo, nomeperiodo) VALUES
    (1, 'Manha'),
    (2, 'Tarde'),
    (3, 'Noite');

INSERT INTO tblcurso (codcurso, nomecurso, cargahoraria) VALUES
    (1, 'Ingles',   180),
    (2, 'Italiano', 180),
    (3, 'Espanhol', 180);

INSERT INTO tblaluno (codaluno, nomealuno) VALUES
    (1, 'Maria'),
    (2, 'Jose'),
    (3, 'Carlos'),
    (4, 'Henrique'),
    (5, 'Solange');

	INSERT INTO tblmatricula (codmatricula, datamatricula, codaluno, codcurso, codperiodo) VALUES
    (1, CAST(GETDATE() AS DATE), 1, 1, 1), 
    (2, CAST(GETDATE() AS DATE), 1, 3, 2), 
    (3, CAST(GETDATE() AS DATE), 2, 2, 3),
    (4, CAST(GETDATE() AS DATE), 3, 1, 3),
    (5, CAST(GETDATE() AS DATE), 3, 2, 2),
    (6, CAST(GETDATE() AS DATE), 4, 1, 2),
    (7, CAST(GETDATE() AS DATE), 4, 3, 1),
    (8, CAST(GETDATE() AS DATE), 4, 2, 3);

SELECT * FROM tblperiodo;
SELECT * FROM tblcurso;
SELECT * FROM tblaluno;
SELECT * FROM tblmatricula;

SELECT a.nomealuno, c.nomecurso, p.nomeperiodo
FROM tblaluno a
LEFT JOIN tblmatricula m ON m.codaluno = a.codaluno
LEFT JOIN tblcurso c ON c.codcurso = m.codcurso
LEFT JOIN tblperiodo p ON p.codperiodo = m.codperiodo
ORDER BY a.nomealuno;
