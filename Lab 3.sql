CREATE TABLE medico ( crm INT PRIMARY KEY, nome VARCHAR(100) NOT NULL,
especialidade VARCHAR(100), telefone VARCHAR(15));
CREATE TABLE paciente ( cpf INT PRIMARY KEY, nome VARCHAR(100) NOT NULL, data_nasc DATE,
telefone VARCHAR(15));
CREATE TABLE consulta ( numero INT PRIMARY KEY, data_consulta DATE, descricao TEXT,
prescricao TEXT, crm int, cpf int, foreign key (crm) references medico(crm),
foreign key (cpf) references paciente(cpf));
ALTER TABLE medico ADD COLUMN email VARCHAR(100) UNIQUE;
ALTER TABLE medico MODIFY COLUMN especialidade VARCHAR(120);

SHOW DATABASES;
 SHOW TABLES;
SELECT*FROM medico;
SELECT*FROM paciente;
 
INSERT INTO medico (crm, nome, especialidade, telefone, email) 
VALUES (101, 'Carlos Silva', 'Cardiologia', 11999999999, 'carlos@email.com');

INSERT INTO medico (crm, nome, especialidade, telefone, email)
VALUES (102, 'Ana Souza', 'Dermatologia', 11988888888, 'ana@email.com');

ALTER TABLE paciente
ADD COLUMN endereco VARCHAR(150);

INSERT INTO paciente (cpf, nome, data_nasc, telefone, endereco)
VALUES (1001, 'João Pereira', '1985-05-20', '11966666666', 'Rua A, 123');

INSERT INTO paciente (cpf, nome, data_nasc, telefone, endereco)
VALUES (1002, 'Maria Oliveira', '1985-05-20', '11966666666', 'Rua B, 123');

INSERT INTO consulta
VALUES (1, '2024-03-02', 'Check Geral', 'Tomar vitaminas', 101, 1001);

INSERT INTO consulta
VALUES (2, '2024-05-21', 'Dor no joelho', 'Fisioterapia', 101, 1002);

INSERT INTO consulta
VALUES (3, '2024-06-14', 'Lesão ombro', 'Dipirona', 102, 1001);

INSERT INTO consulta
VALUES (4, '2024-09-17', 'Acompanhamento', 'Reduzir sal', 102, 1002);

SELECT * FROM consulta;
SHOW CREATE TABLE consulta;

CREATE TABLE `consulta` (
  `numero` int NOT NULL,
  `data_consulta` date DEFAULT NULL,
  `descricao` text,
  `prescricao` text,
  `crm` int DEFAULT NULL,
  `cpf` int DEFAULT NULL,
  PRIMARY KEY (`numero`),
  KEY `crm` (`crm`),
  KEY `cpf` (`cpf`),
  CONSTRAINT `consulta_ibfk_1` FOREIGN KEY (`crm`) REFERENCES `medico` (`crm`),
  CONSTRAINT `consulta_ibfk_2` FOREIGN KEY (`cpf`) REFERENCES `paciente` (`cpf`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

UPDATE medico
SET telefone = '11911111111'
WHERE crm = 101;

CREATE TABLE convenio (id INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(100) NOT NULL,
telefone VARCHAR(15));

SELECT*FROM convenio;

ALTER TABLE paciente
ADD COLUMN convenio_id INT;

ALTER TABLE paciente
ADD FOREIGN KEY (convenio_id) REFERENCES convenio(id);

CREATE TABLE hospital (id INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(100) NOT NULL,
cidade VARCHAR(50), estado VARCHAR(2));


ALTER TABLE consulta
ADD COLUMN hospital_id INT;

ALTER TABLE consulta
ADD FOREIGN KEY (hospital_id) REFERENCES hospital(id);

CREATE TABLE especialidade (id INT PRIMARY KEY AUTO_INCREMENT,
descricao VARCHAR(50) NOT NULL);

ALTER TABLE medico
ADD COLUMN especialidade_id INT;

ALTER TABLE medico
ADD FOREIGN KEY (especialidade_id) REFERENCES especialidade(id);

ALTER TABLE especialidade
MODIFY COLUMN descricao VARCHAR(100);

ALTER TABLE hospital
DROP COLUMN estado;

ALTER TABLE hospital
RENAME TO unidade_saude;

ALTER TABLE convenio
ADD COLUMN status VARCHAR(20) default 'Ativo';




 