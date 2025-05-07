USE bd1;

CREATE TABLE cliente (
	id_cliente INT PRIMARY KEY AUTO_INCREMENT,
	cpf VARCHAR(14) UNIQUE NOT NULL,
	nome VARCHAR(100) NOT NULL,
	email VARCHAR(100),
	telefone VARCHAR(20),
	cidade VARCHAR(50),
	idade INT);

CREATE TABLE veiculo(
	id_veiculo INT PRIMARY KEY AUTO_INCREMENT,
    chassi VARCHAR(20) UNIQUE NOT NULL,
    modelo VARCHAR(50) NOT NULL,
    marca VARCHAR(50) NOT NULL,
    ano INT,
    preco DECIMAL(10,2),
    cor VARCHAR(30),
    vendido BOOLEAN DEFAULT FALSE);

CREATE TABLE vendas(
	id_venda INT PRIMARY KEY AUTO_INCREMENT,
	id_cliente INT,
	id_veiculo INT,
	data_venda DATE);
    
ALTER TABLE vendas
ADD FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente);

ALTER TABLE vendas
ADD FOREIGN KEY (id_veiculo) REFERENCES veiculo(id_veiculo);


INSERT INTO cliente (cpf, nome, email, telefone, cidade, idade) VALUES
('111.111.111-11', 'João Silva', 'joao@email.com', '11999999999', 'São Paulo', 35),
('222.222.222-22', 'Ana Lima', 'ana@email.com', '11988888888', 'Campinas', 28),
('333.333.333-33', 'Carlos Souza', 'carlos@email.com', '11977777777', 'Sorocaba', 42),
('444.444.444-44', 'Bruna Dias', 'bruna@email.com', '11966666666', 'Jundiaí', 31),
('555.555.555-55', 'Tiago Ramos', 'tiago@email.com', '11955555555', 'Santos', 50),
('666.666.666-66', 'Lara Monteiro', 'lara@email.com', '11944444444', 'Guarulhos', 27),
('777.777.777-77', 'Marcos Paulo', 'marcos@email.com', '11933333333', 'São Paulo', 29),
('888.888.888-88', 'Beatriz Leal', 'beatriz@email.com', '11922222222', 'Campinas', 33),
('999.999.999-99', 'Rafael Nunes', 'rafael@email.com', '11911111111', 'Osasco', 38),
('000.000.000-00', 'Fernanda Rocha', 'fernanda@email.com', '11900000000', 'Sorocaba', 45);

INSERT INTO veiculo (chassi, modelo, marca, ano, preco, cor) VALUES
('CH001', 'Civic', 'Honda', 2020, 95000.00, 'Preto'),
('CH002', 'Corolla', 'Toyota', 2021, 98000.00, 'Branco'),
('CH003', 'Onix', 'Chevrolet', 2019, 65000.00, 'Prata'),
('CH004', 'HB20', 'Hyundai', 2020, 72000.00, 'Vermelho'),
('CH005', 'Gol', 'Volkswagen', 2018, 58000.00, 'Cinza'),
('CH006', 'Argo', 'Fiat', 2021, 70000.00, 'Azul'),
('CH007', 'Ka', 'Ford', 2019, 60000.00, 'Branco'),
('CH008', 'Tracker', 'Chevrolet', 2022, 120000.00, 'Preto'),
('CH009', 'Renegade', 'Jeep', 2021, 110000.00, 'Verde'),
('CH010', 'Fusion', 'Ford', 2017, 85000.00, 'Prata');

/* Exercicio 1 */
UPDATE cliente
SET telefone = '11988887777'
WHERE cpf = '333.333.333-33';

/* Exercício 2 */
UPDATE veiculo
SET vendido = TRUE
WHERE chassi = 'CH001';

/* Exercício 3 */
INSERT INTO vendas (id_cliente, id_veiculo, data_venda)
VALUES (1, 1, '2025-05-03');

/* Exercício 4 */
UPDATE veiculo
SET preco = preco * 1.10
WHERE marca = 'Chevrolet' AND id_veiculo = 3;

SELECT*FROM veiculo;

SHOW CREATE TABLE veiculo;

CREATE TABLE `veiculo` (
  `id_veiculo` int NOT NULL AUTO_INCREMENT,
  `chassi` varchar(20) NOT NULL,
  `modelo` varchar(50) NOT NULL,
  `marca` varchar(50) NOT NULL,
  `ano` int DEFAULT NULL,
  `preco` decimal(10,2) DEFAULT NULL,
  `cor` varchar(30) DEFAULT NULL,
  `vendido` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id_veiculo`),
  UNIQUE KEY `chassi` (`chassi`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/* Exercício 5 */
UPDATE cliente
SET cidade = 'São Paulo'
WHERE idade > 40;

/* Exercício 6 */
DELETE FROM cliente
WHERE cpf = '000.000.000-00';

SELECT*FROM cliente;

/* Exercício 7 */
DELETE FROM veiculo
WHERE ano < 2020;

/* Exercício 8 */
UPDATE veiculo
SET cor = 'Grafite'
WHERE marca = 'Ford';

SELECT*FROM veiculo;

SELECT*FROM vendas;

/* Exercício 9 */
DELETE FROM vendas
WHERE data_venda < '2024-01-01';

/* Exercício 10 */
SHOW CREATE TABLE vendas;

CREATE TABLE `vendas` (
  `id_venda` int NOT NULL AUTO_INCREMENT,
  `id_cliente` int DEFAULT NULL,
  `id_veiculo` int DEFAULT NULL,
  `data_venda` date DEFAULT NULL,
  PRIMARY KEY (`id_venda`),
  KEY `id_cliente` (`id_cliente`),
  KEY `id_veiculo` (`id_veiculo`),
  CONSTRAINT `vendas_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`),
  CONSTRAINT `vendas_ibfk_2` FOREIGN KEY (`id_veiculo`) REFERENCES `veiculo` (`id_veiculo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

TRUNCATE TABLE vendas;