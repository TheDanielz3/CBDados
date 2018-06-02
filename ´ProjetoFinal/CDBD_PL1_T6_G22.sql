/*
CDBD_PL1_T6_G22
Sistema de Base de Dados para as urgências do "Hospital de Leiria" baseada na Triagem de Manchester
Daniel Batista, estudante Nº 2171836
Diogo Alpendre, estudante Nº 2170324
*/

-- Drop the database

 DROP DATABASE IF EXISTS triagem_hosp_leiria_g22_t6;

-- Criação da base de dados

 CREATE DATABASE triagem_hosp_leiria_g22_t6;
 
 -- Definir a tabela como default
 
 USE triagem_hosp_leiria_g22_t6;

-- Apaga as tabelas

DROP TABLE IF EXISTS utente;
DROP TABLE IF EXISTS enfermeiro;
DROP TABLE IF EXISTS sala;
DROP TABLE IF EXISTS triagem_manchester;
DROP TABLE IF EXISTS triagem;

-- Criação das tabelas

-- Tabela Utente

CREATE TABLE triagem_hosp_leiria_g22_t6.utente
(id INT AUTO_INCREMENT PRIMARY KEY, cc INT NOT NULL, nif INT(9) NOT NULL, nsns INT NOT NULL, nome_utente VARCHAR(20) NOT NULL, 
apelidos_utente VARCHAR(80) NOT NULL, data_nasc_utente DATE NOT NULL, morada_utente VARCHAR(100) NOT NULL, 
cod_postal_utente VARCHAR(50) NOT NULL, naturalidade_utente VARCHAR(100) NOT NULL, nacionalidade_utente VARCHAR(100) NOT NULL,
telemovel INT(9), email VARCHAR(100), tipo_sangue VARCHAR(3) NOT NULL, altura INT(3) NOT NULL, problemas_saude VARCHAR(500), medicacao VARCHAR(500), alergias VARCHAR(500),
sexo CHAR(1) NOT NULL, obs VARCHAR(500), UNIQUE(cc), UNIQUE(nif), UNIQUE(nsns), UNIQUE(telemovel), UNIQUE(email)); 

-- Tabela Enfermeiro

CREATE TABLE triagem_hosp_leiria_g22_t6.enfermeiro
(id INT AUTO_INCREMENT PRIMARY KEY, nome_enfermeiro VARCHAR(20) NOT NULL, apelidos_enfermeiro VARCHAR(80) NOT NULL, 
data_nasc_enfermeiro DATE NOT NULL, morada_enfermeiro VARCHAR(100) NOT NULL, cod_postal_enfermeiro VARCHAR(50) NOT NULL,  
naturalidade_enfermeiro VARCHAR(100) NOT NULL, nacionalidade_enfermeiro VARCHAR(100) NOT NULL, 
data_admissao DATE NOT NULL, ced_prof INT NOT NULL, sexo CHAR(1), obs VARCHAR(500), UNIQUE(ced_prof));

-- Tabela Sala

CREATE TABLE triagem_hosp_leiria_g22_t6.sala
(id INT AUTO_INCREMENT PRIMARY KEY, tipo VARCHAR(50) NOT NULL, obs VARCHAR(500));

-- Tabela Triagem de Manchester (armazena a cor e a descrição de cada cor)

CREATE TABLE triagem_hosp_leiria_g22_t6.triagem_manchester
(grau_prioridade VARCHAR(20) PRIMARY KEY, cor VARCHAR(8) NOT NULL, minutos_atendimento VARCHAR(50) NOT NULL, 
UNIQUE(grau_prioridade), UNIQUE(cor), UNIQUE(minutos_atendimento));

