/*
CDBD_PL1_T6_G22
Sistema de Base de Dados para as urgências do "Hospital de Leiria" baseada na Triagem de Manchester
Daniel Batista, estudante Nº 2171836
Diogo Alpendre, estudante Nº 2170324
*/

-- Drop the database

 DROP DATABASE IF EXISTS triagem_hosp_leiria_g22;

-- Criação da base de dados

 CREATE DATABASE triagem_hosp_leiria_g22;
 
 -- Definir a tabela como default
 
 USE triagem_hosp_leiria_g22;

-- Apaga as tabelas

DROP TABLE IF EXISTS utente;
DROP TABLE IF EXISTS enfermeiro;
DROP TABLE IF EXISTS sala;
DROP TABLE IF EXISTS triagem_manchester;
DROP TABLE IF EXISTS triagem;

-- Criação das tabelas

-- Tabela Utente

CREATE TABLE triagem_hosp_leiria_g22.utente
(id INT AUTO_INCREMENT PRIMARY KEY, cc INT NOT NULL, nif INT(9) NOT NULL, nsns INT NOT NULL, nome_utente VARCHAR(20) NOT NULL, 
apelidos_utente VARCHAR(80) NOT NULL, data_nasc_utente DATE NOT NULL, morada_utente VARCHAR(100) NOT NULL, 
cod_postal_utente VARCHAR(50) NOT NULL, naturalidade_utente VARCHAR(100) NOT NULL, nacionalidade_utente VARCHAR(100) NOT NULL,
telemovel INT(9), email VARCHAR(100), tipo_sangue VARCHAR(3) NOT NULL, altura INT(3) NOT NULL, problemas_saude VARCHAR(500), medicacao VARCHAR(500), alergias VARCHAR(500),
sexo CHAR(1) NOT NULL, obs VARCHAR(500), UNIQUE(cc), UNIQUE(nif), UNIQUE(nsns), UNIQUE(telemovel), UNIQUE(email)); 

-- Tabela Enfermeiro

CREATE TABLE triagem_hosp_leiria_g22.enfermeiro
(id INT AUTO_INCREMENT PRIMARY KEY, nome_enfermeiro VARCHAR(20) NOT NULL, apelidos_enfermeiro VARCHAR(80) NOT NULL, 
data_nasc_enfermeiro VARCHAR(22), morada_enfermeiro VARCHAR(100) NOT NULL, cod_postal_enfermeiro VARCHAR(50) NOT NULL,  
naturalidade_enfermeiro VARCHAR(100) NOT NULL, nacionalidade_enfermeiro VARCHAR(100) NOT NULL, 
data_admissao VARCHAR(11), ced_prof INT NOT NULL, sexo CHAR(1), obs VARCHAR(500), UNIQUE(ced_prof));

-- Tabela Sala

CREATE TABLE triagem_hosp_leiria_g22.sala
(id INT AUTO_INCREMENT PRIMARY KEY, tipo VARCHAR(50) NOT NULL, obs VARCHAR(500));

-- Tabela Triagem de Manchester (armazena a cor e a descrição de cada cor)

CREATE TABLE triagem_hosp_leiria_g22.triagem_manchester
(grau_prioridade VARCHAR(20) PRIMARY KEY, cor VARCHAR(8) NOT NULL, minutos_atendimento VARCHAR(50) NOT NULL, 
UNIQUE(grau_prioridade), UNIQUE(cor), UNIQUE(minutos_atendimento));

-- Tabela Triagem (processo em si)

 CREATE TABLE triagem_hosp_leiria_g22.triagem
 (id INT AUTO_INCREMENT PRIMARY KEY, data_hora VARCHAR(50) NOT NULL, cor_triagem VARCHAR(10), 
 id_utente INT, id_enfermeiro INT, id_sala INT, obs VARCHAR(500), FOREIGN KEY (cor_triagem) REFERENCES triagem_manchester_info(cor),
 FOREIGN KEY (id_utente) REFERENCES utente(id), FOREIGN KEY (id_enfermeiro) REFERENCES enfermeiro(id), 
 FOREIGN KEY (id_sala) REFERENCES sala(id));

-- Tabela Material de Triagem (material presente nas salas)

CREATE TABLE triagem_hosp_leiria_g22.material_triagem
(id INT AUTO_INCREMENT PRIMARY KEY, nome VARCHAR(100) NOT NULL, quantidade INT NOT NULL, obs VARCHAR(500), id_sala INT,
FOREIGN KEY (id_sala) REFERENCES sala(id));

