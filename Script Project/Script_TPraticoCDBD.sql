/*
CDBD_PL1_T6_G22
Sistema de Base de Dados para as urgências do "Hospital de Leiria" baseada na Triagem de Manchester
Daniel Batista, estudante Nº 2171836
Diogo Alpendre, estudante Nº 2170324
*/

-- Criação da base de dados

DROP DATABASE IF EXISTS triagemhospleiriag22;
CREATE DATABASE triagemhospleiriag22;

-- Drops the tables

DROP TABLE IF EXISTS triagemhospleiriag22.utente;
DROP TABLE IF EXISTS triagemhospleiriag22.enfermeiro;
DROP TABLE IF EXISTS triagemhospleiriag22.sala;
DROP TABLE IF EXISTS triagemhospleiriag22.triagem_manchester_info;
DROP TABLE IF EXISTS triagemhospleiriag22.triagem;

-- Criação das tabelas

-- Tabela Utente
CREATE TABLE triagemhospleiriag22.utente
(id INT AUTO_INCREMENT PRIMARY KEY, cc INT NOT NULL, nif INT(9) NOT NULL, nsns INT NOT NULL, nome_utente VARCHAR(20) NOT NULL, 
apelidos_utente VARCHAR(80) NOT NULL, data_nasc_utente VARCHAR(11) NOT NULL, morada_utente VARCHAR(100) NOT NULL, 
cod_postal_utente VARCHAR(50) NOT NULL, naturalidade_utente VARCHAR(100) NOT NULL, nacionalidade_utente VARCHAR(100) NOT NULL, telemovel INT(9) NOT NULL,
email VARCHAR(100) NOT NULL, tipo_sangue VARCHAR(3) NOT NULL, altura INT(3) NOT NULL, problemas_saude VARCHAR(500), medicacao VARCHAR(500), alergias VARCHAR(500),
sexo CHAR(1) NOT NULL, obs VARCHAR(500));

-- Tabela Enfermeiro
CREATE TABLE triagemhospleiriag22.enfermeiro
(id INT AUTO_INCREMENT PRIMARY KEY, nome_enfermeiro VARCHAR(20) NOT NULL, apelidos_enfermeiro VARCHAR(80) NOT NULL, ced_prof INT(9) NOT NULL,   
naturalidade_enfermeiro VARCHAR(100) NOT NULL, nacionalidade_enfermeiro VARCHAR(100) NOT NULL, data_admissao VARCHAR(11));

-- Tabela Sala
CREATE TABLE triagemhospleiriag22.sala
(id INT AUTO_INCREMENT PRIMARY KEY, tipo VARCHAR(50) NOT NULL, obs VARCHAR(500));

-- Tabela Triagem de Manchester (armazena a cor e a descrição de cada cor)
CREATE TABLE triagemhospleiriag22.triagem_manchester_info
(cor VARCHAR(10) PRIMARY KEY, descricao VARCHAR(500));

-- Tabela Triagem (processo)
 CREATE TABLE triagemhospleiriag22.triagem
 (id INT AUTO_INCREMENT PRIMARY KEY, data_hora VARCHAR(50) NOT NULL, cor_triagem VARCHAR(10), 
 id_utente INT, id_enfermeiro INT, id_sala INT, obs VARCHAR(500), FOREIGN KEY (cor_triagem) REFERENCES triagem_manchester_info(cor),
 FOREIGN KEY (id_utente) REFERENCES utente(id), FOREIGN KEY (id_enfermeiro) REFERENCES enfermeiro(id), 
 FOREIGN KEY (id_sala) REFERENCES sala(id));
  
 -- Inserir dados na tabela utente
 INSERT INTO triagemhospleiriag22.utente (id, cc, nif, nsns, nome_utente, apelidos_utente, data_nasc_utente, morada_utente, cod_postal_utente,
 naturalidade_utente, nacionalidade_utente, telemovel, email, tipo_sangue, altura, problemas_saude, medicacao, alergias, sexo, obs)
 VALUES
 (null, 13847293, 278593734, 17485968, "António", "Duarte Arnaut", "28/01/1936", "Rua da Cumeeira", "1563-345 Coimbra", "Portugal",
 "Portuguesa", 964738271, "antonio_arnaut@gmail.com", "A+", 165, "Cataratas em fase 2", "Gotas Robomil", "Pêssego", "M", "Considerado o pai do Serviço Nacional de Saúde (SNS)"),
 (null, 15757648, 987849824, 18384923, "Daniel", "Correia Batista", "24/07/1998", "Rua da Marinha Grande", "2430-528 Marinha Grande", 
 "Portugal", "Portuguesa", 919090978, "danielc.batista98@gmail.com", "A+", 182, null, null, null, "M", null),
 (null, 18488943, 983823832, 29244358, "Diogo", "Cruz Alpendre", "04/03/1999", "Rua do Casulo", "2865-345 Lisboa", "Portugal", "Portuguesa",
926019922, "dalpendre1999@gmail.com", "O+", 170 , "Rinite Alérgica", "Nasomet spray nasal", "Rinite", "M", "Se não tomar medicamento, fica doente"),
(null, 19348383, 927374743, 298483048, "João", "da Silva Pereira", "12/09/1970", "Rua de Lisboa", "2859-374 Braga", 
"Portugal", "Portuguesa", 933881568, "joao.pereira@gmail.com", "O-", 155, null, null, "Bananas", "M", "Não pode comer, tocar e cheirar bananas"),
(null, 19329399, 918938495, 193424349, "Manuela", "Rodrigues Alves", "02/06/1975", "Rua de Braga", "2948-225 Braga", "Portugal", "Portuguesa",
933456758, "manuela.rodrigues.alves@outlook.com", "A+", 190, null, null, null, "F", "Teve asma até aos 10 anos");


INSERT INTO triagemhospleiriag22.enfermeiro(id,nome_enfermeiro,apelidos_enfermeiro,ced_prof,
naturalidade_enfermeiro,nacionalidade_enfermeiro,data_admissao)
VALUES
( )
