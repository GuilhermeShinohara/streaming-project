CREATE DATABASE IF NOT EXISTS streaming
  DEFAULT CHARACTER SET latin1
  COLLATE latin1_swedish_ci;

USE streaming;

-- ------------------------------------------------------------
-- Tabela: filmes
-- ------------------------------------------------------------
CREATE TABLE `filmes` (
  `id_filme`    int(11)      NOT NULL AUTO_INCREMENT,
  `titulo`      varchar(100) DEFAULT NULL,
  `categoria`   varchar(50)  DEFAULT NULL,
  `duracao_min` int(11)      DEFAULT NULL,
  PRIMARY KEY (`id_filme`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ------------------------------------------------------------
-- Tabela: usuarios
-- ------------------------------------------------------------
CREATE TABLE `usuarios` (
  `id_usuario` int(11)      NOT NULL AUTO_INCREMENT,
  `nome`       varchar(100) DEFAULT NULL,
  `email`      varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ------------------------------------------------------------
-- Tabela: visualizacoes
-- ------------------------------------------------------------
CREATE TABLE `visualizacoes` (
  `id_visualizacao`   int(11) NOT NULL AUTO_INCREMENT,
  `id_usuario`        int(11) DEFAULT NULL,
  `id_filme`          int(11) DEFAULT NULL,
  `tempo_assistido`   int(11) DEFAULT NULL,
  `data_visualizacao` date    DEFAULT NULL,
  PRIMARY KEY (`id_visualizacao`),
  KEY `id_usuario` (`id_usuario`),
  KEY `id_filme`   (`id_filme`),
  CONSTRAINT `visualizacoes_ibfk_1`
    FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`),
  CONSTRAINT `visualizacoes_ibfk_2`
    FOREIGN KEY (`id_filme`)   REFERENCES `filmes`   (`id_filme`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