-- Tabela Limpeza de salas (armazena informação sobre as limpezas efetuadas e as respetivas salas)

CREATE TABLE triagem_hosp_leiria_g22.limpezas
(id INT AUTO_INCREMENT PRIMARY KEY, data_hora VARCHAR(50) NOT NULL, descricao VARCHAR(500), id_sala INT,
FOREIGN KEY (id_sala) REFERENCES sala(id));

 -- Inserir dados na tabela utente
 
 INSERT INTO triagem_hosp_leiria_g22.utente (id, cc, nif, nsns, nome_utente, apelidos_utente, data_nasc_utente, morada_utente, cod_postal_utente,
 naturalidade_utente, nacionalidade_utente, telemovel, email, tipo_sangue, altura, problemas_saude, medicacao, alergias, sexo, obs)
 VALUES
 (null, 13847293, 278593734, 17485968, "António", "Duarte Arnaut", STR_TO_DATE('2000-10-20', '%Y-%m-%d'), "Rua da Cumeeira", "1563-345 Coimbra", "Portugal",
 "Portuguesa", 964738271, "antonio_arnaut@gmail.com", "A+", 165, "Cataratas em fase 2", "Gotas Robomil", "Pêssego", "M", "Considerado o pai do Serviço Nacional de Saúde (SNS)"),
 (null, 15757648, 987849824, 18384923, "Daniel", "Correia Batista", STR_TO_DATE('1998-07-24', '%Y-%m-%d'), "Rua da Marinha Grande", "2430-528 Marinha Grande", 
 "Portugal", "Portuguesa", 919090978, "danielc.batista98@gmail.com", "A+", 182, null, null, null, "M", null),
 (null, 18488943, 983823832, 29244358, "Diogo", "Cruz Alpendre", STR_TO_DATE('1999-03-04','%Y-%m-%d'), "Rua do Casulo", "2865-345 Lisboa", "Portugal", "Portuguesa",
926019922, "dalpendre1999@gmail.com", "O+", 170 , "Rinite Alérgica", "Nasomet spray nasal", "Rinite", "M", "Se não tomar medicamento, fica doente"),
(null, 19348383, 927374743, 298483048, "João", "da Silva Pereira", STR_TO_DATE('1970-09-12','%Y-%m-%d'), "Rua de Lisboa", "2859-374 Braga", 
"Portugal", "Portuguesa", 933881568, "joao.pereira@gmail.com", "O-", 155, null, null, "Bananas", "M", "Não pode comer, tocar e cheirar bananas"),
(null, 19329399, 918938495, 193424349, "Manuela", "Rodrigues Alves", STR_TO_DATE('1975-06-02','%Y-%m-%d'), "Rua de Braga", "2948-225 Braga", "Portugal", "Portuguesa",
933456758, "manuela.rodrigues.alves@outlook.com", "A+", 190, null, null, null, "F", "Teve asma até aos 10 anos");

-- Inserir dados na tabela enfermeiro

INSERT INTO triagem_hosp_leiria_g22.enfermeiro (id, nome_enfermeiro, apelidos_enfermeiro, data_nasc_enfermeiro, morada_enfermeiro, 
cod_postal_enfermeiro, naturalidade_enfermeiro, nacionalidade_enfermeiro, data_admissao, ced_prof, sexo, obs)
VALUES
(null, "Daniel", "Rodrigues dos Santos", "04/12/1968", "Rua da Cruz Vermelha", "1345-456 Leiria", "Portugal", "Portuguesa", 
"04/10/2018", 19275, "M", "Licenciatura em Medicina Interna pela Faculdade de Medicina da Universidade de Leiria"),
(null, "Diogo", "Miguel Gomes", "04/12/1970", "Rua das Flores", "1223-363 Parceiros", "Portugal", "Portuguesa", 
"12/05/2018", 19234, "M", "Mestrado em Medicina Geral pela Escola Superior de Saúde do Instituto Politécnico de Leiria"),
(null, "Miguel", "Alves", "19/03/1985", "Rua dos Leirienses", "1847-203 Leiria", "Portugal", "Portuguesa",
"08/04/2018", 18456, "M", "Doutoramento em Medicina Geral pela Escola Superior de Saúde do Instituto Politécnico de Leiria"),
(null, "David", "da Silva Gomes", "Rua da Cruz Vermelha", "20/12/1955", "1234-567 Leiria", "Angola", "Portuguesa", "20/12/2017",
19374, "M", "Doutoramento em Medicina Geral pela Escola Superior de Medicina de Luanda"),
(null, "Ana", "Pires Gonçalves", "Rua da Marinha Grande", "12/03/1980", "1855-345 Leiria", "Portugal", "Portuguesa", "01/01/2017",
19576, "F", "Mestrado em Medicina Interna pela Escola Superior de Saúde do Instituto Politécnico de Leiria");

