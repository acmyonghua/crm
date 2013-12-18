drop database CRM;
create database CRM;
use crm;

create table Cliente
(
	cliente_id int not null primary key auto_increment,
	cliente_nome varchar(80) not null,
	cliente_telefone varchar(20) not null,
	cliente_email varchar(50) not null,
	cliente_cpf varchar(11) not null
);

CREATE TABLE Empresa
(
	empresa_id int not null auto_increment primary key ,
	empresa_nome varchar(200) not null,
	empresa_telefone varchar(20),
	empresa_email varchar(50),
	empresa_status tinyint(1) not null,
	empresa_cnpj varchar(14)
);

CREATE TABLE Usuario
(
	usuario_id int not null primary key auto_increment,
	usuario_nome varchar(255) not null,
	usuario_email varchar(75) not null,
	usuario_cpf varchar(11) not null,
	usuario_empresa int not null,
	constraint fk_empresa_usuario foreign key (usuario_empresa) references empresa(empresa_id)
);

create table menu
(
	menu_id int not null primary key auto_increment,
	url_menu varchar(500) not null,
	icone_menu varchar(200) not null,
	titulo_pagina varchar(80) not null
);

create table grupo
(
	grupo_id int not null primary key auto_increment,
	grupo_nome varchar(100) not null
);

create table menu_grupo
(
	id_menu_grupo int not null primary key auto_increment,
	menu_grupo_menu int not null,
	menu_grupo_grupo int not null,
	constraint fk_menu_grupo_menu foreign key (menu_grupo_menu) references menu(menu_id),
	constraint fk_menu_grupo_grupo foreign key(menu_grupo_grupo) references grupo(grupo_id)
);