-- Tabela Triagem (processo em si)

 CREATE TABLE triagem_hosp_leiria_g22_t6.triagem
 (id INT AUTO_INCREMENT PRIMARY KEY, data_hora DATETIME NOT NULL, cor_triagem VARCHAR(10), 
 id_utente INT, id_enfermeiro INT, id_sala INT, obs VARCHAR(500), FOREIGN KEY (cor_triagem) REFERENCES triagem_manchester_info(cor),
 FOREIGN KEY (id_utente) REFERENCES utente(id), FOREIGN KEY (id_enfermeiro) REFERENCES enfermeiro(id), 
 FOREIGN KEY (id_sala) REFERENCES sala(id));

-- Tabela Material de Triagem (material presente nas salas)

CREATE TABLE triagem_hosp_leiria_g22_t6.material_triagem
(id INT AUTO_INCREMENT PRIMARY KEY, nome VARCHAR(100) NOT NULL, quantidade INT NOT NULL, obs VARCHAR(500), id_sala INT,
FOREIGN KEY (id_sala) REFERENCES sala(id));

-- Tabela Limpeza de salas (armazena informação sobre as limpezas efetuadas e as respetivas salas)

CREATE TABLE triagem_hosp_leiria_g22_t6.limpezas
(id INT AUTO_INCREMENT PRIMARY KEY, data_hora DATETIME NOT NULL, descricao VARCHAR(500), id_sala INT,
FOREIGN KEY (id_sala) REFERENCES sala(id));

 -- Inserir dados na tabela utente
 
 INSERT INTO triagem_hosp_leiria_g22_t6.utente (id, cc, nif, nsns, nome_utente, apelidos_utente, data_nasc_utente, morada_utente, cod_postal_utente,
 naturalidade_utente, nacionalidade_utente, telemovel, email, tipo_sangue, altura, problemas_saude, medicacao, alergias, sexo, obs)
 VALUES
 (null, 13847293, 278593734, 17485968, "António", "Duarte Arnaut", STR_TO_DATE('2000-10-20', '%Y-%m-%d'), "Rua da Cumeeira", "1563-345 Coimbra", "Portugal",
 "Portuguesa", 964738271, "antonio_arnaut@gmail.com", "A+", 165, "Cataratas em fase 2", "Gotas Robomil", "Pêssego", "M", "Considerado o pai do Serviço Nacional de Saúde (SNS)"),
 (null, 15757648, 987849824, 18384923, "Daniel", "Correia Batista", STR_TO_DATE('1998-07-24', '%Y-%m-%d'), "Rua da Marinha Grande", "2430-528 Marinha Grande", 
 "Portugal", "Portuguesa", 919090978, "danielc.batista98@gmail.com", "A+", 182, null, null, null, "M", null),
 (null, 18488943, 983823832, 29244358, "Diogo", "Cruz Alpendre", STR_TO_DATE('1999-03-04', '%Y-%m-%d'), "Rua do Casulo", "2865-345 Lisboa", "Portugal", "Portuguesa",
926019922, "dalpendre1999@gmail.com", "O+", 170 , "Rinite Alérgica", "Nasomet spray nasal", "Rinite", "M", "Se não tomar medicamento, fica doente"),
(null, 19348383, 927374743, 298483048, "João", "da Silva Pereira", STR_TO_DATE('1970-09-12', '%Y-%m-%d'), "Rua de Lisboa", "2859-374 Braga", 
"Portugal", "Portuguesa", 933881568, "joao.pereira@gmail.com", "O-", 155, null, null, "Bananas", "M", "Não pode comer, tocar e cheirar bananas"),
(null, 19329399, 918938495, 193424349, "Manuela", "Rodrigues Alves", STR_TO_DATE('1975-06-02', '%Y-%m-%d'), "Rua de Braga", "2948-225 Braga", "Portugal", "Portuguesa",
933456758, "manuela.rodrigues.alves@outlook.com", "A+", 190, null, null, null, "F", "Teve asma até aos 10 anos"),
(null, 14232134, 24567831, 412345456, "Fernando", "Dos Olivais", STR_TO_DATE('2001-09-10', '%Y-%m-%d'), "Rua das Pipas Brancas", "1274-521 Alentejo", "Portugal", "Portuguesa",
986262654, "fernando.olival@portugalmail.pt", "A-", 170, null, null, null, "M", null),
(null, 36038320, 98236519, 14741873, "João", "Manuel Da Silva Dos Santos Cruzados", STR_TO_DATE('2005-03-01', '%Y-%m-%d'), "Rua do Dr Alberto", "2135-515 Beja" , "Portugal", "Portuguesa",
985252632, "joaozinhogamer@gmail.com", "O-", 175, null, null, null, "M", null);

