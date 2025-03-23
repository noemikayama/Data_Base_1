/* Show all of your databases */
SHOW DATABASES; 

/* Selects the database you want to use */
USE bd1; 

/* Creates a tasble in your data base */
CREATE TABLE Funcionarios (   /* Creates table Funcionarios (employees); Can skip lines within the parenteses; the command only ends with the closing parenteses and ";" */
	ID INT PRIMARY KEY AUTO_INCREMENT,  /* Creates a column ID that accepts integer values, is the primary key and auto increments (+1) */
    Nome VARCHAR(100) NOT NULL,   /* Creates a column Nome (name) that accepts VARCHAR values (top 100 characters) and is not null */
    Cargo VARCHAR(50) NOT NULL,    /* Creates a column Cargo (title) that accepts VARCHAR values (top 50 characteres) and is not null */
    Salario DECIMAL(10,2) NOT NULL   /* Creates a column Salario (salary) that accepts decimals with 10 digits and 2 decimal cases and is not null*/
    ); /* End of creating a table */

/* Shows graphically the table */
SELECT*FROM Funcionarios;
 
 /* Adds a column to the table */
ALTER TABLE Funcionarios
ADD COLUMN data_dmissao DATE NOT NULL;

/* Deletes cloumn from table */
ALTER TABLE Funcionarios
DROP COLUMN Cargo;

/* Modifies cloumn from the table; give paremeters */
ALTER TABLE Funcionarios
MODIFY COLUMN Salario DECIMAL (12,2) NOT NULL;

CREATE TABLE Departamentos (
	ID INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(100) NOT NULL
    );

SELECT*FROM Departamentos;

ALTER TABLE Funcionarios
ADD COLUMN Departamento_ID INT;

/* Adds foreign key to the table 
	ALTER TABLE <name of the table with the foreign key>
    ADD FOREIGN KEY <column of table of origin> REFERENCES <Table(cloumn)> */
ALTER TABLE Funcionarios
ADD FOREIGN KEY (Departamento_ID) REFERENCES Departamentos(ID); 

ALTER TABLE Departamentos
ADD COLUMN Orcamento DECIMAL(12,2);

/* Shows tables in the specific DB */
SHOW TABLES;

ALTER TABLE Departamentos
DROP COLUMN Orcamento;

ALTER TABLE Departamentos
MODIFY COLUMN Nome VARCHAR(150);

/* Renames table
	ALTER TALBE <original name>
    RENAME TO <new name> */
ALTER TABLE Departamentos
RENAME TO Setores;

SELECT*FROM Setores;

/* Will give an error because Departamento_ID is a foreign key */
ALTER TABLE Funcionarios
DROP COLUMN Departamento_ID;

/* Command to check the constraint of the foreing key created */
SHOW CREATE TABLE Funcionarios;

/* Copy paste of the information presented with the constraint name */
CREATE TABLE `Funcionarios` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Nome` varchar(100) NOT NULL,
  `Salario` decimal(12,2) NOT NULL,
  `data_dmissao` date NOT NULL,
  `Departamento_ID` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `Departamento_ID` (`Departamento_ID`),
  CONSTRAINT `funcionarios_ibfk_1` FOREIGN KEY (`Departamento_ID`) REFERENCES `Setores` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/* Deletes foreign key */
ALTER TABLE Funcionarios
DROP CONSTRAINT funcionarios_ibfk_1;

/* Now it will delete the column */
ALTER TABLE Funcionarios
DROP COLUMN Departamento_ID;

/* Deletes table */
DROP TABLE SETORES;

ALTER TABLE Funcionarios
ADD COLUMN Status VARCHAR(20)



