-- phpMyAdmin SQL Dump
-- version 4.0.9
-- http://www.phpmyadmin.net
--
-- Máquina: 127.0.0.1
-- Data de Criação: 20-Set-2017 às 21:45
-- Versão do servidor: 5.6.14
-- versão do PHP: 5.5.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de Dados: `games`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `cidades`
--

CREATE TABLE IF NOT EXISTS `cidades` (
  `cod` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(40) NOT NULL,
  PRIMARY KEY (`cod`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Extraindo dados da tabela `cidades`
--

INSERT INTO `cidades` (`cod`, `nome`) VALUES
(1, 'Porto Alegre'),
(2, 'Novo Hamburgo'),
(3, 'Sao Leopoldo'),
(4, 'Portao'),
(5, 'Ivoti'),
(6, 'Paris'),
(7, 'Bucareste'),
(8, 'New York'),
(9, 'Lima');

-- --------------------------------------------------------

--
-- Estrutura da tabela `classificacao`
--

CREATE TABLE IF NOT EXISTS `classificacao` (
  `cod` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(20) NOT NULL,
  PRIMARY KEY (`cod`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Extraindo dados da tabela `classificacao`
--

INSERT INTO `classificacao` (`cod`, `nome`) VALUES
(1, 'A'),
(2, 'R'),
(3, 'RR'),
(4, 'T');

-- --------------------------------------------------------

--
-- Estrutura da tabela `fabricantes`
--

CREATE TABLE IF NOT EXISTS `fabricantes` (
  `cod` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  PRIMARY KEY (`cod`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Extraindo dados da tabela `fabricantes`
--

INSERT INTO `fabricantes` (`cod`, `nome`) VALUES
(1, 'EA'),
(2, 'Sony'),
(3, 'UBISoft'),
(4, 'TGS'),
(5, 'Cupcake');

-- --------------------------------------------------------

--
-- Estrutura da tabela `forum`
--

CREATE TABLE IF NOT EXISTS `forum` (
  `cod` int(11) NOT NULL AUTO_INCREMENT,
  `codUsuario` int(11) NOT NULL,
  `titulo` varchar(30) NOT NULL,
  `mensagem` varchar(50) NOT NULL,
  PRIMARY KEY (`cod`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Extraindo dados da tabela `forum`
--

INSERT INTO `forum` (`cod`, `codUsuario`, `titulo`, `mensagem`) VALUES
(1, 3, 'teste', 'duvidas'),
(2, 16, 'ajuda', 'estou precisando de ajuda'),
(3, 8, 'ola', 'alguem ai?');

-- --------------------------------------------------------

--
-- Stand-in structure for view `jogosporusuario`
--
CREATE TABLE IF NOT EXISTS `jogosporusuario` (
`usuario` varchar(45)
,`jogo` varchar(45)
);
-- --------------------------------------------------------

--
-- Estrutura da tabela `tab_joga`
--

CREATE TABLE IF NOT EXISTS `tab_joga` (
  `cod` int(11) NOT NULL AUTO_INCREMENT,
  `quem` int(11) NOT NULL,
  `qual` int(11) NOT NULL,
  PRIMARY KEY (`cod`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Extraindo dados da tabela `tab_joga`
--

INSERT INTO `tab_joga` (`cod`, `quem`, `qual`) VALUES
(1, 1, 1),
(2, 4, 5),
(3, 1, 7),
(4, 5, 6),
(5, 6, 3),
(6, 7, 3);

-- --------------------------------------------------------

--
-- Estrutura da tabela `titulos`
--

CREATE TABLE IF NOT EXISTS `titulos` (
  `cod` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  `fabricante` int(11) NOT NULL,
  `preco` float NOT NULL,
  `classificacao` int(11) NOT NULL,
  PRIMARY KEY (`cod`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=19 ;

--
-- Extraindo dados da tabela `titulos`
--

INSERT INTO `titulos` (`cod`, `nome`, `fabricante`, `preco`, `classificacao`) VALUES
(1, 'Castle Wolfenstein', 2, 32.5, 1),
(2, 'The Ville', 4, 35, 4),
(3, 'Snapper', 1, 99, 1),
(4, 'RailMaze', 5, 0, 2),
(5, 'Botanicula', 1, 29, 2),
(6, 'Avadon', 1, 9.99, 4),
(7, 'BOH', 2, 0, 2),
(8, 'pacman', 2, 1.99, 1),
(17, 'Samarost', 5, 23.55, 2),
(18, 'Zooder', 3, 123.77, 3);

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuarios`
--

CREATE TABLE IF NOT EXISTS `usuarios` (
  `cod` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  `nick` varchar(12) NOT NULL,
  `cidade` int(11) NOT NULL,
  `email` varchar(45) NOT NULL,
  `idade` int(11) NOT NULL,
  PRIMARY KEY (`cod`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=76 ;

--
-- Extraindo dados da tabela `usuarios`
--

INSERT INTO `usuarios` (`cod`, `nome`, `nick`, `cidade`, `email`, `idade`) VALUES
(1, 'Joao Carlos', 'jcarlos', 3, 'jcarlos11@gmail.com', 32),
(3, 'Mario Andrade', 'marand', 3, 'mar@globo.com', 23),
(6, 'Paula T.', 'paulat', 3, 'paulat@yahoo.com', 18),
(8, 'Carina Muller', 'carina', 5, 'carinamu@gmail.com', 22),
(9, 'Laercio Montana', 'lau', 1, 'laulau@gmail.com', 45),
(13, 'lucasburguer', 'luc', 2, 'lburg_gmail.com', 23),
(14, 'johnyburguer', 'luc', 3, 'lburg_gmail.com', 45),
(49, 'alex ale', 'al', 2, 'alex@gmail.com', 34),
(71, 'Jacson Guimaraes', 'jacson', 8, 'jacsongui@hotmail.com', 23),
(72, 'Zenaide Almeida', 'zen', 7, 'zen@gmail.com', 61),
(73, 'Beto Lima', 'beto', 4, 'beto@gmail.com', 28),
(74, 'Daniel Marson', 'dani', 2, 'dani@gmail.com', 17),
(75, 'Nair Resende', 'nair', 6, 'nair@terra.com.br', 18);

-- --------------------------------------------------------

--
-- Structure for view `jogosporusuario`
--
DROP TABLE IF EXISTS `jogosporusuario`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `jogosporusuario` AS select `usuarios`.`nome` AS `usuario`,`titulos`.`nome` AS `jogo` from ((`usuarios` join `tab_joga`) join `titulos`) where ((`usuarios`.`cod` = `tab_joga`.`quem`) and (`tab_joga`.`qual` = `titulos`.`cod`));

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