-- Inserir dados na tabela enfermeiro

INSERT INTO triagem_hosp_leiria_g22_t6.enfermeiro (id, nome_enfermeiro, apelidos_enfermeiro, data_nasc_enfermeiro, morada_enfermeiro, 
cod_postal_enfermeiro, naturalidade_enfermeiro, nacionalidade_enfermeiro, data_admissao, ced_prof, sexo, obs)
VALUES
(null, "Daniel", "Rodrigues dos Santos", STR_TO_DATE('1968-12-04', '%Y-%m-%d'), "Rua da Cruz Vermelha", "1345-456 Leiria", "Portugal", "Portuguesa", 
STR_TO_DATE('2018-10-04', '%Y-%m-%d'), 19275, "M", "Licenciatura em Medicina Interna pela Faculdade de Medicina da Universidade de Leiria"),
(null, "Diogo", "Miguel Gomes", STR_TO_DATE('1970-12-04', '%Y-%m-%d'), "Rua das Flores", "1223-363 Parceiros", "Portugal", "Portuguesa", 
STR_TO_DATE('2018-05-12', '%Y-%m-%d'), 19234, "M", "Mestrado em Medicina Geral pela Escola Superior de Saúde do Instituto Politécnico de Leiria"),
(null, "Miguel", "Alves", STR_TO_DATE('1985-03-19', '%Y-%m-%d'), "Rua dos Leirienses", "1847-203 Leiria", "Portugal", "Portuguesa",
STR_TO_DATE('2018-04-08', '%Y-%m-%d'), 18456, "M", "Doutoramento em Medicina Geral pela Escola Superior de Saúde do Instituto Politécnico de Leiria"),
(null, "David", "da Silva Gomes", STR_TO_DATE('1955-12-20', '%Y-%m-%d'), "Rua da Cruz Vermelha", "1234-567 Leiria", "Angola", "Portuguesa", 
STR_TO_DATE('2017-12-20', '%Y-%m-%d'), 19374, "M", "Doutoramento em Medicina Geral pela Escola Superior de Medicina de Luanda"),
(null, "Ana", "Pires Gonçalves", STR_TO_DATE('1980-03-12', '%Y-%m-%d'), "Rua da Marinha Grande", "1855-345 Leiria", "Portugal", "Portuguesa", 
STR_TO_DATE('2017-01-01', '%Y-%m-%d'), 19576, "F", "Mestrado em Medicina Interna pela Escola Superior de Saúde do Instituto Politécnico de Leiria");

-- Inserir dados na tabela sala

