show databases;
create database db4444;
use db4444;
show tables;
CREATE TABLE alunos (nome VARCHAR(100), RA INT PRIMARY KEY, curso VARCHAR(100));
INSERT INTO alunos (nome, RA, curso) VALUES ('Noemi Kayama', 25004140, 'ESW');
INSERT INTO alunos (nome, RA, curso) VALUES ('Fulano', 123456789, 'ESW');
SELECT * FROM alunos;
DELETE FROM alunos WHERE RA = 123456789;
CREATE TABLE disciplinas (Nome_do_professor VARCHAR(100), Disciplina VARCHAR(150) PRIMARY KEY, Ano INT);
SHOW TABLES;
INSERT INTO disciplinas (Nome_do_professor, Disciplina, Ano) VALUES ('Joice', 'Experimentos Práticos de Banco de Dados', 2025);
SELECT*FROM disciplinas;
INSERT INTO disciplinas (Nome_do_professor, Disciplina, Ano) VALUES ('Marcelo Chacon', 'Projeto Integrador - I', 2025);
DELETE FROM disciplinas WHERE Disciplina = 'Projeto Integrador - I';

