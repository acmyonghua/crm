DROP DATABASE IF EXISTS willi314_crm;
CREATE DATABASE willi314_crm;
USE willi314_crm;

CREATE TABLE cliente (
    cliente_id INT(10) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    cliente_razao_social VARCHAR(255) NOT NULL,
    cliente_nome_fantasia VARCHAR(255) NOT NULL,
    cliente_telefone_fixo VARCHAR(20) NOT NULL,
    cliente_telefone_celular VARCHAR(20) NOT NULL,
    cliente_telefone_comercial VARCHAR(20) NOT NULL,
    cliente_email VARCHAR(50) NOT NULL,
    cliente_cpf VARCHAR(14),
    cliente_cnpj VARCHAR(18),
    cliente_endereco VARCHAR(255),
    cliente_endereco_complemento VARCHAR(255),
    cliente_endereco_numero VARCHAR(20),
    cliente_bairro VARCHAR(255),
    cliente_cidade INT(10) UNSIGNED,
    cliente_uf INT(10) UNSIGNED,
    cliente_cep VARCHAR(10),
    cliente_status TINYINT(1) DEFAULT 1,
    cliente_obs TEXT
) ENGINE=InnoDB;

CREATE TABLE empresa (
    empresa_id INT(10) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    empresa_nome VARCHAR(200) NOT NULL,
    empresa_telefone VARCHAR(20),
    empresa_email VARCHAR(50),
    empresa_status TINYINT(1) DEFAULT 1,
    empresa_cnpj VARCHAR(14)
) ENGINE=InnoDB;

CREATE TABLE usuario (
    usuario_id INT(10) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    usuario_nome VARCHAR(255) NOT NULL,
    usuario_email VARCHAR(255) NOT NULL,
    usuario_senha VARCHAR(100) NOT NULL,
    usuario_status TINYINT(1) DEFAULT 1,
    usuario_empresa INT(10) UNSIGNED NOT NULL
) ENGINE=InnoDB;

CREATE TABLE menu (
    menu_id INT(10) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    menu_url VARCHAR(255),
    menu_icone VARCHAR(50),
    menu_titulo VARCHAR(255),
    menu_superior INT(10) UNSIGNED
) ENGINE=InnoDB;

CREATE TABLE grupo (
    grupo_id INT(10) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    grupo_nome VARCHAR(100) NOT NULL
) ENGINE=InnoDB;

CREATE TABLE menu_grupo (
    menu_grupo_id INT(10) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    menu_grupo_menu INT(10) UNSIGNED NOT NULL,
    menu_grupo_grupo INT(10) UNSIGNED NOT NULL
) ENGINE=InnoDB;

CREATE TABLE usuario_grupo (
	usuario_grupo_id INT(10) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
	usuario_grupo_usuario INT(10) UNSIGNED NOT NULL,
	usuario_grupo_grupo INT(10) UNSIGNED NOT NULL
) ENGINE=InnoDB;

ALTER TABLE usuario
ADD CONSTRAINT fk_usuario_empresa FOREIGN KEY (usuario_empresa) REFERENCES empresa(empresa_id);

ALTER TABLE menu_grupo
ADD CONSTRAINT fk_menu_grupo_menu FOREIGN KEY (menu_grupo_menu) REFERENCES menu(menu_id),
ADD CONSTRAINT fk_menu_grupo_grupo FOREIGN KEY(menu_grupo_grupo) REFERENCES grupo(grupo_id);

ALTER TABLE usuario_grupo
ADD CONSTRAINT fk_usuario_grupo_usuario FOREIGN KEY (usuario_grupo_usuario) REFERENCES usuario(usuario_id),
ADD CONSTRAINT fk_usuario_grupo_grupo FOREIGN KEY(usuario_grupo_grupo) REFERENCES grupo(grupo_id);