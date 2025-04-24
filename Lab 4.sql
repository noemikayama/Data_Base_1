SHOW DATABASES;

USE bd1;

CREATE TABLE usuarios (
	id_usuario INT PRIMARY KEY,
    nome VARCHAR(150),
    email VARCHAR(150));

SHOW TABLES;
SELECT * FROM usuarios;

CREATE TABLE filmes (
	id_filme INT PRIMARY KEY,
    titulo VARCHAR(150),
    genero VARCHAR(150));

SHOW TABLES;
SELECT * FROM filmes;

CREATE TABLE assistidos (
	id_assistido INT PRIMARY KEY,
    id_usuario INT,
    id_filme INT,
    data_assistido DATE);

SHOW TABLES;
SELECT * FROM assistidos;

ALTER TABLE usuarios
ADD COLUMN idade INT;

SELECT * FROM usuarios;

ALTER TABLE assistidos
ADD FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario);

ALTER TABLE assistidos
ADD FOREIGN KEY (id_filme) REFERENCES filmes(id_filme);

/* 
ALTER TABLE <table_name>
ADD CONSTRAINTS <constraint_name> FOREIGN KEY <from> REFERENCES <to>;
*/

ALTER TABLE filmes
DROP COLUMN genero;

DELETE FROM usuarios WHERE id_usuario = 1;

INSERT INTO usuarios (id_usuario, nome, email, idade)
VALUES (1, 'João Silva', 'joao@email.com', 30);

INSERT INTO usuarios (id_usuario, nome, email, idade)
VALUES (2, 'Ana Lima', 'ana@email.com', 25);

ALTER TABLE filmes
ADD COLUMN genero VARCHAR(150);

INSERT INTO filmes (id_filme, titulo, genero)
VALUES (1, 'Matrix', 'Ficção Científica');

INSERT INTO filmes (id_filme, titulo, genero)
VALUES (2, 'A Orgigem', 'Ação');

INSERT INTO assistidos (id_assistido, id_usuario, id_filme, data_assistido)
VALUES (1, 1, 1, '2025-03-01');

INSERT INTO assistidos (id_assistido, id_usuario, id_filme, data_assistido)
VALUES (2, 2, 2, '2025-03-02');

SHOW CREATE TABLE assistidos;

CREATE TABLE `assistidos` (
  `id_assistido` int NOT NULL,
  `id_usuario` int DEFAULT NULL,
  `id_filme` int DEFAULT NULL,
  `data_assistido` date DEFAULT NULL,
  PRIMARY KEY (`id_assistido`),
  KEY `id_usuario` (`id_usuario`),
  KEY `id_filme` (`id_filme`),
  CONSTRAINT `assistidos_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`),
  CONSTRAINT `assistidos_ibfk_2` FOREIGN KEY (`id_filme`) REFERENCES `filmes` (`id_filme`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

ALTER TABLE assistidos
DROP FOREIGN KEY assistidos_ibfk_2;

ALTER TABLE assistidos
DROP COLUMN id_filme;
    