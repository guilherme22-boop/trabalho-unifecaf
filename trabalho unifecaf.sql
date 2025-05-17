create database db_faculdade_unifecaf;

use db_faculdade_unifecaf;

create table tbl_secretaria (

id int not null primary key auto_increment,
numero varchar(15) not null,
email varchar(350) not null

);


create table tbl_portal_faculdade (
url varchar(50) primary key not null,
nome varchar(45) not null,
tbl_secretaria_id int not null,
 
constraint tbl_portal_secretaria
foreign key (tbl_secretaria_id)
references	tbl_secretaria (id)



);
show tables;


create table tbl_aluno (
matricula varchar(12) primary key,
nome varchar(100) not null,
data_nascimento date not null,
cpf varchar(14) not null,
rg varchar(12) not null,
nacionalidade varchar(35) not null,

tbl_portal_faculdade varchar(50) not null,

constraint tbl_aluno_portal
foreign key (tbl_portal_faculdade)
references tbl_portal_faculdade (url)



);

create table tbl_email (
id int not null primary key,
email varchar(350),
tbl_aluno varchar (45),

constraint fk_email_aluno
foreign key (tbl_aluno)
references tbl_aluno(matricula)

);




CREATE TABLE tbl_endereco (
id INT AUTO_INCREMENT NOT NULL,
cep VARCHAR(11) NOT NULL,
logradouro VARCHAR(50) NOT NULL,
bairro VARCHAR(45) NOT NULL,
complemento VARCHAR(45),
cidade VARCHAR(45) NOT NULL,
uf VARCHAR(2) NOT NULL,
pais VARCHAR(45),
matricula_aluno VARCHAR(12) NOT NULL,
    
CONSTRAINT fk_endereco_aluno
FOREIGN KEY (matricula_aluno)
REFERENCES tbl_aluno(matricula),
        
PRIMARY KEY (id)
    );
    
    
create table tbl_telefone (
id int primary key auto_increment,
telefone varchar(16) not null,
matricula_aluno varchar(12) not null,



constraint fk_numero_aluno
foreign key (matricula_aluno)
references tbl_aluno(matricula)


);


create table tbl_curso (
cod_curso int primary key not null auto_increment,
nome_curso varchar(100) not null,
carga_horaria time not null,
data_inicio date not null,
data_termino date not null,
matricula_aluno varchar(12) not null,


constraint fk_curso_aluno
foreign key (matricula_aluno)
references tbl_aluno(matricula)



);

create table tbl_turma (
id int primary key auto_increment,
sala varchar(45) not null,
qnt_aluno int not null,

tbl_curso_cod_curso varchar(45),

constraint fk_cod_curso
foreign key (tbl_curso_cod_curso)
references tbl_curso(cod_curso)

);



create table tbl_materia(
id int auto_increment primary key ,
professor varchar(45) not null,
nome_materia varchar(100) not null,
tbl_curso_cod_curso int not null,

constraint	fk_materia_curso
foreign key (tbl_curso_cod_curso)
references tbl_curso(cod_curso)
);





