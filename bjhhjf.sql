
CREATE DATABASE biblioteca20;
USE biblioteca20;
CREATE TABLE `autor` (
  `cd` int(11) NOT NULL,
  `nome` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Despejando dados para a tabela `autor`
--

INSERT INTO `autor` (`cd`, `nome`) VALUES
(1, 'Victor Hugo'),
(2, 'Charles Dickens'),
(3, 'Mary Shelley'),
(4, 'Dante Alighieri'),
(5, 'H.P. Lovecraft'),
(6, 'Liev Tolstoy'),
(7, 'Pablo D\'aglio'),
(8, 'Jorge Amado'),
(9, 'Nicolau Maquiavel'),
(10, 'Guimarães Rosa'),
(11, 'Clarice Lispector'),
(12, 'Carlos Drummond de Andrade'),
(13, 'José de Alencar'),
(14, 'Monteiro Lobato'),
(15, 'Danton Matos'),
(16, 'Roberto Justus'),
(17, 'Mark Twain'),
(18, 'Emily Dickinson'),
(22, 'arthur aguiar'),
(23, 'Edgar Allan Poe'),
(35, 'Neil Gaiman'),
(36, 'Lancelotti'),
(37, 'Alucard'),
(54, 'Pablo Coelho'),
(55, 'Martin, Robert Cecil'),
(66, 'Jeff Kinney'),
(67, 'augustinho carrara'),
(123, 'Rick Riordan'),
(243, 'Alberto Manguel'),
(256, 'Vera Ribeiro'),
(335, NULL),
(336, 'Programação'),
(337, NULL),
(338, 'Machado de Assis'),
(339, 'William Shakespeare'),
(340, 'Federico García Lorca'),
(341, NULL),
(342, NULL),
(343, 'Lampeao'),
(1772, NULL),
(1773, 'Daniel Geraldino'),
(1774, 'angelica bisteca'),
(1775, NULL),
(1776, 'Careles Whisper'),
(1777, 'Teseu'),
(1778, NULL),
(1779, 'comedia das boas'),
(1780, NULL),
(1781, NULL),
(1782, NULL),
(1783, NULL),
(1784, NULL),
(1785, NULL),
(1786, 'Carlos Melo'),
(1787, 'Stephen King'),
(1788, 'Machado de Assis'),
(1789, 'Clarice Lispector'),
(1790, 'Aluísio de Azevedo'),
(1791, 'Matthew Stover'),
(1792, 'Robert E. Vardeman'),
(1793, 'J. K. Rowling');

-- --------------------------------------------------------

--
-- Estrutura para tabela `autor_livro`
--

CREATE TABLE `autor_livro` (
  `id_livro` int(11) NOT NULL,
  `id_autor` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Despejando dados para a tabela `autor_livro`
--

INSERT INTO `autor_livro` (`id_livro`, `id_autor`) VALUES
(1, 6),
(3, 9),
(15, 14),
(16, 15),
(10, 11),
(26, 341),
(27, 342),
(24, 15),
(25, 339),
(353, 1788),
(354, 1789),
(355, 1791),
(356, 1792);

-- --------------------------------------------------------

--
-- Estrutura para tabela `editora`
--

CREATE TABLE `editora` (
  `cd` int(11) NOT NULL,
  `nome` varchar(80) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Despejando dados para a tabela `editora`
--

INSERT INTO `editora` (`cd`, `nome`) VALUES
(1, 'Intrínseca'),
(2, 'DarkSide Books'),
(3, 'Ateliê Editorial'),
(4, 'Editora 34'),
(5, 'Erika'),
(6, 'LeYa'),
(7, 'Cosac Naify'),
(8, 'Editora JBC'),
(9, 'Editora Euphoria'),
(10, 'Hunter Books'),
(13, 'hunter'),
(24, 'linhares editora'),
(69, 'editora clean'),
(70, 'Novatec'),
(71, 'Martin Claret'),
(72, 'Ática'),
(73, 'Turbo simas'),
(74, 'TELASKO AVARA'),
(123, 'LivroMais'),
(200, 'aquinorego'),
(201, 'jdceditora1'),
(202, 'jdceditora2'),
(203, 'jdceditora3'),
(204, 'Alta Books'),
(205, 'Treasure book'),
(666, 'editora sagacidade'),
(667, 'Aventura'),
(668, 'Belem'),
(669, 'Editora Itanhaem'),
(670, 'Toey'),
(671, 'jacu'),
(672, 'A melhor de todas'),
(673, 'Bruncer'),
(674, 'Faro Editorial'),
(675, 'Companhia das Letras'),
(676, 'Suma'),
(677, 'Principis'),
(678, 'Companhia das Letras'),
(679, 'Bloomsbury');

-- --------------------------------------------------------

--
-- Estrutura para tabela `emprestimo`
--

CREATE TABLE `emprestimo` (
  `cd` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `id_livro` int(11) NOT NULL,
  `dt_emprestimo` date DEFAULT NULL,
  `dt_devolucao` date DEFAULT NULL,
  `status` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `favorito`
--

CREATE TABLE `favorito` (
  `cd` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `id_livro` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `fila`
--

CREATE TABLE `fila` (
  `cd` int(11) NOT NULL,
  `id_livro` int(11) DEFAULT NULL,
  `id_usuario` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `genero`
--

CREATE TABLE `genero` (
  `cd` int(11) NOT NULL,
  `nome` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Despejando dados para a tabela `genero`
--

INSERT INTO `genero` (`cd`, `nome`) VALUES
(1, 'Comédia'),
(2, 'Romance'),
(3, 'Terror'),
(4, 'Tragédia'),
(5, 'Suspense'),
(6, 'Romance'),
(7, 'Fantasia'),
(8, 'Ação'),
(9, 'Autoajuda'),
(10, 'Ficção Científica'),
(11, 'Horror'),
(12, 'Ficção Policial'),
(13, 'Graphic Novel'),
(14, 'Drama'),
(15, 'História'),
(16, 'Ciências'),
(17, 'Filosofia'),
(18, 'Documentário'),
(19, 'Poesia'),
(111, NULL),
(112, 'Informática'),
(113, 'Ação'),
(114, NULL),
(115, NULL),
(134, 'terror'),
(200, 'Ação'),
(230, 'terror'),
(234, 'romance'),
(244, NULL),
(300, 'romance'),
(431, NULL),
(500, 'comédia'),
(501, 'terror divertido'),
(502, 'comedia bipolar'),
(503, 'Aventura'),
(504, 'Programação'),
(505, 'Ação'),
(506, NULL),
(507, 'Ação'),
(508, 'Romance'),
(509, 'Aventura'),
(510, 'Grecia'),
(511, 'Mitologico'),
(512, 'comedia das boas'),
(513, 'drmaticao'),
(514, 'romance'),
(700, 'romance'),
(701, 'M'),
(702, 'F'),
(703, 'suspense'),
(704, 'terror'),
(705, 'Filosofia'),
(706, 'Filosofia'),
(707, 'Sei'),
(708, 'La'),
(709, 'E'),
(710, 'Infantil'),
(711, 'terror'),
(712, 'terror'),
(714, '1'),
(715, 'romance'),
(716, 'poesia'),
(717, 'poesia'),
(718, 'romance'),
(719, 'Ficçao Fantasiosa'),
(720, 'distopia');

-- --------------------------------------------------------

--
-- Estrutura para tabela `livro`
--

CREATE TABLE `livro` (
  `cd` int(11) NOT NULL,
  `isbn` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `titulo` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ano` int(4) DEFAULT NULL,
  `qtd` int(11) DEFAULT NULL,
  `sinopse` longtext COLLATE utf8_unicode_ci,
  `capa` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `classificacao` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_editora` int(11) NOT NULL,
  `id_genero` int(11) NOT NULL,
  `estado` longtext COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Despejando dados para a tabela `livro`
--

INSERT INTO `livro` (`cd`, `isbn`, `titulo`, `ano`, `qtd`, `sinopse`, `capa`, `classificacao`, `id_editora`, `id_genero`, `estado`) VALUES
(1, '8535930043', 'Guerra e Paz', 20171121, 2, 'Nos anos que precederam a invasão de Napoleão, os membros da aristocracia russa enfrentam muitas tragédias pessoais. Depois que seu pai morre, o Conde Pierre Bezukhov (Henry Fonda), um amigo do príncipe Andrei Bolkonsky (Mel Ferrer), recebe uma herança. Quando ele decide se casar, Bezukhov imprudentemente escolhe uma maldosa princesa (Anita Ekberg). Quanto a Bolkonsky, sua esposa morre durante o parto, logo ele se apaixona por Natasha Rostova (Audrey Hepburn), mas é chamado para a guerra.', 'https://images-na.ssl-images-amazon.com/images/I/91uLwQ4Ry8L.jpg', '10', 675, 14, 'Conservado'),
(2, '9788594541475', 'Lady Killers: Assassinas em série', 2019, 2, 'Quando pensamos em assassinos em série, pensamos em homens. Mais precisamente, em homens matando mulheres inocentes, vítimas de um apetite atroz por sangue e uma vontade irrefreável de carnificina.', NULL, '16', 2, 18, 'perfeito estado, todas as folhas e capa no lugar'),
(3, '8565042022', 'O Principe', 2022, 2, 'É uma obra que ensina a agir segundo as circunstâncias e as necessidades, reconsiderando o caráter pejorativo do adjetivo maquiavélico, procurando sempre o apoio maior do povo, por meio da sua proteção e prosperidade, pois é o povo, consciente ou não, a força maior de um Estado.', NULL, 'Livre', 10, 17, 'Meio Véio tlgd parça'),
(4, '978-85-7522-137-2', 'PHP Programando com Orientação a Objetos - 1ª Edição', 2007, 1, '\nO PHP é uma das linguagens mais utilizadas no mundo. Sua popularidade se deve à facilidade em criar aplicações dinâmicas com suporte à maioria dos bancos de dados existentes e ao conjunto de funções que, por meio de uma estrutura flexível de programação, permitem desde a criação de simples portais até complexas aplicações de negócio.', 'https://s3.novatec.com.br/capas-ampliadas/capa-ampliada-9788575221372.jpg', 'livre', 70, 112, ''),
(5, '9788566636239', 'Drácula', 2018, 1, 'A obra atemporal de Bram Stoker narra, por meio de fragmentos de cartas, diários e notícias de jornal, a história de humanos lutando para sobreviver às investidas do vampiro Drácula.', NULL, '16', 2, 10, 'Estado bom, mas capa amassada'),
(7, '8903', 'O Conto do Palhaçinho', 1992, 1, 'A historia de um palhaçinho muito travesso', NULL, 'Apartir de 69 Anos de Idade', 73, 113, 'Diponivel para sempre'),
(8, '4764', 'Memórias Póstumas de Brás Cubas', 2021, 30, 'Um cara muito rico que precisa de uma namorada', NULL, 'Apartir de 13 Anos de Idade', 74, 114, 'Disponivel por 5 anos'),
(10, '3580', 'Os Setes Maridos de Evelyn Hugo', 2022, 30, 'alguem que precisa trocar de nome', NULL, 'Apartir de 16 Anos de Idade', 200, 200, 'Disponivel por 2 anos'),
(15, 'jdc codigo 1', 'Dom Casmurro', 2022, 1, 'o terror de fazer deploy as 23h', NULL, 'para maiores de 40 anos', 202, 502, 'queimado'),
(16, 'jdc codigo 2', 'O CHAMADO', 1922, 0, 'O CHAMADO NUMA  SEXTA FEIRA 13 ÀS 18H...', NULL, 'para maiores de 60 anos', 201, 501, 'ESCONDIDO'),
(17, '7070', 'Sword Art Online', 2010, 10, 'Só assistir o anime', NULL, '10', 9, 1, 'Mundo do Sword'),
(18, '7070', 'Sword Art Online', 2010, 10, 'Só assistir o anime', NULL, '10', 9, 1, 'Mundo do Sword'),
(19, '8594318855', 'Quincas Borba', 20191021, 2, 'O romance a ascensão social de Rubião que, após receber toda a herança do filósofo louco Quincas Borba - criador da filosofia Humanitas e muda-se para a Corte no final do século XlX. N viagem de trem rumo à capital, Rubião conhece o casal Sofia e Cristiano Palha, qua percebe estar diante de um ingênuo - e agora rico - provinciano: impressão que também é compartilhada por todos os que estão ao seu redor. As desventuras de Rubião e sua relação com os amigos parasitários dão a tônica da obra, que critica o convívio social e os valores morais e éticos vigentes na época.', 'https://images-na.ssl-images-amazon.com/images/I/412+SGWI4PL._SX331_BO1,204,203,200_.jpg', '12', 677, 14, 'Conservado'),
(20, '7070', 'Sword Art Online', 2010, 10, 'Só assistir o anime', NULL, '10', 9, 1, 'Mundo do Sword'),
(21, '70', 'Kirito boladão a saga', 2012, 10, 'Num é legal isso', NULL, '10', 9, 2, 'Mundo do Sword 2'),
(22, '7070', 'Sword Art Online', 2010, 10, 'Só assistir o anime', NULL, '10', 9, 1, 'Mundo do Sword'),
(23, '70', 'Kirito boladão a saga', 2012, 10, 'Num é legal isso', NULL, '10', 9, 2, 'Mundo do Sword 2'),
(24, NULL, 'Jason - o assassino', NULL, NULL, NULL, NULL, NULL, 668, 506, NULL),
(25, NULL, 'É Proibido Chorar', NULL, NULL, 'um mistério envolvendo crianças e suas aventuras .', NULL, NULL, 668, 505, NULL),
(26, NULL, 'growth', NULL, NULL, NULL, NULL, NULL, 669, 508, NULL),
(27, '8581050484', 'O Iluminado', 20121119, 1, 'O romance, magistralmente levado ao cinema por Stanley Kubrick, continua apaixonando (e aterrorizando) novas gerações de leitores. A luta assustadora entre dois mundos. Um menino e o desejo assassino de poderosas forças malignas. Uma família refém do mal. Nesta guerra sem testemunhas, vencerá o mais forte. Danny Torrance não é um menino comum. É capaz de ouvir pensamentos e transportar-se no tempo. Danny é iluminado. Será uma maldição ou uma bênção? A resposta pode estar guardada na imponência assustadora do hotel Overlook. Em O iluminado, quando Jack Torrance consegue o emprego de zelador no velho hotel, todos os problemas da família parecem estar solucionados. Não mais o desemprego e as noites de bebedeiras. Não mais o sofrimento da esposa, Wendy. Tranquilidade e ar puro para o pequeno Danny livrar-se das convulsões que assustam a família. Só que o Overlook não é um hotel comum. O tempo esqueceu-se de enterrar velhos ódios e de cicatrizar antigas feridas, e espíritos malignos ainda residem nos corredores. O hotel é uma chaga aberta de ressentimento e desejo de vingança. É uma sentença de morte. E somente os poderes de Danny podem fazer frente à disseminação do mal.', 'https://images-na.ssl-images-amazon.com/images/I/51qNYKYrFHS._SX346_BO1,204,203,200_.jpg', '18', 676, 3, NULL),
(28, '9788576082675', 'Codigo Limpo', 2018, 100, 'aprende programar sem cordigo porco', 'https://m.media-amazon.com/images/I/41IRFCLk-kL._SY346_.jpg', 'L', 204, 504, 'bom'),
(29, '-8360', 'A arte da guerra', 2010, 100, 'A arte da guerra, são discutidos todos os aspectos da guerra ', 'https://cdn.record.com.br/wp-content/uploads/2020/08/25160528/14766-768x1249.jpeg', '18', 204, 507, 'capa rasgada folhas velhas'),
(30, NULL, 'a culpa é das estrelas', 2010, 4, 'romance muito triste que te faz chorar no fim', NULL, '18', 123, 234, 'parque'),
(31, NULL, 'um dia muito louco', 2022, 3, 'um dia no baile com os mais que amigos friends', NULL, 'apartir dos 16', 24, 244, 'na delegacia'),
(32, NULL, 'percy jackson', 2011, 5, 'semi deuses em uma viagem', NULL, '16', 123, 134, 'mar'),
(33, NULL, 'festa junina', 1200, 1, 'uma festa das antigas', NULL, 'apartir do que quiser', 24, 431, 'ausente'),
(35, '8595086788', 'assasinato no expresso no oriente', 2018, 4, 'um assasinato aconteceu e o pessoal tá tentando descobrir', NULL, '16', 13, 230, 'são paulo'),
(324, '8555340942', 'vermelho, branco e sangue azul', 2020, 5, 'dois meninos se apaixonam loucamente, é isso, depois procura para ler aí', NULL, '16', 13, 700, 'londres'),
(331, '57851189996706098', 'O Pequeno Príncipe', 2022, 100, 'O Pequeno Príncipe é uma obra literária do escritor francês Antoine de Saint-Exupéry, que conta a história da amizade entre um homem frustrado por ninguém compreender os seus desenhos, com um principezinho que habita um asteroide no espaço.', 'https://1.bp.blogspot.com/-1uooVifUquw/X7EV6403piI/AAAAAAAAHVg/fcg8ZMO-jqQu0NlkznpJF_PQkoWUhKtBQCLcBGAsYHQ/s293/1.jpg', '10', 674, 710, 'Conservado'),
(332, '17158589360852069', 'Livro ((Dela)))', 2022, 100, 'Esse livro conta a historia do unico predador do chupa cu. Mas não se enganem, ele não é do bem ', NULL, '18', 667, 3, 'reliquia'),
(337, '41092080671920853', 'Droga de Americana', 2022, 100, 'um mistério de assasinato e desaparecimento em uma certa cidade,o passado volta a tona.', NULL, '18', 667, 3, 'reliquia'),
(342, '455451', 'Cefalonia', 493, 1, 'O incrivel Alexios e sua jornado por Cefalônia', NULL, '18', 670, 510, 'livro encontrado em Beôcia, na guerra dos peloponesos'),
(343, '455451ns', 'Terror SeperntinoUp', 453, 23, 'O grande guerreiro contra o terror serpentino', NULL, '18', 670, 511, 'livro encontrado em Beôcia, na guerra dos peloponesos'),
(344, '455451', 'Cefalonia', 493, 1, 'O incrivel Alexios e sua jornado por Cefalônia', NULL, '18', 670, 510, 'livro encontrado em Beôcia, na guerra dos peloponesos'),
(345, '455451ns', 'Terror Serpentino', 453, 23, 'O grande guerreiro contra o terror serpentino', NULL, '18', 670, 511, 'livro encontrado em Beôcia, na guerra dos peloponesos'),
(347, '8508153619', 'React Native: Desenvolvimento de aplicativos mobile com React', 20191203, NULL, 'O React Native é um framework desenvolvido pelo Facebook e baseado na biblioteca React. Ele consiste em uma série de ferramentas que viabilizam a criação de aplicações mobile nativas — para as plataformas iOS e Android — utilizando internamente as tecnologias básicas do front-end: HTML, CSS e JavaScript. Ao contrário de outros frameworks semelhantes, o React Native converte todo o código desenvolvido para a linguagem nativa do sistema operacional do seu aparelho, ou seja, podemos criar somente um código e ele rodará em qualquer sistema operacional.', 'https://m.media-amazon.com/images/I/417Vg37EN8L.jpg', 'Livre', 72, 5, 'Semi-novo'),
(348, '8508153619', 'Dom Casmurro', 20191203, 2, 'Dom Casmurro conta a história de Bento Santiago (Bentinho), apelidado de Dom Casmurro por ser calado e introvertido. Na adolescência, apaixona-se por Capítu, abandonando o seminário e, com ele, os desígnios traçados por sua mãe, Dona Glória, para que se tornasse padre.', 'https://sppa.org.br/uploads/literature/10.jpg', '12', 72, 5, 'Conservado'),
(349, '123', 'TEste', 2022, 1, 'teste', '', 'teste', 1, 1, 'novo'),
(350, '123', 'TEste', 2022, 1, 'teste', '', 'teste', 1, 1, 'novo'),
(351, '123', 'TEste', 2022, 1, 'teste', '', 'teste', 1, 1, 'novo'),
(352, '123', 'TEste', 2022, 1, 'teste', '', 'teste', 1, 1, 'novo'),
(353, NULL, 'Dom Casmurro', NULL, NULL, NULL, 'https://www.amazon.com.br/Dom-Casmurro-32-Machado-Assis/dp/8525406791', NULL, 678, 718, NULL),
(354, NULL, 'A Hora da Estrela', NULL, NULL, NULL, 'https://www.amazon.com.br/hora-estrela-manuscritos-ensaios-in%C3%A9ditos-ebook/dp/B071CQ8YHM', NULL, 678, 718, NULL),
(355, '9788580444957', 'God Of War : A História Oficial que deu origem ao Jogo', 2012, 1, 'História oficial que foi base de um dos mais famosos jogos da história. O livro conta em detalhes a história de Kratos, guerreiro grego que trabalha para os deuses do Olimpo e, após ser manipulado pelo deus da guerra, almeja por vingança e por matar o próprio Ares, o deus da Guerra', 'https://images.app.goo.gl/iMCkUY4x6AF5ATAx8', '18', 6, 8, 'perfeito estado'),
(356, '9788580447705', 'God Of War 2', 2013, 1, 'Kratos continua sua saga em busca de vingança em God of War 2. Após derrotar Ares e conseguir sua vingança, Kratos ascende ao Olimpo e torna-se o novo Deus da Guerra. Mas seus problemas estão só começando: humilhado e novamente traído, o Fantasma de Esparta descobre o verdadeiro jogo dos deuses, no qual é apenas uma peça. Agora eles devem pagar.', 'https://www.amazon.de/-/en/Robert-Vardeman/dp/3833227044', '18', 6, 8, 'ponta amassada');

-- --------------------------------------------------------

--
-- Estrutura para tabela `livro_emprestimo`
--

CREATE TABLE `livro_emprestimo` (
  `id_emprestimo` int(11) DEFAULT NULL,
  `id_livro` int(11) DEFAULT NULL,
  `nota` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `usuario`
--

CREATE TABLE `usuario` (
  `rm` int(11) NOT NULL,
  `nome` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(120) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dt_nascimento` date DEFAULT NULL,
  `genero` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `telefone` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `senha` char(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `perfil` varchar(120) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `obs` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `adm` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Despejando dados para a tabela `usuario`
--

INSERT INTO `usuario` (`rm`, `nome`, `email`, `dt_nascimento`, `genero`, `telefone`, `senha`, `perfil`, `status`, `obs`, `adm`) VALUES
(2150, 'Carlos', 'carlos@gmail.com', '2004-07-26', NULL, NULL, '123456', NULL, NULL, NULL, NULL),
(3456, 'Douglas Lima', 'douglas@email.com', '2005-06-26', 'M', '1399675345', '12345678', '', 'mais doq só', '', 0),
(3619, 'Anderson Souza Monteiro', 'anderson.monteiro3@etec.sp.gov.br', '2005-01-24', 'm', '13 999-9999', 'capivaraarrogante', 'bbb.png', 'ativo', NULL, NULL),
(3657, 'Beatriz', 'beatriz.nunez@etec.sp.gov.br', '2005-04-02', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3677, 'Osmar Ziarecki de Moura', 'oziarecki@gmail.com', '0000-00-00', 'M', '13974117979', 'batatinha123', NULL, NULL, NULL, NULL),
(3733, 'Bruna', 'bruna.elizabeth@etec.sp.gov.br', '2004-05-11', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3750, 'Ana Elize', 'ana.ribeiro311@etec.sp.gov.br', '2004-10-24', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3755, 'Anderson Taramelli', 'andersontaramellidesouza@gmail.com', '2005-05-19', 'M', '13998956746', '12345678', '', 'Ativo', '', 0),
(3758, 'Ana Elize', 'ana.ribeiro311@etec.sp.gov.br', '2004-10-24', NULL, NULL, '123', NULL, NULL, NULL, NULL),
(3783, 'Bruna Elizabeth', 'bruna.cordeiro18@etec.sp.gov.br', '2004-05-11', NULL, NULL, '132', NULL, NULL, NULL, NULL),
(3785, 'Renato Lima', 'renattocamisa10@gmail.com', '2005-03-19', 'M', '13978052021', '12345678', '', 'SOLTEIRO', '', 0),
(3831, 'Kamili', 'kamili.Lima01@etec.sp.gov.br', '2004-10-16', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3873, 'Kamili', 'kamili.Lima01@etec.sp.gov.br', '2004-10-16', NULL, NULL, '312', NULL, NULL, NULL, NULL),
(3999, 'Beatriz', 'beatriz.nunez@etec.sp.gov.br', '2005-04-01', NULL, NULL, '321', NULL, NULL, NULL, NULL),
(4022, 'Ingrid', 'ingrid.passos2@etec.sp.gov.br', '2005-06-21', NULL, NULL, 'carlinhos', NULL, 'ativo', NULL, NULL),
(4023, 'Giovanna Nunes de Oliveira', 'giovanna10nunes@gmail.com', '0000-00-00', NULL, NULL, 'senhaforte', NULL, 'desbloqueado', NULL, NULL),
(4024, 'Manuela Souza', 'manuelaariel@gmail.com', '2005-10-17', NULL, NULL, 'manu21', NULL, 'ativo', NULL, NULL),
(4026, 'Luiza Lorena', 'lorenaluiza787@gmail.com', '2005-04-06', NULL, NULL, 'naiaras2', NULL, 'ativo', NULL, NULL),
(4028, 'Kayk Almeida de Arruda Santos', 'kaykarrudasantos@gmail.com', '2005-02-20', NULL, NULL, 'senha10forte', NULL, 'desbloqueado', NULL, NULL),
(4030, 'Elizabeth', 'eliza@gmail.com', '2006-06-25', NULL, NULL, '010101', NULL, 'ativo', NULL, NULL),
(4032, 'Pedro Ribeiro', 'pedro.ribeiro103@etec.sp.gov.br', '2006-05-25', NULL, NULL, 'hectLindo', NULL, 'ativo', NULL, NULL),
(4033, 'Samara', 'samara.santana2@etec.sp.gov.br', '2006-01-07', NULL, NULL, 'carlinhos', NULL, 'ativo', NULL, NULL),
(4041, 'Yasmin', 'yasmincaroline9362@gmail.com', '2006-03-22', NULL, NULL, '020202', NULL, 'ativo', NULL, NULL),
(4043, 'Luca Poe de Almeida', 'lucpowpowfilosfiaislife@gmail.com', '1914-12-12', NULL, NULL, 'filofilo', NULL, 'ativo', NULL, NULL),
(4044, 'Emanuelle Gaya', 'emanuellebolinho@gmail.com', '2005-07-03', NULL, NULL, 'bolinhosvoadores', NULL, 'ativo', NULL, NULL),
(4045, 'Gabriel Bernardo Gamon', 'devgamon@gamil.com', '2004-04-13', NULL, NULL, '40028922', NULL, 'ativo', NULL, NULL),
(4110, 'Laryssa', 'Laryssa.silva20@gmail.com', '2006-06-20', NULL, NULL, 'bethlarymin', NULL, 'ativo', NULL, NULL),
(4132, 'Herika Silva de Andrade', 'herikinha@gmail.com', '2005-09-03', NULL, NULL, 'meninadoslivro', NULL, 'ativo', NULL, NULL),
(5000, 'bea chata', 'raul@gmail.com', '0000-00-00', NULL, NULL, 'simas turbo', NULL, 'com sono', NULL, NULL),
(7070, 'kirito', 'kirito-kun@gmailcom', '2202-08-10', NULL, NULL, '1010', NULL, NULL, NULL, NULL),
(19113, 'Jhonatan da Costa', 'jdc.santos94@gmail.com', '1993-02-14', NULL, NULL, '123', NULL, NULL, NULL, NULL),
(19176, 'Erick Henrique', 'erick.gimenes@etec.sp.gov.br', '1999-10-17', 'M', '13981341056', '**********', 'Goleiro', 'Infelizmente só', NULL, NULL),
(21142, 'Gustavo Mistro', 'gustavomistro@gmail.com', '0000-00-00', 'S', '13997768866', 'gustajooj1234', NULL, NULL, NULL, NULL),
(21225, 'Fabio', 'fabin10@gmail.com', '2005-02-24', NULL, NULL, 'mofome', NULL, NULL, NULL, NULL),
(21226, 'Rillary S', 'eu321@gmail.com', '2004-11-30', NULL, NULL, 'tonachina', NULL, NULL, NULL, NULL),
(21229, 'renata', 'renataveneria@gmail.com', '2004-11-18', NULL, NULL, '34291060', NULL, NULL, NULL, NULL),
(21244, 'Maria Eduarda', 'maria.ferreira22027@gmail.com', '2004-10-22', 'f', '12981442909', '2201027', NULL, NULL, NULL, NULL),
(21245, 'adriely', 'adrielygusmao@gmail', '2003-09-23', NULL, NULL, 'dry2309', NULL, NULL, NULL, NULL),
(22344, 'Kuno Cano Souza', 'kcs@gmail.com', '2003-05-14', NULL, NULL, 'alaotroxa', NULL, NULL, NULL, NULL),
(40310, 'Rodolfo Araujo', 'rodolfo@etec', '1989-02-03', 'm', '13', '123', 'aa.jpg', 'ativo', NULL, 1),
(40311, 'Thiago', 'pãocomsalame@pãocomsalame', '0000-00-00', NULL, NULL, '123', NULL, NULL, NULL, NULL),
(40312, 'Thiago', 'pãocomsalame@pãocomsalame', '2004-09-05', NULL, NULL, '123', NULL, NULL, NULL, NULL),
(40313, NULL, 'aimeeeleticia@gmail.com', '2004-10-21', 'f', '13 999-9999', '514389', 'bbb.png', 'ativo', NULL, NULL),
(40314, 'Aimee', 'aimeeeleticia@gmail.com', '2004-10-21', 'f', '13 999-9999', '514389', 'bbb.png', 'ativo', NULL, NULL),
(40316, 'Jhonatan da Costa', 'jdc.santos94@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(40317, 'Jorge Henrique de Lima', 'jorgprado@jorge.com', '0000-00-00', 'M', NULL, 'djroca', 'agiota', 'ligado', NULL, 1),
(40318, 'Jorge Henrique de Lima', 'jorgprado@jorge.com', '0000-00-00', 'M', NULL, 'djroca', 'agiota', 'ligado', NULL, 1),
(40319, 'Jorge Henrique de Lima', 'jorgprado@jorge.com', '0000-00-00', 'M', NULL, 'djroca', 'agiota', 'ligado', NULL, 1),
(40320, 'Jorge Henrique de Lima', 'jorgprado@jorge.com', '1999-05-02', 'M', NULL, 'djroca', 'agiota', 'ligado', NULL, 1),
(40321, 'Lucas', 'lucassepriano@gmail.com', '2004-03-13', 'M', '119899783', 'agiota123', 'cavalo', 'pai-ta-on', NULL, 1),
(41145, 'Guilherme Fonseca', 'guilhermefonseca@gmail.com', '2004-12-13', 'm', '13981082698', '2874956', NULL, NULL, NULL, NULL),
(63788, 'juninho da bl', 'reidograu@gmail.com', '1875-03-24', NULL, NULL, 'donodomorro', NULL, NULL, NULL, NULL),
(63789, 'Luiza Duarte Cattaneo', 'luiza@gmail.com', '2005-05-07', NULL, NULL, 'senhaforte', NULL, NULL, NULL, NULL),
(63790, 'Gustavo Nascimento Barbosa', 'gustavo.barbosa126@etec.sp.gov.br', '2005-03-20', NULL, NULL, '12345', NULL, NULL, NULL, NULL),
(63791, 'Alison Bruno Oliveira de Morais', 'alison.morais@etec.sp.gov.br', '2001-04-05', 'M', '13 99681-3373', '#Etec161462', NULL, 'Apenas um Jogador', NULL, 1),
(63792, 'Natalia', 'natalia_spindola@hotmail.com', '1984-10-27', 'f', '965897747', '1234', 'baixinha', 'em um relacionamento complicado', NULL, 1),
(63793, 'Natalia', 'natalia_spindola@hotmail.com', '1984-10-27', 'f', '965897747', '1234', 'baixinha', 'em um relacionamento complicado', NULL, 1),
(63794, 'Gustavo Mistro', 'gustavomistro@gmail.com', '0000-00-00', 'S', '13997768866', 'gustajooj1234', NULL, NULL, NULL, NULL),
(63795, '455451', 'Cefalonia', '0000-00-00', '1', 'O incrivel Alexios e sua jornado por Cefalôni', 'data:image/jpeg;base', '18', '670', '510', 0),
(63796, '455451ns', 'Terror Serpentino', '0000-00-00', '2', 'O grande guerreiro contra o terror serpentino', NULL, '18', '670', '511', 0);

-- --------------------------------------------------------

--
-- Estrutura stand-in para view `vautor_livro`
-- (Veja abaixo para a visão atual)
--
CREATE TABLE `vautor_livro` (
`qtd` bigint(21)
,`id_autor` int(11)
);

-- --------------------------------------------------------

--
-- Estrutura stand-in para view `vlivro`
-- (Veja abaixo para a visão atual)
--
CREATE TABLE `vlivro` (
`cd` int(11)
,`titulo` varchar(200)
,`capa` varchar(200)
,`autor` varchar(60)
);

-- --------------------------------------------------------

--
-- Estrutura stand-in para view `vwLivros`
-- (Veja abaixo para a visão atual)
--
CREATE TABLE `vwLivros` (
`cd` int(11)
,`isbn` varchar(100)
,`titulo` varchar(200)
,`ano` int(4)
,`qtd` int(11)
,`sinopse` longtext
,`capa` varchar(200)
,`classificacao` varchar(45)
,`id_editora` int(11)
,`id_genero` int(11)
,`estado` longtext
,`genero` varchar(100)
,`Editora` varchar(80)
,`Autor` varchar(60)
);

-- --------------------------------------------------------

--
-- Estrutura para view `vautor_livro`
--
DROP TABLE IF EXISTS `vautor_livro`;

CREATE ALGORITHM=UNDEFINED DEFINER=`profro26_biblio`@`%.%.%.%` SQL SECURITY DEFINER VIEW `vautor_livro`  AS SELECT count(`autor_livro`.`id_autor`) AS `qtd`, `autor_livro`.`id_autor` AS `id_autor` FROM `autor_livro` GROUP BY `autor_livro`.`id_autor` ;

-- --------------------------------------------------------

--
-- Estrutura para view `vlivro`
--
DROP TABLE IF EXISTS `vlivro`;

CREATE ALGORITHM=UNDEFINED DEFINER=`profro26_biblio`@`%.%.%.%` SQL SECURITY DEFINER VIEW `vlivro`  AS SELECT `l`.`cd` AS `cd`, `l`.`titulo` AS `titulo`, `l`.`capa` AS `capa`, `a`.`nome` AS `autor` FROM ((`livro` `l` join `autor_livro` `al`) join `autor` `a`) WHERE ((`al`.`id_livro` = `l`.`cd`) AND (`a`.`cd` = `al`.`id_autor`)) ;

-- --------------------------------------------------------

--
-- Estrutura para view `vwLivros`
--
DROP TABLE IF EXISTS `vwLivros`;

CREATE ALGORITHM=UNDEFINED DEFINER=`profro26_biblio`@`%.%.%.%` SQL SECURITY DEFINER VIEW `vwLivros`  AS SELECT `l`.`cd` AS `cd`, `l`.`isbn` AS `isbn`, `l`.`titulo` AS `titulo`, `l`.`ano` AS `ano`, `l`.`qtd` AS `qtd`, `l`.`sinopse` AS `sinopse`, `l`.`capa` AS `capa`, `l`.`classificacao` AS `classificacao`, `l`.`id_editora` AS `id_editora`, `l`.`id_genero` AS `id_genero`, `l`.`estado` AS `estado`, `g`.`nome` AS `genero`, `e`.`nome` AS `Editora`, `a`.`nome` AS `Autor` FROM ((((`livro` `l` join `genero` `g`) join `editora` `e`) join `autor` `a`) join `autor_livro` `al`) WHERE ((`l`.`id_genero` = `g`.`cd`) AND (`l`.`id_editora` = `e`.`cd`) AND (`al`.`id_autor` = `a`.`cd`) AND (`al`.`id_livro` = `l`.`cd`)) ORDER BY `l`.`cd` DESC ;

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `autor`
--
ALTER TABLE `autor`
  ADD PRIMARY KEY (`cd`);

--
-- Índices de tabela `autor_livro`
--
ALTER TABLE `autor_livro`
  ADD KEY `id_livro` (`id_livro`),
  ADD KEY `id_autor` (`id_autor`);

--
-- Índices de tabela `editora`
--
ALTER TABLE `editora`
  ADD PRIMARY KEY (`cd`);

--
-- Índices de tabela `emprestimo`
--
ALTER TABLE `emprestimo`
  ADD PRIMARY KEY (`cd`),
  ADD KEY `id_usuario` (`id_usuario`),
  ADD KEY `id_livro` (`id_livro`);

--
-- Índices de tabela `favorito`
--
ALTER TABLE `favorito`
  ADD PRIMARY KEY (`cd`),
  ADD KEY `id_usuario` (`id_usuario`),
  ADD KEY `id_livro` (`id_livro`);

--
-- Índices de tabela `fila`
--
ALTER TABLE `fila`
  ADD PRIMARY KEY (`cd`),
  ADD KEY `id_livro` (`id_livro`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Índices de tabela `genero`
--
ALTER TABLE `genero`
  ADD PRIMARY KEY (`cd`);

--
-- Índices de tabela `livro`
--
ALTER TABLE `livro`
  ADD PRIMARY KEY (`cd`),
  ADD KEY `id_editora` (`id_editora`),
  ADD KEY `id_genero` (`id_genero`);

--
-- Índices de tabela `livro_emprestimo`
--
ALTER TABLE `livro_emprestimo`
  ADD KEY `id_emprestimo` (`id_emprestimo`),
  ADD KEY `id_livro` (`id_livro`);

--
-- Índices de tabela `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`rm`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `autor`
--
ALTER TABLE `autor`
  MODIFY `cd` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1794;

--
-- AUTO_INCREMENT de tabela `editora`
--
ALTER TABLE `editora`
  MODIFY `cd` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=680;

--
-- AUTO_INCREMENT de tabela `emprestimo`
--
ALTER TABLE `emprestimo`
  MODIFY `cd` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `favorito`
--
ALTER TABLE `favorito`
  MODIFY `cd` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `fila`
--
ALTER TABLE `fila`
  MODIFY `cd` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `genero`
--
ALTER TABLE `genero`
  MODIFY `cd` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=721;

--
-- AUTO_INCREMENT de tabela `livro`
--
ALTER TABLE `livro`
  MODIFY `cd` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=357;

--
-- AUTO_INCREMENT de tabela `usuario`
--
ALTER TABLE `usuario`
  MODIFY `rm` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63797;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `autor_livro`
--
ALTER TABLE `autor_livro`
  ADD CONSTRAINT `autor_livro_ibfk_1` FOREIGN KEY (`id_livro`) REFERENCES `livro` (`cd`),
  ADD CONSTRAINT `autor_livro_ibfk_2` FOREIGN KEY (`id_autor`) REFERENCES `autor` (`cd`);

--
-- Restrições para tabelas `emprestimo`
--
ALTER TABLE `emprestimo`
  ADD CONSTRAINT `emprestimo_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`rm`),
  ADD CONSTRAINT `emprestimo_ibfk_2` FOREIGN KEY (`id_livro`) REFERENCES `livro` (`cd`);

--
-- Restrições para tabelas `favorito`
--
ALTER TABLE `favorito`
  ADD CONSTRAINT `favorito_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`rm`),
  ADD CONSTRAINT `favorito_ibfk_2` FOREIGN KEY (`id_livro`) REFERENCES `livro` (`cd`);

--
-- Restrições para tabelas `fila`
--
ALTER TABLE `fila`
  ADD CONSTRAINT `fila_ibfk_1` FOREIGN KEY (`id_livro`) REFERENCES `livro` (`cd`),
  ADD CONSTRAINT `fila_ibfk_2` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`rm`);

--
-- Restrições para tabelas `livro`
--
ALTER TABLE `livro`
  ADD CONSTRAINT `livro_ibfk_1` FOREIGN KEY (`id_editora`) REFERENCES `editora` (`cd`),
  ADD CONSTRAINT `livro_ibfk_2` FOREIGN KEY (`id_genero`) REFERENCES `genero` (`cd`);

--
-- Restrições para tabelas `livro_emprestimo`
--
ALTER TABLE `livro_emprestimo`
  ADD CONSTRAINT `livro_emprestimo_ibfk_1` FOREIGN KEY (`id_emprestimo`) REFERENCES `emprestimo` (`cd`),
  ADD CONSTRAINT `livro_emprestimo_ibfk_2` FOREIGN KEY (`id_livro`) REFERENCES `livro` (`cd`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
