
CREATE DATABASE biblioteca;
USE biblioteca ;


CREATE TABLE usuario (
  rm INT PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(60) NULL ,
  email VARCHAR(120) NULL ,
  dt_nascimento DATE NULL ,
  genero CHAR(1) NULL ,
  telefone VARCHAR(45) NULL ,
  senha CHAR(20) NULL ,
  perfil VARCHAR(120) NULL ,
  status VARCHAR(100) NULL ,
  obs VARCHAR(200) NULL ,
  adm TINYINT(1) NULL);

CREATE TABLE genero (
  cd INT PRIMARY KEY AUTO_INCREMENT ,
  nome VARCHAR(100) NULL);


CREATE TABLE editora (
  cd INT PRIMARY KEY AUTO_INCREMENT ,
  nome VARCHAR(80) NULL);

CREATE TABLE livro (
  cd INT PRIMARY KEY AUTO_INCREMENT ,
  isbn VARCHAR(100) NULL ,
  titulo VARCHAR(200) NULL ,
  ano INT(4) NULL ,
  qtd INT NULL ,
  sinopse LONGTEXT NULL ,
  capa VARCHAR(200) NULL ,
  classificacao VARCHAR(45) NULL ,
  id_editora INT NOT NULL ,
  id_genero INT NOT NULL ,
  estado LONGTEXT NULL ,
  FOREIGN KEY (id_editora) REFERENCES editora (cd),
  FOREIGN KEY (id_genero)  REFERENCES genero (cd));

CREATE TABLE autor (
  cd INT PRIMARY KEY AUTO_INCREMENT ,
  nome VARCHAR(60) NULL);


CREATE TABLE autor_livro (
  id_livro INT NOT NULL ,
  id_autor INT NOT NULL ,
  FOREIGN KEY (id_livro)  REFERENCES livro (cd),
  FOREIGN KEY (id_autor)  REFERENCES autor (cd));


CREATE TABLE emprestimo (
  cd INT PRIMARY KEY AUTO_INCREMENT,
  id_usuario INT NOT NULL ,
  id_livro INT NOT NULL ,
  dt_emprestimo DATE NULL ,
  dt_devolucao DATE NULL ,
  status VARCHAR(100) NULL ,
  FOREIGN KEY (id_usuario) REFERENCES usuario (rm),
  FOREIGN KEY (id_livro)   REFERENCES livro (cd));

CREATE TABLE livro_emprestimo (
  id_emprestimo INT ,
  id_livro INT,
  nota INT(1),
  FOREIGN KEY (id_emprestimo) REFERENCES emprestimo (cd),
  FOREIGN KEY (id_livro)  REFERENCES livro (cd));


CREATE TABLE favorito (
  cd INT PRIMARY KEY AUTO_INCREMENT ,
  id_usuario INT NOT NULL ,
  id_livro INT NOT NULL ,
 FOREIGN KEY (id_usuario) REFERENCES usuario (rm),
FOREIGN KEY (id_livro) REFERENCES livro (cd));


CREATE TABLE fila (
  cd INT PRIMARY KEY AUTO_INCREMENT ,
  id_livro INT ,
  FOREIGN KEY (id_livro) REFERENCES livro (cd),
  id_usuario INT ,  
  FOREIGN KEY (id_usuario) REFERENCES usuario (rm));

