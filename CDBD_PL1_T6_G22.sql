/*
CDBD_PL1_T6_G?
Sistema de Base de Dados para as urgências do "Hospital de Leiria" baseada na Triagem de Manchester
Daniel Batista, estudante Nº 2171836
Diogo Alpendre, estudante Nº 2170324
*/

-- Criação da base de dados

CREATE DATABASE triagem_hosp_leiria_g22;

-- Criação das tabelas

-- Tabela Utente
CREATE TABLE triagem_hosp_leiria_g22.utente
(id INT AUTO_INCREMENT PRIMARY KEY, cc INT NOT NULL, nif INT(9) NOT NULL, nsns INT NOT NULL, nome_utente VARCHAR(20) NOT NULL, 
apelidos_utente VARCHAR(80) NOT NULL, data_nasc_utente VARCHAR(11) NOT NULL, morada_utente VARCHAR(100) NOT NULL, 
cod_postal_utente VARCHAR(50) NOT NULL, naturalidade_utente VARCHAR(100) NOT NULL, nacionalidade_utente VARCHAR(100) NOT NULL,
telemovel INT(9), email VARCHAR(100), tipo_sangue VARCHAR(3) NOT NULL, altura INT(3) NOT NULL, problemas_saude VARCHAR(500), medicacao VARCHAR(500), alergias VARCHAR(500),
sexo CHAR(1) NOT NULL, obs VARCHAR(500)); 

-- Tabela Enfermeiro
CREATE TABLE triagem_hosp_leiria_g22.enfermeiro
(id INT AUTO_INCREMENT PRIMARY KEY, nome_enfermeiro VARCHAR(20) NOT NULL, apelidos_enfermeiro VARCHAR(80) NOT NULL, 
data_nasc_enfermeiro VARCHAR(11), morada_enfermeiro VARCHAR(100) NOT NULL, cod_postal_enfermeiro VARCHAR(50) NOT NULL,  
naturalidade_enfermeiro VARCHAR(100) NOT NULL, nacionalidade_enfermeiro VARCHAR(100) NOT NULL, 
data_admissao VARCHAR(11), ced_prof INT NOT NULL, obs VARCHAR(500));

-- Tabela Sala
CREATE TABLE triagem_hosp_leiria_g22.sala
(id INT AUTO_INCREMENT PRIMARY KEY, tipo VARCHAR(50) NOT NULL, obs VARCHAR(500));

-- Tabela Triagem de Manchester (armazena a cor e a descrição de cada cor)
CREATE TABLE triagem_hosp_leiria_g22.triagem_manchester_info
(grau_prioridade VARCHAR(20) PRIMARY KEY, cor VARCHAR(8) NOT NULL, minutos_atendimento VARCHAR(50) NOT NULL);

-- Tabela Triagem (processo)
 CREATE TABLE triagem_hosp_leiria_g22.triagem
 (id INT AUTO_INCREMENT PRIMARY KEY, data_hora VARCHAR(50) NOT NULL, cor_triagem VARCHAR(10), 
 id_utente INT, id_enfermeiro INT, id_sala INT, obs VARCHAR(500), FOREIGN KEY (cor_triagem) REFERENCES triagem_manchester_info(cor),
 FOREIGN KEY (id_utente) REFERENCES utente(id), FOREIGN KEY (id_enfermeiro) REFERENCES enfermeiro(id), 
 FOREIGN KEY (id_sala) REFERENCES sala(id));
  
 -- Inserir dados na tabela utente
 INSERT INTO triagem_hosp_leiria_g22.utente (id, cc, nif, nsns, nome_utente, apelidos_utente, data_nasc_utente, morada_utente, cod_postal_utente,
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

-- Inserir dados na tabela enfermeiro
INSERT INTO triagem_hosp_leiria_g22.enfermeiro (id, nome_enfermeiro, apelidos_enfermeiro, data_nasc_enfermeiro, morada_enfermeiro, 
cod_postal_enfermeiro, naturalidade_enfermeiro, nacionalidade_enfermeiro, data_admissao, ced_prof, obs)
VALUES
(null, "Daniel", "Rodrigues dos Santos", "04/12/1968", "Rua da Cruz Vermelha", "1345-456 Leiria", "Portugal", "Portuguesa", 
"04/10/2018", 19275, "Licenciatura em Medicina Interna pela Faculdade de Medicina da Universidade de Leiria"),
(null, "Diogo", "Miguel Gomes", "04/12/1970", "Rua das Flores", "1223-363 Parceiros", "Portugal", "Portuguesa", 
"12/05/2018", 19234, "Mestrado em Medicina Geral pela Escola Superior de Saúde do Instituto Politécnico de Leiria"),
(null, "Miguel", "Alves", "19/03/1985", "Rua dos Leirienses", "1847-203 Leiria", "Portugal", "Portuguesa",
"08/04/2018", 18456, "Doutoramento em Medicina Geral pela Escola Superior de Saúde do Instituto Politécnico de Leiria");

-- Inserir dados na tabela sala
INSERT INTO triagem_hosp_leiria_g22.sala (id, tipo, obs)
VALUES
(null, "Triagem", "Exclusiva a triagens"),
(null, "Triagem/Consulta", "Apta à realização de triagens e consultas");

-- Inserir dados na tabela triagem_manchester_info
INSERT INTO triagem_hosp_leiria_g22.triagem_manchester_info (grau_prioridade, cor, minutos_atendimento)
VALUES
("Emergente", "Vermelho", "Imediato"),
("Muito Urgente", "Laranja", "Até 10 minutos"),
("Urgente", "Amarelo", "Até 60 minutos"),
("Pouco Urgente", "Verde", "Até 120 minutos"),*/
("Não Urgente", "Azul", "Até 240 minutos");

-- Inserir dados na table triagem
INSERT INTO triagem_hosp_leiria_g22.triagem (id, data_hora, cor_triagem, id_utente, id_enfermeiro, id_sala, obs)
VALUES
(null, "12/05/2018", "Laranja", 3, 2, 1, "Mordido por um cão raivoso na praia da Nazaré"),
(null, "01/01/2018", "Vermelho", 4, 1, 2, "Coma alcólico provocado pela passagem de ano"),
(null, "04/03/2018", "Azul", 1, 2, 2, "Picado por abelha"),
(null, "03/02/2018", "Verde", 1, 2, 3, "Ingestão acidental de pastilha de máquia de loiça"),
(null, "14/03/2018", "Amarelo", 1, 2, 2, "Gastroentrite causada por frango estragado"),
(null, "20/02/2018", "Vermelho", 1, 3, 2, "Nariz partido por queda a jogar futebol");

-- Consultas

-- Subconsultas
