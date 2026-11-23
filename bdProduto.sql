--Ryan Pedro e Kaue Ormundo 1 ds
CREATE DATABASE bdProduto;

USE bdProduto;

CREATE TABLE tblProduto (
    codProduto INT NOT NULL PRIMARY KEY,
    nomeProduto VARCHAR(50) NOT NULL,
    valorProduto DECIMAL(10,2) NOT NULL,
    qtdeProduto INT NOT NULL
);

CREATE TABLE tblCliente (
    codCliente INT NOT NULL PRIMARY KEY,
    nomeCliente VARCHAR(50) NOT NULL,
    cpfCliente VARCHAR(14) NOT NULL,
    telCliente VARCHAR(15) NULL
);

CREATE TABLE tblVenda (
    codVenda INT  NOT NULL PRIMARY KEY,
    dataVenda DATE NOT NULL,
    codCliente INT  NOT NULL,
    CONSTRAINT fk_venda_cliente FOREIGN KEY (codCliente) REFERENCES tblCliente (codCliente)
);


CREATE TABLE tblItensVenda (
    codVenda INT NOT NULL,
    codPro INT NOT NULL,
    qtdeItem  INT NOT NULL,
    CONSTRAINT pk_itensvenda PRIMARY KEY (codVenda, codPro),
    CONSTRAINT fk_itens_venda FOREIGN KEY (codVenda) REFERENCES tblVenda (codVenda),
    CONSTRAINT fk_itens_produto FOREIGN KEY (codPro) REFERENCES tblProduto (codProduto)
);

INSERT INTO tblProduto (codProduto, nomeProduto, valorProduto, qtdeProduto) VALUES
    (1, 'Danoninho',   1.00, 1000),
    (2, 'Toddynho',    1.50, 1200),
    (3, 'Polenghinho', 0.90, 1300),
    (4, 'Chambinho',   1.20,  900),
    (5, 'Moranguinho', 0.95,  700);

INSERT INTO tblCliente (codCliente, nomeCliente, cpfCliente, telCliente) VALUES
    (1, 'Maria',  '123.456.789-00', '2133-2292'),
    (2, 'Andre',  '456.563.903-93', '2122-3047'),
    (3, 'Sergio', '789.012.354-90', '2342-9309'),
    (4, 'Clara',  '012.345.292-99', '2189-0090'),
    (5, 'Monica', '345.689.343-00', '2312-2829');

INSERT INTO tblVenda (codVenda, dataVenda, codCliente) VALUES
    (1, '2016-02-10', 1),
    (2, '2016-02-11', 1),
    (3, '2016-02-12', 2),
    (4, '2016-02-12', 3),
    (5, '2016-02-13', 2);

INSERT INTO tblItensVenda (codVenda, codPro, qtdeItem) VALUES
    (1, 1, 18),
    (1, 2, 23),
    (2, 1, 80),
    (3, 4, 25),
    (3, 1, 24);

SELECT * FROM tblProduto;
SELECT * FROM tblCliente;
SELECT * FROM tblVenda;
SELECT * FROM tblItensVenda;