INSERT INTO triagem_hosp_leiria_g22_t6.sala (id, tipo, obs)
VALUES
(null, "Triagem", "Exclusiva a triagens"),
(null, "Triagem/Consulta", "Apta a triagens e consultas"),
(null, "Triagem", "Apta apenas a triagens"),
(null, "Triagem/Consulta", "Apta a triagens e consultas"),
(null, "Triagem", "Apta apenas a triagens"),
(null, "Triagem/Consulta", "Apta a triagens e consultas"),
(null, "Triagem", "Apta apenas a triagens"),
(null, "Triagem/Consulta", "Apta a triagens e consultas"),
(null, "Triagem", "Apta apenas a triagens"),
(null, "Triagem/Consulta", "Apta a triagens e consultas"),
(null, "Triagem", "Apta apenas a triagens"),
(null, "Triagem/Consulta", "Apta a triagens e consultas"),
(null, "Triagem", "Apta apenas a triagens"),
(null, "Triagem/Consulta", "Apta a triagens e consultas"),
(null, "Triagem", "Apta apenas a triagens"),
(null, "Triagem/Consulta", "Apta a triagens e consultas"),
(null, "Triagem", "Apta apenas a triagens"),
(null, "Triagem/Consulta", "Apta a triagens e consultas"),
(null, "Laboratorio de pesquisa","Apta apenas para fazer analises"),
(null, "Triagem/Consulta", "Apta a triagens e consultas"),
(null, "Triagem", "Apta apenas a triagens"),
(null, "Laboratorio de pesquisa","Apta apenas para fazer analises"),
(null, "Triagem", "Exclusiva a triagens"),
(null, "Laboratorio de pesquisa","Apta apenas para fazer analises"),
(null, "Triagem", "Exclusiva a triagens"),
(null, "Laboratorio de pesquisa","Apta apenas para fazer analises"),
(null, "Triagem", "Exclusiva a triagens"),
(null, "Laboratorio de pesquisa","Apta apenas para fazer analises"),
(null, "Triagem", "Exclusiva a triagens"),
(null, "Laboratorio de pesquisa","Apta apenas para fazer analises"),
(null, "Triagem", "Exclusiva a triagens"),
(null, "Laboratorio de pesquisa","Apta apenas para fazer analises"),
(null, "Triagem", "Exclusiva a triagens"),
(null, "Laboratorio de pesquisa","Apta apenas para fazer analises"),
(null, "Triagem", "Exclusiva a triagens"),
(null, "Laboratorio de pesquisa","Apta apenas para fazer analises"),
(null, "Triagem", "Exclusiva a triagens"),
(null, "Laboratorio de pesquisa","Apta apenas para fazer analises"),
(null, "Triagem", "Exclusiva a triagens"),
(null, "Laboratorio de pesquisa","Apta apenas para fazer analises"),
(null, "Triagem", "Exclusiva a triagens");


-- Inserir dados na tabela triagem_manchester_info

INSERT INTO triagem_hosp_leiria_g22_t6.triagem_manchester (grau_prioridade, cor, minutos_atendimento)
VALUES
("Emergente", "Vermelho", "Imediato"),
("Muito Urgente", "Laranja", "Até 10 minutos"),
("Urgente", "Amarelo", "Até 60 minutos"),
("Pouco Urgente", "Verde", "Até 120 minutos"),
("Não Urgente", "Azul", "Até 240 minutos");

-- Inserir dados na table triagem

INSERT INTO triagem_hosp_leiria_g22_t6.triagem (id, data_hora, cor_triagem, id_utente, id_enfermeiro, id_sala, obs)
VALUES
(null, '2018-05-12 12:03:12', "Laranja", 3, 2, 1, "Mordido por um cão raivoso na praia da Nazaré"),
(null, '2018-01-01 03:12:08', "Vermelho", 4, 1, 2, "Coma alcólico provocado pela passagem de ano"),
(null, '2018-03-04 16:12:10', "Azul", 1, 2, 2, "Picado por abelha"),
(null, '2018-02-03 13:12:19', "Verde", 1, 2, 3, "Ingestão acidental de pastilha de máquia de loiça"),
(null, '2018-03-04 15:23:19', "Amarelo", 1, 2, 2, "Gastroentrite causada por frango estragado"),
(null, '2018-03-04 17:23:19', "Amarelo", 1, 2, 2, "Gastroentrite causada por frango estragado"),
(null, '2018-04-23 21:12:20', "Vermelho", 1, 3, 2, "Nariz partido por queda a jogar futebol"),
(null, '2017-02-22 09:12:12', "Verde",3,2,2, "Problemas de Diarreira"),
(null, '2017-03-22 09:12:12', "Verde",3,2,2, "Problemas de Diarreira"),
(null, '2017-04-22 09:12:12', "Verde",3,2,2, "Problemas de Diarreira");

-- Inserir dados na tabela material_triagem

