/*
CDBD_PL1_T6_G?
Sistema de Base de Dados para as urgências do "Hospital de Leiria" baseada na Triagem de Manchester
Daniel Batista, estudante Nº 2171836
Diogo Alpendre, estudante Nº 2170324
*/

-- Criação da base de dados

CREATE DATABASE triagem_h_leiria_g2;

-- Criação das tabelas

-- Tabela Utente
CREATE TABLE triagem_h_leiria_g2.utente
(id INT AUTO_INCREMENT PRIMARY KEY, cc INT NOT NULL, nif INT(9) NOT NULL, nsns INT NOT NULL, nome_utente VARCHAR(20) NOT NULL, 
apelidos_utente VARCHAR(80) NOT NULL, data_nasc_utente VARCHAR(11) NOT NULL, morada_utente VARCHAR(100) NOT NULL, 
cod_postal_utente VARCHAR(50) NOT NULL, naturalidade_utente VARCHAR(100) NOT NULL, nacionalidade_utente VARCHAR(100) NOT NULL, 
tipo_sangue VARCHAR(3) NOT NULL, altura INT(3) NOT NULL, problemas_saude VARCHAR(500), medicacao VARCHAR(500), alergias VARCHAR(500),
sexo CHAR(1) NOT NULL, obs VARCHAR(500)); 

-- Tabela Enfermeiro
CREATE TABLE triagem_h_leiria_g2.enfermeiro
(id INT AUTO_INCREMENT PRIMARY KEY, nome_enfermeiro VARCHAR(20) NOT NULL, apelidos_enfermeiro VARCHAR(80) NOT NULL, 
data_nasc_enfermeiro VARCHAR(11), morada_enfermeiro VARCHAR(100) NOT NULL, cod_postal_enfermeiro VARCHAR(50) NOT NULL,  
naturalidade_enfermeiro VARCHAR(100) NOT NULL, nacionalidade_enfermeiro VARCHAR(100) NOT NULL, data_admisaao VARCHAR(11));

-- Tabela Sala
CREATE TABLE triagem_h_leiria_g2.sala
(id INT AUTO_INCREMENT PRIMARY KEY, tipo VARCHAR(50) NOT NULL, obs VARCHAR(500));

-- Tabela Triagem de Manchester (armazena a cor e a descrição de cada cor)
CREATE TABLE triagem_h_leiria_g2.triagem_manchester_info
(cor VARCHAR(10) PRIMARY KEY, descricao VARCHAR(500));

-- Tabela Triagem (processo)
 CREATE TABLE triagem_h_leiria_g2.triagem
 (id INT AUTO_INCREMENT PRIMARY KEY, data_hora VARCHAR(50) NOT NULL, cor_triagem VARCHAR(10), 
 id_utente INT, id_enfermeiro INT, id_sala INT, obs VARCHAR(500), FOREIGN KEY (cor_triagem) REFERENCES triagem_manchester_info(cor),
 FOREIGN KEY (id_utente) REFERENCES utente(id), FOREIGN KEY (id_enfermeiro) REFERENCES enfermeiro(id), 
 FOREIGN KEY (id_sala) REFERENCES sala(id));
 
 
 
 