-- Inserir dados na tabela sala

INSERT INTO triagem_hosp_leiria_g22.sala (id, tipo, obs)
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

INSERT INTO triagem_hosp_leiria_g22.triagem_manchester (grau_prioridade, cor, minutos_atendimento)
VALUES
("Emergente", "Vermelho", "Imediato"),
("Muito Urgente", "Laranja", "Até 10 minutos"),
("Urgente", "Amarelo", "Até 60 minutos"),
("Pouco Urgente", "Verde", "Até 120 minutos"),
("Não Urgente", "Azul", "Até 240 minutos");

-- Inserir dados na table triagem

INSERT INTO triagem_hosp_leiria_g22.triagem (id, data_hora, cor_triagem, id_utente, id_enfermeiro, id_sala, obs)
VALUES
(null, "12/05/2018", "Laranja", 3, 2, 1, "Mordido por um cão raivoso na praia da Nazaré"),
(null, "01/01/2018", "Vermelho", 4, 1, 2, "Coma alcólico provocado pela passagem de ano"),
(null, "04/03/2018", "Azul", 1, 2, 2, "Picado por abelha"),
(null, "03/02/2018", "Verde", 1, 2, 3, "Ingestão acidental de pastilha de máquia de loiça"),
(null, "14/03/2018", "Amarelo", 1, 2, 2, "Gastroentrite causada por frango estragado"),
(null, "20/02/2018", "Vermelho", 1, 3, 2, "Nariz partido por queda a jogar futebol"),
(null, "22/03/2018","Verde",3,2,2,"Problemas de Diarreira");

-- Inserir dados na tabela material_triagem

INSERT INTO triagem_hosp_leiria_g22.material_triagem (id, nome, quantidade, obs, id_sala)
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

INSERT INTO triagem_hosp_leiria_g22.limpezas (id, data_hora, descricao, id_sala)
VALUES
(null,"12/05/2018-09:00","Limpeza rotina",1),
(null,"12/05/2018-09:30","Limpeza rotina",2),
(null,"12/05/2018-10:00","Limpeza rotina",3),
(null,"12/05/2018-10:30","Limpeza rotina",4),
(null,"12/05/2018-11:00","Limpeza rotina",5),
(null,"12/05/2018-11:30","Limpeza rotina",6),
(null,"12/05/2018-12:00","Limpeza rotina",7),
(null,"12/05/2018-12:30","Limpeza rotina",8),
(null,"12/05/2018-13:00","Limpeza rotina",9),
(null,"12/05/2018-13:30","Limpeza rotina",10),
(null,"12/05/2018-14:00","Limpeza rotina",11),
(null,"12/05/2018-14:30","Limpeza rotina",12),
(null,"12/05/2018-15:00","Limpeza rotina",13),
(null,"12/05/2018-15:30","Limpeza rotina",14),
(null,"12/05/2018-16:00","Limpeza rotina",15),
(null,"12/05/2018-16:30","Limpeza rotina",16),
(null,"12/05/2018-17:00","Limpeza rotina",17),
(null,"12/05/2018-17:30","Limpeza rotina",18),
(null,"12/05/2018-18:00","Limpeza rotina",19),
(null,"12/05/2018-18:30","Limpeza rotina",20);

-- Consultas

-- 2 subconsultas

-- Daniel

-- Diogo (Q4)

-- 2 consultas com grupos e joins

-- Daniel (Q1)
SELECT triagem_hosp_leiria_g22.sala.tipo, triagem_hosp_leiria_g22.sala.obs FROM triagem_hosp_leiria_g22.sala
GROUP BY triagem_hosp_leiria_g22.sala.tipo; 

-- Diogo (Q3)
SELECT triagem_hosp_leiria_g22.enfermeiro.nome_enfermeiro
FROM enfermeiro
INNER JOIN triagem_hosp_leiria_g22.utente ON 
triagem_hosp_leiria_g22.enfermeiro.nome_enfermeiro = triagem_hosp_leiria_g22.utente.nome_utente;

select * from enfermeiro;
select * from utente;

SELECT * FROM sala;
-- 2 consultas com joins e funções de linha

-- Daniel

-- Diogo (Q3)

-- 2 consultas à escolha

-- Daniel

-- Diogo (Q5)

-- Consultar todos os dados da tabela utente

