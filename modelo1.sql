-- ---
-- Globals
-- ---

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET FOREIGN_KEY_CHECKS=0;

-- ---
-- Table 'instituição'
-- 
-- ---

DROP TABLE IF EXISTS `instituição`;
		
CREATE TABLE `instituição` (
  `id` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `descrição` VARCHAR NULL DEFAULT NULL,
  `horas de trabalho` INTEGER NULL DEFAULT NULL,
  `avaliação` INTEGER NULL DEFAULT NULL,
  `posts` INTEGER NULL DEFAULT NULL,
  `voluntariados (id)` INTEGER NULL DEFAULT NULL,
  `permissões` INTEGER NULL DEFAULT NULL,
  `senha (hash)` VARCHAR NULL DEFAULT NULL,
  `Email` VARCHAR NULL DEFAULT NULL,
  `CNPJ` INTEGER NULL DEFAULT NULL,
  `foto de perfil (id)` INTEGER NULL DEFAULT NULL,
  `Nome fantasia` INTEGER NULL DEFAULT NULL,
  `tipo` INTEGER NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'Post'
-- 
-- ---

DROP TABLE IF EXISTS `Post`;
		
CREATE TABLE `Post` (
  `id` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `data` INTEGER NULL DEFAULT NULL,
  `hora` INTEGER NULL DEFAULT NULL,
  `descrição` INTEGER NULL DEFAULT NULL,
  `comentários (id)` INTEGER NULL DEFAULT NULL,
  `Nome fantasia` INTEGER NULL DEFAULT NULL,
  PRIMARY KEY (`id`, `Nome fantasia`)
);

-- ---
-- Table 'comentario'
-- 
-- ---

DROP TABLE IF EXISTS `comentario`;
		
CREATE TABLE `comentario` (
  `id` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `Conteúdo` VARCHAR NULL DEFAULT NULL,
  `foto de perfil (id)` INTEGER NULL DEFAULT NULL,
  `hora` INTEGER NULL DEFAULT NULL,
  `Nome fantasia` INTEGER NULL DEFAULT NULL,
  PRIMARY KEY (`id`, `Nome fantasia`, `foto de perfil (id)`)
);

-- ---
-- Table 'Voluntariado'
-- 
-- ---

DROP TABLE IF EXISTS `Voluntariado`;
		
CREATE TABLE `Voluntariado` (
  `id` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `Nome` INTEGER NULL DEFAULT NULL,
  `descrição` VARCHAR NULL DEFAULT NULL,
  `Users (id)` INTEGER NULL DEFAULT NULL,
  `horas` INTEGER NULL DEFAULT NULL,
  PRIMARY KEY (`id`, `Users (id)`)
);

-- ---
-- Table 'User'
-- 
-- ---

DROP TABLE IF EXISTS `User`;
		
CREATE TABLE `User` (
  `id` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `senha (hash)` INTEGER NULL DEFAULT NULL,
  `Email` INTEGER NULL DEFAULT NULL,
  `CPF` INTEGER NULL DEFAULT NULL,
  `foto de perfil (id)` INTEGER NULL DEFAULT NULL,
  `premissões` INTEGER NULL DEFAULT NULL,
  `voluntariados (id)` INTEGER NULL DEFAULT NULL,
  `horas de trabalho` INTEGER NULL DEFAULT NULL,
  `descrição` INTEGER NULL DEFAULT NULL,
  `posts` INTEGER NULL DEFAULT NULL,
  `Data de cadastro` INTEGER NULL DEFAULT NULL,
  `Tags` INTEGER NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'tipo'
-- 
-- ---

DROP TABLE IF EXISTS `tipo`;
		
CREATE TABLE `tipo` (
  `id` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `Empresa` INTEGER NULL DEFAULT NULL,
  `ONG` INTEGER NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Foreign Keys 
-- ---

ALTER TABLE `instituição` ADD FOREIGN KEY (posts) REFERENCES `Post` (`id`);
ALTER TABLE `instituição` ADD FOREIGN KEY (voluntariados (id)) REFERENCES `Voluntariado` (`id`);
ALTER TABLE `instituição` ADD FOREIGN KEY (foto de perfil (id)) REFERENCES `comentario` (`foto de perfil (id)`);
ALTER TABLE `instituição` ADD FOREIGN KEY (Nome fantasia) REFERENCES `comentario` (`Nome fantasia`);
ALTER TABLE `instituição` ADD FOREIGN KEY (Nome fantasia) REFERENCES `Post` (`Nome fantasia`);
ALTER TABLE `instituição` ADD FOREIGN KEY (tipo) REFERENCES `tipo` (`id`);
ALTER TABLE `Post` ADD FOREIGN KEY (comentários (id)) REFERENCES `comentario` (`id`);
ALTER TABLE `Voluntariado` ADD FOREIGN KEY (Users (id)) REFERENCES `User` (`id`);
ALTER TABLE `User` ADD FOREIGN KEY (posts) REFERENCES `Post` (`id`);

-- ---
-- Table Properties
-- ---

ALTER TABLE `instituição` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
ALTER TABLE `Post` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
ALTER TABLE `comentario` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
ALTER TABLE `Voluntariado` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
ALTER TABLE `User` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
ALTER TABLE `tipo` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ---
-- Test Data
-- ---

INSERT INTO `instituição` (`id`,`descrição`,`horas de trabalho`,`avaliação`,`posts`,`voluntariados (id)`,`permissões`,`senha (hash)`,`Email`,`CNPJ`,`foto de perfil (id)`,`Nome fantasia`,`tipo`) VALUES
('','','','','','','','','','','','','');
INSERT INTO `Post` (`id`,`data`,`hora`,`descrição`,`comentários (id)`,`Nome fantasia`) VALUES
('','','','','','');
INSERT INTO `comentario` (`id`,`Conteúdo`,`foto de perfil (id)`,`hora`,`Nome fantasia`) VALUES
('','','','','');
INSERT INTO `Voluntariado` (`id`,`Nome`,`descrição`,`Users (id)`,`horas`) VALUES
('','','','','');
INSERT INTO `User` (`id`,`senha (hash)`,`Email`,`CPF`,`foto de perfil (id)`,`premissões`,`voluntariados (id)`,`horas de trabalho`,`descrição`,`posts`,`Data de cadastro`,`Tags`) VALUES
('','','','','','','','','','','','');
INSERT INTO `tipo` (`id`,`Empresa`,`ONG`) VALUES
('','','');