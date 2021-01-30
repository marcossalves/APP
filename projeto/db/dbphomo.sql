
create database dbphomo;
use dbphomo;
-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 29-Jan-2021 às 05:00
-- Versão do servidor: 10.4.14-MariaDB
-- versão do PHP: 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `dbphomo`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `cliente`
--

CREATE TABLE `cliente` (
  `idcliente` int(11) NOT NULL,
  `nomecliente` varchar(50) NOT NULL,
  `cpf` varchar(13) NOT NULL,
  `sexo` char(5) NOT NULL,
  `idcontato` int(11) NOT NULL,
  `idendereco` int(11) NOT NULL,
  `idusuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `cliente`
--

INSERT INTO `cliente` (`idcliente`, `nomecliente`, `cpf`, `sexo`, `idcontato`, `idendereco`, `idusuario`) VALUES
(1, 'Marcos', '2252664556', 'M', 1, 1, 1),
(2, 'Simonr', '556789954', 'Femin', 2, 2, 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `contato`
--

CREATE TABLE `contato` (
  `idcontato` int(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `telefone` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `contato`
--

INSERT INTO `contato` (`idcontato`, `email`, `telefone`) VALUES
(1, 'Marcos@gmail.com', '965588231'),
(2, 'Simone@gmail.com', '23568974');

-- --------------------------------------------------------

--
-- Estrutura da tabela `endereco`
--

CREATE TABLE `endereco` (
  `idendereco` int(11) NOT NULL,
  `tipo` varchar(10) NOT NULL,
  `logradouro` varchar(100) NOT NULL,
  `numero` varchar(10) NOT NULL,
  `complemento` varchar(20) NOT NULL,
  `bairro` varchar(50) NOT NULL,
  `cep` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `endereco`
--

INSERT INTO `endereco` (`idendereco`, `tipo`, `logradouro`, `numero`, `complemento`, `bairro`, `cep`) VALUES
(1, 'Rua', ' Nilza', '12', 'apt05', 'Vila Matilde', '564858925'),
(2, 'Av', 'Republica', '23', 'Casa', 'Republica', '56238974');

-- --------------------------------------------------------

--
-- Estrutura da tabela `foto`
--

CREATE TABLE `foto` (
  `idfoto` int(11) NOT NULL,
  `foto1` varchar(200) NOT NULL,
  `foto2` varchar(200) NOT NULL,
  `foto3` varchar(200) NOT NULL,
  `foto4` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `foto`
--

INSERT INTO `foto` (`idfoto`, `foto1`, `foto2`, `foto3`, `foto4`) VALUES
(1, 'Canon EOS250D_1.jpg', 'Canon EOS250D_2.jpg', 'Canon EOS250D_3.jpg', 'Canon EOS250D_4.jpg'),
(2, 'PowerShot SX500_1.jpg', 'PowerShot SX500_2.jpg', 'PowerShot SX500_3.jpg', 'PowerShot SX500_4.jpg'),
(3, 'EOS M10_1.gif', 'EOS M10_2.gif', 'EOS M10_3.gif', 'EOS M10_4.gif'),
(4, 'EOS_M200_1.png', 'EOS_M200_2.png', 'EOS_M200_3.png', 'EOS_M200_4.png'),
(5, 'bolsacanon1.jpg', 'bolsacanon2.jpg', 'bolsacanon3.jpg', 'bolsacanon4.jpg'),
(6, '1', '2', '3', '4'),
(7, 'T7_1.jpg', 'T7_2.jpg', 'T7_3.jpg', 'T7_4.jpg'),
(8, '3', '4', '5', '6'),
(9, 'EF 50mm_1.jpg', 'EF 50mm_2.jpg', 'EF 50mm_3.jpg', 'EF 50mm_4.jpg'),
(10, 'EF 50mm_1.jpg', 'EF 50mm_2.jpg', 'EF 50mm_3.jpg', 'EF 50mm_4.jpg'),
(11, 'EF-S 10-18mm_1.jpg', 'EF-S 10-18mm_2.jpg', 'EF-S 10-18mm_1.jpg', 'EF-S 10-18mm_2.jpg'),
(12, 'Sony Alpha α6000_1.jpg', 'Sony Alpha α6000_2.jpg', 'Sony Alpha α6000_3.jpg', 'Sony Alpha α6000_4.jpg');

-- --------------------------------------------------------

--
-- Estrutura da tabela `itenspedido`
--

CREATE TABLE `itenspedido` (
  `iditens` int(11) NOT NULL,
  `idpedido` int(11) NOT NULL,
  `idproduto` int(11) NOT NULL,
  `quantidade` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `itenspedido`
--

INSERT INTO `itenspedido` (`iditens`, `idpedido`, `idproduto`, `quantidade`) VALUES
(1, 1, 1, 2),
(10, 7, 1, 2),
(11, 7, 2, 5),
(12, 7, 3, 4),
(13, 7, 4, 1),
(14, 40, 1, 2),
(15, 40, 2, 5),
(16, 40, 3, 4),
(17, 40, 4, 1),
(18, 41, 1, 2),
(19, 41, 2, 5),
(20, 41, 3, 4),
(21, 41, 4, 1),
(22, 47, 1, 2),
(23, 47, 2, 5),
(24, 47, 3, 4),
(25, 47, 4, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `pagamento`
--

CREATE TABLE `pagamento` (
  `idpagamento` int(11) NOT NULL,
  `idpedido` int(11) NOT NULL,
  `tipo` varchar(20) NOT NULL,
  `descricao` varchar(200) NOT NULL,
  `valor` decimal(10,2) NOT NULL,
  `parcelas` int(11) NOT NULL DEFAULT 1,
  `valorparcela` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `pagamento`
--

INSERT INTO `pagamento` (`idpagamento`, `idpedido`, `tipo`, `descricao`, `valor`, `parcelas`, `valorparcela`) VALUES
(1, 1, 'cartão', 'Nº 25132456456|Nome:Marcos|Codigo: 76545', '3000.00', 4, '750.00'),
(2, 2, 'Boleto', '', '1600.00', 1, '1600.00'),
(3, 3, 'Boleto', '', '1500.00', 1, '1500.00'),
(4, 4, 'Boleto', '', '100.00', 1, '100.00'),
(7, 7, 'crédito', 'Cartão Master card Maestro', '5200.00', 9, '240.00'),
(8, 8, 'Boleto', '', '1500.00', 1, '1500.00'),
(9, 9, 'Boleto', '', '1500.00', 1, '1500.00'),
(10, 10, 'Boleto', '', '0.00', 1, '0.00'),
(11, 11, 'Boleto', '', '6000.00', 1, '6000.00'),
(12, 12, 'Boleto', '', '1500.00', 1, '1500.00'),
(13, 13, 'Boleto', '', '100.00', 1, '100.00'),
(14, 14, 'Boleto', '', '600.00', 1, '600.00'),
(15, 15, 'crédito', 'Cartão Master card Maestro', '5200.00', 9, '240.00'),
(16, 16, 'crédito', 'Cartão Master card Maestro', '5200.00', 9, '240.00'),
(17, 17, 'crédito', 'Cartão Master card Maestro', '5200.00', 9, '240.00'),
(18, 18, 'crédito', 'Cartão Master card Maestro', '5200.00', 9, '240.00'),
(19, 19, 'crédito', 'Cartão Master card Maestro', '5200.00', 9, '240.00'),
(20, 20, 'crédito', 'Cartão Master card Maestro', '5200.00', 9, '240.00'),
(21, 21, 'crédito', 'Cartão Master card Maestro', '5200.00', 9, '240.00'),
(22, 22, 'crédito', 'Cartão Master card Maestro', '5200.00', 9, '240.00'),
(23, 23, 'crédito', 'Cartão Master card Maestro', '5200.00', 9, '240.00'),
(24, 24, 'crédito', 'Cartão Master card Maestro', '5200.00', 9, '240.00'),
(25, 25, 'crédito', 'Cartão Master card Maestro', '5200.00', 9, '240.00'),
(26, 26, 'crédito', 'Cartão Master card Maestro', '5200.00', 9, '240.00'),
(27, 27, 'crédito', 'Cartão Master card Maestro', '5200.00', 9, '240.00'),
(28, 28, 'crédito', 'Cartão Master card Maestro', '5200.00', 9, '240.00'),
(29, 29, 'crédito', 'Cartão Master card Maestro', '5200.00', 9, '240.00'),
(30, 30, 'crédito', 'Cartão Master card Maestro', '5200.00', 9, '240.00'),
(31, 31, 'crédito', 'Cartão Master card Maestro', '5200.00', 9, '240.00'),
(32, 32, 'crédito', 'Cartão Master card Maestro', '5200.00', 9, '240.00'),
(33, 33, 'crédito', 'Cartão Master card Maestro', '5200.00', 9, '240.00'),
(34, 34, 'crédito', 'Cartão Master card Maestro', '5200.00', 9, '240.00'),
(35, 35, 'crédito', 'Cartão Master card Maestro', '5200.00', 9, '240.00'),
(36, 36, 'Boleto', '', '1500.00', 1, '1500.00'),
(37, 37, 'Boleto', '', '100.00', 1, '100.00'),
(38, 38, 'crédito', 'Cartão Master card Maestro', '5200.00', 9, '240.00'),
(39, 39, 'Boleto', '', '1500.00', 1, '1500.00'),
(40, 40, 'crédito', 'Cartão Master card Maestro', '5200.00', 9, '240.00'),
(41, 41, 'crédito', 'Cartão Master card Maestro', '5200.00', 9, '240.00'),
(42, 42, 'Boleto', '', '300.00', 1, '300.00'),
(43, 43, 'crédito', 'Cartão Master card Maestro', '5200.00', 9, '240.00'),
(44, 44, 'crédito', 'Cartão Master card Maestro', '5200.00', 9, '240.00'),
(45, 45, 'crédito', 'Cartão Master card Maestro', '5200.00', 9, '240.00'),
(46, 46, 'crédito', 'Cartão Master card Maestro', '5200.00', 9, '240.00'),
(47, 47, 'crédito', 'Cartão Master card Maestro', '5200.00', 9, '240.00'),
(48, 48, 'crédito', 'Cartão Master card Maestro', '5200.00', 9, '240.00'),
(49, 49, 'Boleto', '', '1500.00', 1, '1500.00'),
(50, 50, 'Boleto', '', '1500.00', 1, '1500.00'),
(51, 51, 'Boleto', '', '3000.00', 1, '3000.00'),
(52, 52, 'Boleto', '', '1500.00', 1, '1500.00'),
(53, 53, 'Boleto', '', '3000.00', 1, '3000.00'),
(54, 54, 'Boleto', '', '3000.00', 1, '3000.00'),
(55, 55, 'Boleto', '', '1500.00', 1, '1500.00'),
(56, 56, 'Boleto', '', '1500.00', 1, '1500.00'),
(57, 57, 'Boleto', '', '1500.00', 1, '1500.00'),
(58, 58, 'Boleto', '', '6000.00', 1, '6000.00'),
(59, 59, 'Boleto', '', '1500.00', 1, '1500.00'),
(60, 60, 'Boleto', '', '3000.00', 1, '3000.00');

-- --------------------------------------------------------

--
-- Estrutura da tabela `pedido`
--

CREATE TABLE `pedido` (
  `idpedido` int(11) NOT NULL,
  `idcliente` int(11) NOT NULL,
  `datapedido` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `pedido`
--

INSERT INTO `pedido` (`idpedido`, `idcliente`, `datapedido`) VALUES
(1, 1, '2020-12-09 03:32:47'),
(2, 1, '2020-12-09 03:33:49'),
(3, 1, '2020-12-10 20:04:09'),
(4, 1, '2020-12-10 20:38:46'),
(7, 1, '2020-12-11 17:27:05'),
(8, 1, '2020-12-11 18:56:20'),
(9, 1, '2020-12-11 19:12:28'),
(10, 1, '2020-12-11 19:21:13'),
(11, 1, '2020-12-11 19:48:02'),
(12, 1, '2020-12-11 20:41:09'),
(13, 1, '2020-12-11 20:42:35'),
(14, 1, '2020-12-11 20:51:56'),
(15, 1, '2020-12-11 20:53:39'),
(16, 1, '2020-12-11 20:54:07'),
(17, 1, '2020-12-11 20:54:36'),
(18, 1, '2020-12-11 20:55:19'),
(19, 1, '2020-12-11 20:55:37'),
(20, 1, '2020-12-11 20:55:42'),
(21, 1, '2020-12-11 20:56:23'),
(22, 1, '2020-12-11 20:56:28'),
(23, 1, '2020-12-11 20:56:37'),
(24, 1, '2020-12-11 20:56:51'),
(25, 1, '2020-12-11 20:59:27'),
(26, 1, '2020-12-11 21:00:53'),
(27, 1, '2020-12-11 21:01:10'),
(28, 1, '2020-12-11 21:01:17'),
(29, 1, '2020-12-11 21:01:35'),
(30, 1, '2020-12-11 21:03:44'),
(31, 1, '2020-12-11 21:06:02'),
(32, 1, '2020-12-11 21:06:43'),
(33, 1, '2020-12-11 21:57:07'),
(34, 1, '2020-12-11 22:09:36'),
(35, 1, '2020-12-11 22:10:45'),
(36, 1, '2020-12-11 22:11:47'),
(37, 1, '2020-12-11 22:13:28'),
(38, 1, '2020-12-11 22:29:33'),
(39, 1, '2020-12-11 22:57:52'),
(40, 1, '2020-12-11 23:02:12'),
(41, 1, '2020-12-12 01:00:18'),
(42, 1, '2020-12-12 01:22:38'),
(43, 1, '2020-12-23 20:02:44'),
(44, 1, '2020-12-23 20:02:57'),
(45, 1, '2020-12-23 20:04:05'),
(46, 1, '2020-12-23 20:04:12'),
(47, 1, '2020-12-23 20:05:06'),
(48, 1, '2020-12-23 20:06:52'),
(49, 1, '2020-12-23 20:35:07'),
(50, 1, '2021-01-17 21:58:38'),
(51, 1, '2021-01-17 22:55:16'),
(52, 1, '2021-01-28 16:20:15'),
(53, 1, '2021-01-28 16:23:35'),
(54, 1, '2021-01-28 16:30:56'),
(55, 1, '2021-01-28 16:34:45'),
(56, 1, '2021-01-28 16:34:48'),
(57, 1, '2021-01-28 16:35:00'),
(58, 1, '2021-01-28 16:52:36'),
(59, 1, '2021-01-29 03:04:44'),
(60, 1, '2021-01-29 03:20:59');

-- --------------------------------------------------------

--
-- Estrutura da tabela `produto`
--

CREATE TABLE `produto` (
  `idproduto` int(11) NOT NULL,
  `nomeproduto` varchar(50) NOT NULL,
  `descricao` text NOT NULL,
  `preco` decimal(10,2) NOT NULL,
  `idfoto` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `produto`
--

INSERT INTO `produto` (`idproduto`, `nomeproduto`, `descricao`, `preco`, `idfoto`) VALUES
(1, 'Canon EOS250D', 'Câmera Fotográfica EOS 250D 18-55mm Canon..Tipo de sensor: CMOS de 22,3 mm x 14,9 mm.Pixels Efetivos: Aprox. 24,10 megapixels.Total pixels: Aprox. 25,80 megapixels.Relação de aspeto: 3:2.Processador de imagem: DIGIC 8.Encaixe da objetiva: Encaixe EF e EF-S.Distância Focal: Aprox. 1,6x da distância focal da objetiva.Estabilização de Imagem: Estabilizador ótico de imagem em objetivas compatíveis.Tipo de focagem: Através do visor ótico: sistema de deteção de diferença de fase com formação de imagem secundária TTL e sensor AF dedicado. Através da visualização direta na tela LCD: sistema Dual Pixel CMOS AF. Pixels de deteção de fase incorporados no sensor de imagem.Modos AF: AI Focus, One-Shot, AI Servo (algoritmo AI Servo II).Obturador de plano focal, controlado eletronicamente.Tipo de visor: Obturador de plano focal, controlado eletronicamente.Tela de Focagem: Fixo (Tela LCD translúcido para sobreposição de informações).Tipo de monitor LCD: Tela tátil Clear View II TFT 3:2 de ângulo variável de 7,7 cm (3,0', '1500.00', 1),
(2, 'PowerShot SX500 IS', 'A PowerShot SX500 IS oferece todo o poder do super zoom, em uma câmera com o tamanho ideal para ser levada a qualquer lugar! O extremamente potente Zoom Óptico 30x com lente grande angular de 24mm (equivalente 35mm: 24-720mm) permite verdadeira versatilidade, enquanto o estabilizador óptico de imagem assegura imagens nítidas e brilhante em qualquer distância de zoom. A qualidade da imagem é espetacular graças ao sensor de 16.0 megapixels e o processador de imagem Canon DIGIC 4, e você pode gravar vídeos maravilhosamente realistas em HD de 720p com som estéreo ao simples apertar de um botão. Um aprimorado botão Assistente de Enquadramento de Zoom lhe ajuda a rastrear e capturar temas para super telefotografias, e o novo Auto Foco de alta velocidade reduz dramaticamente o tempo de espera, para que nunca perca um clique. Apenas segure a PowerShot SX500 IS na sua mão para entender o que torna seu novo design tão especial. O corpo fino e compacto da câmera é perfeitamente proporcional em relação ao zoom gigante, e seus cantos arredondados com aderências angulares cabem perfeitamente na palma da mão. Use o zoom para capturar esportes, cliques de viagem em grandes ângulos, preserve memórias de eventos especiais em vídeo HD – tudo é possível com a PowerShot SX500 IS!', '1300.00', 2),
(3, 'Canon PowerShot', 'Canon PowerShot SX700 HS. Tipo de câmera: Câmara compacta, Megapixel: 16,1 MP, Dimensão do sensor de imagem: 1/2.3', '2600.00', 3),
(4, 'EOS M200 Content Creator Kit', 'Crie conteúdo que seus seguidores de mídia social irão adorar com o Kit Criador de Conteúdo EOS M200. Equipado com um cartão de memória SDHC de 32 GB e o novíssimo Tripod Grip HG-100TBR com um controle remoto Bluetooth® destacável, você estará pronto para criar incríveis vídeos e imagens 4K 24 / 25p que deixam sua personalidade e habilidades brilho. Além disso, com o suporte de vídeo vertical da EOS M200 *, tecnologia integrada de Wi-Fi® ** e Bluetooth® *** e recursos impressionantes e simples de usar - incluindo Eye Detection AF, filtros criativos e um dispositivo de 3,0 polegadas LCD inclinado - esta câmera compacta com experiência em mídia social será sua escolha para manter os bons tempos.', '1100.00', 4),
(7, 'EOS Rebel T7+', 'Dê os seus primeiros passos na fotografia e comece a contar suas histórias com a DSLR EOS Rebel T7+ e a lente zoom compacta EF-S 18-55mm IS II. Esta câmera de utilização fácil e intuitiva é indicada para principiantes e entusiastas. O app Guia de Fotografia disponibiliza as melhores sugestões e tutoriais sobre como extrair o máximo de sua câmera, incluindo belas fotos e vídeos em Full HD repletos de detalhes, cor e profundidade de campo, e ainda um ótimo desempenho em condições de baixa luz mesmo com um sensor incrível de 24,1 megapixels e de uma lente com zoom para diferentes assuntos. Compartilhar fotos nas redes sociais é muito fácil e efetuar disparos remotos a partir do App Camera Connect da Canon. Basta conectar seu smartphone através do Wi-Fi ¹ ou NFC².', '2500.00', 7),
(9, 'EF 50mm f/1.8 STM', 'Compacta, leve e uma excelente lente para o dia a dia, a Canon EF 50mm f/1.8 STM é uma grande introdução ao mundo das lentes EOS premium. Com uma distância focal efetiva de 80 mm em câmeras APS-C, 50 mm em câmeras full-frame, é uma excelente lente para retratos, ação e mesmo fotografia noturna. Sua abertura máxima de f/1.8 lhe ajuda não só a atingir excelência em pouca luz, mas também capturar imagens nítidas e lindos vídeos com belos desfoques graças à abertura circular de 7 lâminas. ', '800.00', 10),
(10, 'EF-S 10-18mm f/4.5-5.6 IS STM', 'A lente EF-S 10-18mm f/4.5-5.6 IS STM combina excelência ótica com desempenho de ponta, oferecendo ângulo ultra-amplo de visão em um pacote compacto e portátil, ideal para câmeras EOS com sensor APS-C.', '2000.00', 11),
(11, 'Câmera semiprofissional α6000', 'Sensor de imagem APS-C com 24.3 megapixels', '3000.00', 12);

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuario`
--

CREATE TABLE `usuario` (
  `idusuario` int(11) NOT NULL,
  `nomeusuario` varchar(20) NOT NULL,
  `senha` varchar(200) NOT NULL,
  `foto` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `usuario`
--

INSERT INTO `usuario` (`idusuario`, `nomeusuario`, `senha`, `foto`) VALUES
(1, 'admin', '202cb962ac59075b964b07152d234b70', 'admin.png'),
(2, 'Simone', '202cb962ac59075b964b07152d234b70', 'padrao.png');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`idcliente`),
  ADD UNIQUE KEY `cpf` (`cpf`),
  ADD KEY `fk_cliente_pk_contato` (`idcontato`),
  ADD KEY `fk_cliente_pk_endereco` (`idendereco`),
  ADD KEY `fk_cliente_pk_usuario` (`idusuario`);

--
-- Índices para tabela `contato`
--
ALTER TABLE `contato`
  ADD PRIMARY KEY (`idcontato`);

--
-- Índices para tabela `endereco`
--
ALTER TABLE `endereco`
  ADD PRIMARY KEY (`idendereco`);

--
-- Índices para tabela `foto`
--
ALTER TABLE `foto`
  ADD PRIMARY KEY (`idfoto`);

--
-- Índices para tabela `itenspedido`
--
ALTER TABLE `itenspedido`
  ADD PRIMARY KEY (`iditens`),
  ADD KEY `fk_itens_pk_pedido` (`idpedido`),
  ADD KEY `fk_itens_pk_produto` (`idproduto`);

--
-- Índices para tabela `pagamento`
--
ALTER TABLE `pagamento`
  ADD PRIMARY KEY (`idpagamento`),
  ADD KEY `fk_pagamento_pk_pedido` (`idpedido`);

--
-- Índices para tabela `pedido`
--
ALTER TABLE `pedido`
  ADD PRIMARY KEY (`idpedido`),
  ADD KEY `fk_pedido_pk_cliente` (`idcliente`);

--
-- Índices para tabela `produto`
--
ALTER TABLE `produto`
  ADD PRIMARY KEY (`idproduto`),
  ADD KEY `fk_produto_pk_foto` (`idfoto`);

--
-- Índices para tabela `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`idusuario`),
  ADD UNIQUE KEY `nomeusuario` (`nomeusuario`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `cliente`
--
ALTER TABLE `cliente`
  MODIFY `idcliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `contato`
--
ALTER TABLE `contato`
  MODIFY `idcontato` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `endereco`
--
ALTER TABLE `endereco`
  MODIFY `idendereco` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `foto`
--
ALTER TABLE `foto`
  MODIFY `idfoto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de tabela `itenspedido`
--
ALTER TABLE `itenspedido`
  MODIFY `iditens` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT de tabela `pagamento`
--
ALTER TABLE `pagamento`
  MODIFY `idpagamento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT de tabela `pedido`
--
ALTER TABLE `pedido`
  MODIFY `idpedido` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT de tabela `produto`
--
ALTER TABLE `produto`
  MODIFY `idproduto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de tabela `usuario`
--
ALTER TABLE `usuario`
  MODIFY `idusuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `cliente`
--
ALTER TABLE `cliente`
  ADD CONSTRAINT `fk_cliente_pk_contato` FOREIGN KEY (`idcontato`) REFERENCES `contato` (`idcontato`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_cliente_pk_endereco` FOREIGN KEY (`idendereco`) REFERENCES `endereco` (`idendereco`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_cliente_pk_usuario` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`idusuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `itenspedido`
--
ALTER TABLE `itenspedido`
  ADD CONSTRAINT `fk_itens_pk_pedido` FOREIGN KEY (`idpedido`) REFERENCES `pedido` (`idpedido`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_itens_pk_produto` FOREIGN KEY (`idproduto`) REFERENCES `produto` (`idproduto`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `pagamento`
--
ALTER TABLE `pagamento`
  ADD CONSTRAINT `fk_pagamento_pk_pedido` FOREIGN KEY (`idpedido`) REFERENCES `pedido` (`idpedido`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `pedido`
--
ALTER TABLE `pedido`
  ADD CONSTRAINT `fk_pedido_pk_cliente` FOREIGN KEY (`idcliente`) REFERENCES `cliente` (`idcliente`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `produto`
--
ALTER TABLE `produto`
  ADD CONSTRAINT `fk_produto_pk_foto` FOREIGN KEY (`idfoto`) REFERENCES `foto` (`idfoto`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;


select * from usuario;
select * from contato;
select * from endereco;
select * from cliente;
select * from pedido;
select * from itenspedido;
select * from pagamento;
select * from produto;
select * from foto;
select * from pedido; 
select * from acessorio; 
