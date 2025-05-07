USE bd1;

CREATE TABLE produtos (
id_produto INT PRIMARY KEY,
nome VARCHAR(100),
preco DECIMAL(10,2),
categoria VARCHAR(50)
);
INSERT INTO produtos VALUES
(1, 'Notebook', 3500.00, 'Informática'),
(2, 'Mouse', 80.00, 'Acessórios'),
(3, 'Teclado', 150.00, 'Acessórios'),
(4, 'Monitor', 1200.00, 'Informática'),
(5, 'Cadeira Gamer', 850.00, 'Móveis');

SELECT * FROM produtos ;

SELECT nome, preco FROM produtos;

/* Só troca o nome da coluna na EXIBIÇÃO! */
SELECT nome AS produto, preco AS valor FROM produtos;

SELECT p.nome AS produto_nome, p.preco AS valor FROM produtos AS p;

SELECT p.nome AS item, p.categoria AS tipo FROM produtos AS p;

SELECT nome AS item, preco AS preco_final FROM produtos;

SELECT nome, categoria FROM produtos AS estoque;

UPDATE produtos 
SET preco = preco * 1.10;

SELECT nome, preco AS preco_reajuste FROM produtos;