INSERT INTO triagem_hosp_leiria_g22_t6.material_triagem (id, nome, quantidade, obs, id_sala)
VALUES
(null, "Kit de primeiros socorros", 1, "Kit de primeiros socorros para rápidas interveções", 1),
(null, "Kit de primeiros socorros", 1, "Kit de primeiros socorros para rápidas interveções", 2),
(null, "Kit de primeiros socorros", 1, "Kit de primeiros socorros para rápidas interveções", 3),
(null, "Kit de primeiros socorros", 1, "Kit de primeiros socorros para rápidas interveções", 4),
(null, "Kit de primeiros socorros", 1, "Kit de primeiros socorros para rápidas interveções", 5),
(null, "Kit de primeiros socorros", 1, "Kit de primeiros socorros para rápidas interveções", 6),
(null, "Kit de primeiros socorros", 1, "Kit de primeiros socorros para rápidas interveções", 7),
(null, "Kit de primeiros socorros", 1, "Kit de primeiros socorros para rápidas interveções", 8),
(null, "Kit de primeiros socorros", 1, "Kit de primeiros socorros para rápidas interveções", 9),
(null, "Kit de primeiros socorros", 1, "Kit de primeiros socorros para rápidas interveções", 10),
(null, "Fitas coloridas", 100, "Fitas para identificar o grau de prioridade do utente", 1),
(null, "Fitas coloridas", 100, "Fitas para identificar o grau de prioridade do utente", 2),
(null, "Fitas coloridas", 100, "Fitas para identificar o grau de prioridade do utente", 3),
(null, "Fitas coloridas", 100, "Fitas para identificar o grau de prioridade do utente", 4),
(null, "Fitas coloridas", 100, "Fitas para identificar o grau de prioridade do utente", 5),
(null, "Fitas coloridas", 100, "Fitas para identificar o grau de prioridade do utente", 6),
(null, "Fitas coloridas", 100, "Fitas para identificar o grau de prioridade do utente", 7),
(null, "Fitas coloridas", 100, "Fitas para identificar o grau de prioridade do utente", 8),
(null, "Fitas coloridas", 100, "Fitas para identificar o grau de prioridade do utente", 9),
(null, "Fitas coloridas", 100, "Fitas para identificar o grau de prioridade do utente", 10),
(null, "Computador", 1, "Computador para aceder ao software para registar o utente, com o suporte da base de dados", 18),
(null, "Rato para computador", 1, "Rato de computador para utilização pelo enfermeiro", 18),
(null, "Teclado de computador", 1, "Teclado para utlização do enfermeiro no computador da sala", 18);


-- Inserir dados na tabela limpezas

INSERT INTO triagem_hosp_leiria_g22_t6.limpezas (id, data_hora, descricao, id_sala)
VALUES
(null, '2018-05-12 09:00:00',"Limpeza rotina", 1),
(null, '2018-05-12 09:03:00', "Limpeza rotina", 2),
(null, '2018-05-12 10:00:00', "Limpeza rotina", 3),
(null, '2018-05-12 10:30:00', "Limpeza rotina", 4),
(null, '2018-05-12 11:00:00', "Limpeza rotina", 5),
(null, '2018-05-12 11:30:00', "Limpeza rotina", 6),
(null, '2018-05-12 12:00:00', "Limpeza rotina", 7),
(null, '2018-05-12 12:30:00', "Limpeza rotina", 8),
(null, '2018-05-12 13:00:00', "Limpeza rotina", 9),
(null, '2018-05-12 13:30:00', "Limpeza rotina", 10),
(null, '2018-05-12 14:00:00', "Limpeza rotina", 11),
(null, '2018-05-12 14:30:00', "Limpeza rotina", 12),
(null, '2018-05-12 15:00:00', "Limpeza rotina", 13),
(null, '2018-05-12 15:30:00', "Limpeza rotina", 14),
(null, '2018-05-12 16:00:00', "Limpeza rotina", 15),
(null, '2018-05-12 16:30:00', "Limpeza rotina", 16),
(null, '2018-05-12 17:00:00', "Limpeza rotina", 17),
(null, '2018-05-12 17:30:00', "Limpeza rotina", 18),
(null, '2018-05-12 18:00:00', "Limpeza rotina", 19),
(null, '2018-05-12 18:30:00', "Limpeza rotina", 20);

-- Consultas

-- 2 subconsultas

-- Daniel (Q7)
SELECT COUNT(*) AS 'Número de triagens' FROM triagem_hosp_leiria_g22_t6.triagem
WHERE (SELECT YEAR(triagem_hosp_leiria_g22_t6.triagem.data_hora) = 2017);

-- Diogo (Q4)
SELECT triagem_hosp_leiria_g22_t6.utente.id, 
CONCAT(triagem_hosp_leiria_g22_t6.utente.nome_utente, ' ', triagem_hosp_leiria_g22_t6.utente.apelidos_utente) AS 'Nome do Utente'
FROM triagem_hosp_leiria_g22_t6.utente WHERE triagem_hosp_leiria_g22_t6.utente.alergias IS NOT NULL AND 
(SELECT TIMESTAMPDIFF(YEAR, triagem_hosp_leiria_g22_t6.utente.data_nasc_utente, CURDATE())
WHERE TIMESTAMPDIFF(YEAR, triagem_hosp_leiria_g22_t6.utente.data_nasc_utente, CURDATE()) < 18); 

-- 2 consultas com grupos e joins

-- Daniel (Q1)
SELECT COUNT(*) AS 'Número de salas', triagem_hosp_leiria_g22_t6.sala.tipo, triagem_hosp_leiria_g22_t6.sala.obs FROM triagem_hosp_leiria_g22_t6.sala
GROUP BY triagem_hosp_leiria_g22_t6.sala.tipo; 

-- Diogo (Q3)
SELECT triagem_hosp_leiria_g22_t6.utente.id, triagem_hosp_leiria_g22_t6.enfermeiro.nome_enfermeiro
FROM enfermeiro
INNER JOIN triagem_hosp_leiria_g22_t6.utente ON 
triagem_hosp_leiria_g22_t6.enfermeiro.nome_enfermeiro = triagem_hosp_leiria_g22_t6.utente.nome_utente;

-- 2 consultas com joins e funções de linha

-- Daniel (Q5)
SELECT triagem_hosp_leiria_g22_t6.utente.id, 
CONCAT(triagem_hosp_leiria_g22_t6.utente.nome_utente, ' ', triagem_hosp_leiria_g22_t6.utente.apelidos_utente) AS 'Nome do Utente'
FROM triagem_hosp_leiria_g22.utente
INNER JOIN triagem_hosp_leiria_g22_t6.enfermeiro 
ON YEAR(triagem_hosp_leiria_g22_t6.utente.data_nasc_utente) = YEAR(triagem_hosp_leiria_g22_t6.enfermeiro.data_nasc_enfermeiro);

-- Diogo (Q6)
SELECT triagem_hosp_leiria_g22_t6.triagem.cor_triagem, COUNT(triagem_hosp_leiria_g22_t6.triagem.cor_triagem) AS 'Número de ocurrências'
FROM triagem_hosp_leiria_g22_t6.triagem
GROUP BY triagem_hosp_leiria_g22_t6.triagem.cor_triagem;

-- 2 consultas à escolha

-- Daniel (Q2)
SELECT triagem_hosp_leiria_g22_t6.utente.nome_utente AS 'Nome do Utente', TIMESTAMPDIFF(YEAR, triagem_hosp_leiria_g22_t6.utente.data_nasc_utente, CURDATE()) AS 'Idade'
FROM triagem_hosp_leiria_g22_t6.utente;

-- Diogo (Q8)
SELECT triagem_hosp_leiria_g22_t6.material_triagem.nome, SUM(triagem_hosp_leiria_g22_t6.material_triagem.quantidade) AS 'Quantidade de material' 
FROM triagem_hosp_leiria_g22_t6.material_triagem
GROUP BY triagem_hosp_leiria_g22_t6.material_triagem.nome;

