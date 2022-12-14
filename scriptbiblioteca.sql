
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
(10, 'Guimar??es Rosa'),
(11, 'Clarice Lispector'),
(12, 'Carlos Drummond de Andrade'),
(13, 'Jos?? de Alencar'),
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
(336, 'Programa????o'),
(337, NULL),
(338, 'Machado de Assis'),
(339, 'William Shakespeare'),
(340, 'Federico Garc??a Lorca'),
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
(1790, 'Alu??sio de Azevedo'),
(1791, 'Matthew Stover'),
(1792, 'Robert E. Vardeman'),
(1793, 'J. K. Rowling');



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

INSERT INTO `editora` (`cd`, `nome`) VALUES
(1, 'Intr??nseca'),
(2, 'DarkSide Books'),
(3, 'Ateli?? Editorial'),
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
(72, '??tica'),
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

INSERT INTO `genero` (`cd`, `nome`) VALUES
(1, 'Com??dia'),
(2, 'Romance'),
(3, 'Terror'),
(4, 'Trag??dia'),
(5, 'Suspense'),
(6, 'Romance'),
(7, 'Fantasia'),
(8, 'A????o'),
(9, 'Autoajuda'),
(10, 'Fic????o Cient??fica'),
(11, 'Horror'),
(12, 'Fic????o Policial'),
(13, 'Graphic Novel'),
(14, 'Drama'),
(15, 'Hist??ria'),
(16, 'Ci??ncias'),
(17, 'Filosofia'),
(18, 'Document??rio'),
(19, 'Poesia'),
(111, NULL),
(112, 'Inform??tica'),
(113, 'A????o'),
(114, NULL),
(115, NULL),
(134, 'terror'),
(200, 'A????o'),
(230, 'terror'),
(234, 'romance'),
(244, NULL),
(300, 'romance'),
(431, NULL),
(500, 'com??dia'),
(501, 'terror divertido'),
(502, 'comedia bipolar'),
(503, 'Aventura'),
(504, 'Programa????o'),
(505, 'A????o'),
(506, NULL),
(507, 'A????o'),
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
(719, 'Fic??ao Fantasiosa'),
(720, 'distopia');

INSERT INTO `livro` (`cd`, `isbn`, `titulo`, `ano`, `qtd`, `sinopse`, `capa`, `classificacao`, `id_editora`, `id_genero`, `estado`) VALUES
(1, '8535930043', 'Guerra e Paz', 20171121, 2, 'Nos anos que precederam a invas??o de Napole??o, os membros da aristocracia russa enfrentam muitas trag??dias pessoais. Depois que seu pai morre, o Conde Pierre Bezukhov (Henry Fonda), um amigo do pr??ncipe Andrei Bolkonsky (Mel Ferrer), recebe uma heran??a. Quando ele decide se casar, Bezukhov imprudentemente escolhe uma maldosa princesa (Anita Ekberg). Quanto a Bolkonsky, sua esposa morre durante o parto, logo ele se apaixona por Natasha Rostova (Audrey Hepburn), mas ?? chamado para a guerra.', 'https://images-na.ssl-images-amazon.com/images/I/91uLwQ4Ry8L.jpg', '10', 675, 14, 'Conservado'),
(2, '9788594541475', 'Lady Killers: Assassinas em s??rie', 2019, 2, 'Quando pensamos em assassinos em s??rie, pensamos em homens. Mais precisamente, em homens matando mulheres inocentes, v??timas de um apetite atroz por sangue e uma vontade irrefre??vel de carnificina.', NULL, '16', 2, 18, 'perfeito estado, todas as folhas e capa no lugar'),
(3, '8565042022', 'O Principe', 2022, 2, '?? uma obra que ensina a agir segundo as circunst??ncias e as necessidades, reconsiderando o car??ter pejorativo do adjetivo maquiav??lico, procurando sempre o apoio maior do povo, por meio da sua prote????o e prosperidade, pois ?? o povo, consciente ou n??o, a for??a maior de um Estado.', NULL, 'Livre', 10, 17, 'Meio V??io tlgd par??a'),
(4, '978-85-7522-137-2', 'PHP Programando com Orienta????o a Objetos - 1?? Edi????o', 2007, 1, '\nO PHP ?? uma das linguagens mais utilizadas no mundo. Sua popularidade se deve ?? facilidade em criar aplica????es din??micas com suporte ?? maioria dos bancos de dados existentes e ao conjunto de fun????es que, por meio de uma estrutura flex??vel de programa????o, permitem desde a cria????o de simples portais at?? complexas aplica????es de neg??cio.', 'https://s3.novatec.com.br/capas-ampliadas/capa-ampliada-9788575221372.jpg', 'livre', 70, 112, ''),
(5, '9788566636239', 'Dr??cula', 2018, 1, 'A obra atemporal de Bram Stoker narra, por meio de fragmentos de cartas, di??rios e not??cias de jornal, a hist??ria de humanos lutando para sobreviver ??s investidas do vampiro Dr??cula.', NULL, '16', 2, 10, 'Estado bom, mas capa amassada'),
(7, '8903', 'O Conto do Palha??inho', 1992, 1, 'A historia de um palha??inho muito travesso', NULL, 'Apartir de 69 Anos de Idade', 73, 113, 'Diponivel para sempre'),
(8, '4764', 'Mem??rias P??stumas de Br??s Cubas', 2021, 30, 'Um cara muito rico que precisa de uma namorada', NULL, 'Apartir de 13 Anos de Idade', 74, 114, 'Disponivel por 5 anos'),
(10, '3580', 'Os Setes Maridos de Evelyn Hugo', 2022, 30, 'alguem que precisa trocar de nome', NULL, 'Apartir de 16 Anos de Idade', 200, 200, 'Disponivel por 2 anos'),
(15, 'jdc codigo 1', 'Dom Casmurro', 2022, 1, 'o terror de fazer deploy as 23h', NULL, 'para maiores de 40 anos', 202, 502, 'queimado'),
(16, 'jdc codigo 2', 'O CHAMADO', 1922, 0, 'O CHAMADO NUMA  SEXTA FEIRA 13 ??S 18H...', NULL, 'para maiores de 60 anos', 201, 501, 'ESCONDIDO'),
(17, '7070', 'Sword Art Online', 2010, 10, 'S?? assistir o anime', NULL, '10', 9, 1, 'Mundo do Sword'),
(18, '7070', 'Sword Art Online', 2010, 10, 'S?? assistir o anime', NULL, '10', 9, 1, 'Mundo do Sword'),
(19, '8594318855', 'Quincas Borba', 20191021, 2, 'O romance a ascens??o social de Rubi??o que, ap??s receber toda a heran??a do fil??sofo louco Quincas Borba - criador da filosofia Humanitas e muda-se para a Corte no final do s??culo XlX. N viagem de trem rumo ?? capital, Rubi??o conhece o casal Sofia e Cristiano Palha, qua percebe estar diante de um ing??nuo - e agora rico - provinciano: impress??o que tamb??m ?? compartilhada por todos os que est??o ao seu redor. As desventuras de Rubi??o e sua rela????o com os amigos parasit??rios d??o a t??nica da obra, que critica o conv??vio social e os valores morais e ??ticos vigentes na ??poca.', 'https://images-na.ssl-images-amazon.com/images/I/412+SGWI4PL._SX331_BO1,204,203,200_.jpg', '12', 677, 14, 'Conservado'),
(20, '7070', 'Sword Art Online', 2010, 10, 'S?? assistir o anime', NULL, '10', 9, 1, 'Mundo do Sword'),
(21, '70', 'Kirito bolad??o a saga', 2012, 10, 'Num ?? legal isso', NULL, '10', 9, 2, 'Mundo do Sword 2'),
(22, '7070', 'Sword Art Online', 2010, 10, 'S?? assistir o anime', NULL, '10', 9, 1, 'Mundo do Sword'),
(23, '70', 'Kirito bolad??o a saga', 2012, 10, 'Num ?? legal isso', NULL, '10', 9, 2, 'Mundo do Sword 2'),
(24, NULL, 'Jason - o assassino', NULL, NULL, NULL, NULL, NULL, 668, 506, NULL),
(25, NULL, '?? Proibido Chorar', NULL, NULL, 'um mist??rio envolvendo crian??as e suas aventuras .', NULL, NULL, 668, 505, NULL),
(26, NULL, 'growth', NULL, NULL, NULL, NULL, NULL, 669, 508, NULL),
(27, '8581050484', 'O Iluminado', 20121119, 1, 'O romance, magistralmente levado ao cinema por Stanley Kubrick, continua apaixonando (e aterrorizando) novas gera????es de leitores. A luta assustadora entre dois mundos. Um menino e o desejo assassino de poderosas for??as malignas. Uma fam??lia ref??m do mal. Nesta guerra sem testemunhas, vencer?? o mais forte. Danny Torrance n??o ?? um menino comum. ?? capaz de ouvir pensamentos e transportar-se no tempo. Danny ?? iluminado. Ser?? uma maldi????o ou uma b??n????o? A resposta pode estar guardada na impon??ncia assustadora do hotel Overlook. Em O iluminado, quando Jack Torrance consegue o emprego de zelador no velho hotel, todos os problemas da fam??lia parecem estar solucionados. N??o mais o desemprego e as noites de bebedeiras. N??o mais o sofrimento da esposa, Wendy. Tranquilidade e ar puro para o pequeno Danny livrar-se das convuls??es que assustam a fam??lia. S?? que o Overlook n??o ?? um hotel comum. O tempo esqueceu-se de enterrar velhos ??dios e de cicatrizar antigas feridas, e esp??ritos malignos ainda residem nos corredores. O hotel ?? uma chaga aberta de ressentimento e desejo de vingan??a. ?? uma senten??a de morte. E somente os poderes de Danny podem fazer frente ?? dissemina????o do mal.', 'https://images-na.ssl-images-amazon.com/images/I/51qNYKYrFHS._SX346_BO1,204,203,200_.jpg', '18', 676, 3, NULL),
(28, '9788576082675', 'Codigo Limpo', 2018, 100, 'aprende programar sem cordigo porco', 'https://m.media-amazon.com/images/I/41IRFCLk-kL._SY346_.jpg', 'L', 204, 504, 'bom'),
(29, '-8360', 'A arte da guerra', 2010, 100, 'A arte da guerra, s??o discutidos todos os aspectos da guerra ', 'https://cdn.record.com.br/wp-content/uploads/2020/08/25160528/14766-768x1249.jpeg', '18', 204, 507, 'capa rasgada folhas velhas'),
(30, NULL, 'a culpa ?? das estrelas', 2010, 4, 'romance muito triste que te faz chorar no fim', NULL, '18', 123, 234, 'parque'),
(31, NULL, 'um dia muito louco', 2022, 3, 'um dia no baile com os mais que amigos friends', NULL, 'apartir dos 16', 24, 244, 'na delegacia'),
(32, NULL, 'percy jackson', 2011, 5, 'semi deuses em uma viagem', NULL, '16', 123, 134, 'mar'),
(33, NULL, 'festa junina', 1200, 1, 'uma festa das antigas', NULL, 'apartir do que quiser', 24, 431, 'ausente'),
(35, '8595086788', 'assasinato no expresso no oriente', 2018, 4, 'um assasinato aconteceu e o pessoal t?? tentando descobrir', NULL, '16', 13, 230, 's??o paulo'),
(324, '8555340942', 'vermelho, branco e sangue azul', 2020, 5, 'dois meninos se apaixonam loucamente, ?? isso, depois procura para ler a??', NULL, '16', 13, 700, 'londres'),
(331, '57851189996706098', 'O Pequeno Pr??ncipe', 2022, 100, 'O Pequeno Pr??ncipe ?? uma obra liter??ria do escritor franc??s Antoine de Saint-Exup??ry, que conta a hist??ria da amizade entre um homem frustrado por ningu??m compreender os seus desenhos, com um principezinho que habita um asteroide no espa??o.', 'https://1.bp.blogspot.com/-1uooVifUquw/X7EV6403piI/AAAAAAAAHVg/fcg8ZMO-jqQu0NlkznpJF_PQkoWUhKtBQCLcBGAsYHQ/s293/1.jpg', '10', 674, 710, 'Conservado'),
(332, '17158589360852069', 'Livro ((Dela)))', 2022, 100, 'Esse livro conta a historia do unico predador do chupa cu. Mas n??o se enganem, ele n??o ?? do bem ', NULL, '18', 667, 3, 'reliquia'),
(337, '41092080671920853', 'Droga de Americana', 2022, 100, 'um mist??rio de assasinato e desaparecimento em uma certa cidade,o passado volta a tona.', NULL, '18', 667, 3, 'reliquia'),
(342, '455451', 'Cefalonia', 493, 1, 'O incrivel Alexios e sua jornado por Cefal??nia', NULL, '18', 670, 510, 'livro encontrado em Be??cia, na guerra dos peloponesos'),
(343, '455451ns', 'Terror SeperntinoUp', 453, 23, 'O grande guerreiro contra o terror serpentino', NULL, '18', 670, 511, 'livro encontrado em Be??cia, na guerra dos peloponesos'),
(344, '455451', 'Cefalonia', 493, 1, 'O incrivel Alexios e sua jornado por Cefal??nia', NULL, '18', 670, 510, 'livro encontrado em Be??cia, na guerra dos peloponesos'),
(345, '455451ns', 'Terror Serpentino', 453, 23, 'O grande guerreiro contra o terror serpentino', NULL, '18', 670, 511, 'livro encontrado em Be??cia, na guerra dos peloponesos'),
(347, '8508153619', 'React Native: Desenvolvimento de aplicativos mobile com React', 20191203, NULL, 'O React Native ?? um framework desenvolvido pelo Facebook e baseado na biblioteca React. Ele consiste em uma s??rie de ferramentas que viabilizam a cria????o de aplica????es mobile nativas ??? para as plataformas iOS e Android ??? utilizando internamente as tecnologias b??sicas do front-end: HTML, CSS e JavaScript. Ao contr??rio de outros frameworks semelhantes, o React Native converte todo o c??digo desenvolvido para a linguagem nativa do sistema operacional do seu aparelho, ou seja, podemos criar somente um c??digo e ele rodar?? em qualquer sistema operacional.', 'https://m.media-amazon.com/images/I/417Vg37EN8L.jpg', 'Livre', 72, 5, 'Semi-novo'),
(348, '8508153619', 'Dom Casmurro', 20191203, 2, 'Dom Casmurro conta a hist??ria de Bento Santiago (Bentinho), apelidado de Dom Casmurro por ser calado e introvertido. Na adolesc??ncia, apaixona-se por Cap??tu, abandonando o semin??rio e, com ele, os des??gnios tra??ados por sua m??e, Dona Gl??ria, para que se tornasse padre.', 'https://sppa.org.br/uploads/literature/10.jpg', '12', 72, 5, 'Conservado'),
(349, '123', 'TEste', 2022, 1, 'teste', '', 'teste', 1, 1, 'novo'),
(350, '123', 'TEste', 2022, 1, 'teste', '', 'teste', 1, 1, 'novo'),
(351, '123', 'TEste', 2022, 1, 'teste', '', 'teste', 1, 1, 'novo'),
(352, '123', 'TEste', 2022, 1, 'teste', '', 'teste', 1, 1, 'novo'),
(353, NULL, 'Dom Casmurro', NULL, NULL, NULL, 'https://www.amazon.com.br/Dom-Casmurro-32-Machado-Assis/dp/8525406791', NULL, 678, 718, NULL),
(354, NULL, 'A Hora da Estrela', NULL, NULL, NULL, 'https://www.amazon.com.br/hora-estrela-manuscritos-ensaios-in%C3%A9ditos-ebook/dp/B071CQ8YHM', NULL, 678, 718, NULL),
(355, '9788580444957', 'God Of War : A Hist??ria Oficial que deu origem ao Jogo', 2012, 1, 'Hist??ria oficial que foi base de um dos mais famosos jogos da hist??ria. O livro conta em detalhes a hist??ria de Kratos, guerreiro grego que trabalha para os deuses do Olimpo e, ap??s ser manipulado pelo deus da guerra, almeja por vingan??a e por matar o pr??prio Ares, o deus da Guerra', 'https://images.app.goo.gl/iMCkUY4x6AF5ATAx8', '18', 6, 8, 'perfeito estado'),
(356, '9788580447705', 'God Of War 2', 2013, 1, 'Kratos continua sua saga em busca de vingan??a em God of War 2. Ap??s derrotar Ares e conseguir sua vingan??a, Kratos ascende ao Olimpo e torna-se o novo Deus da Guerra. Mas seus problemas est??o s?? come??ando: humilhado e novamente tra??do, o Fantasma de Esparta descobre o verdadeiro jogo dos deuses, no qual ?? apenas uma pe??a. Agora eles devem pagar.', 'https://www.amazon.de/-/en/Robert-Vardeman/dp/3833227044', '18', 6, 8, 'ponta amassada');

INSERT INTO `usuario` (`rm`, `nome`, `email`, `dt_nascimento`, `genero`, `telefone`, `senha`, `perfil`, `status`, `obs`, `adm`) VALUES
(2150, 'Carlos', 'carlos@gmail.com', '2004-07-26', NULL, NULL, '123456', NULL, NULL, NULL, NULL),
(3456, 'Douglas Lima', 'douglas@email.com', '2005-06-26', 'M', '1399675345', '12345678', '', 'mais doq s??', '', 0),
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
(19176, 'Erick Henrique', 'erick.gimenes@etec.sp.gov.br', '1999-10-17', 'M', '13981341056', '**********', 'Goleiro', 'Infelizmente s??', NULL, NULL),
(21142, 'Gustavo Mistro', 'gustavomistro@gmail.com', '0000-00-00', 'S', '13997768866', 'gustajooj1234', NULL, NULL, NULL, NULL),
(21225, 'Fabio', 'fabin10@gmail.com', '2005-02-24', NULL, NULL, 'mofome', NULL, NULL, NULL, NULL),
(21226, 'Rillary S', 'eu321@gmail.com', '2004-11-30', NULL, NULL, 'tonachina', NULL, NULL, NULL, NULL),
(21229, 'renata', 'renataveneria@gmail.com', '2004-11-18', NULL, NULL, '34291060', NULL, NULL, NULL, NULL),
(21244, 'Maria Eduarda', 'maria.ferreira22027@gmail.com', '2004-10-22', 'f', '12981442909', '2201027', NULL, NULL, NULL, NULL),
(21245, 'adriely', 'adrielygusmao@gmail', '2003-09-23', NULL, NULL, 'dry2309', NULL, NULL, NULL, NULL),
(22344, 'Kuno Cano Souza', 'kcs@gmail.com', '2003-05-14', NULL, NULL, 'alaotroxa', NULL, NULL, NULL, NULL),
(40310, 'Rodolfo Araujo', 'rodolfo@etec', '1989-02-03', 'm', '13', '123', 'aa.jpg', 'ativo', NULL, 1),
(40311, 'Thiago', 'p??ocomsalame@p??ocomsalame', '0000-00-00', NULL, NULL, '123', NULL, NULL, NULL, NULL),
(40312, 'Thiago', 'p??ocomsalame@p??ocomsalame', '2004-09-05', NULL, NULL, '123', NULL, NULL, NULL, NULL),
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
(63795, '455451', 'Cefalonia', '0000-00-00', '1', 'O incrivel Alexios e sua jornado por Cefal??ni', 'data:image/jpeg;base', '18', '670', '510', 0),
(63796, '455451ns', 'Terror Serpentino', '0000-00-00', '2', 'O grande guerreiro contra o terror serpentino', NULL, '18', '670', '511', 0);

CREATE TABLE `vautor_livro` (
`qtd` bigint(21)
,`id_autor` int(11)
);

CREATE TABLE `vlivro` (
`cd` int(11)
,`titulo` varchar(200)
,`capa` varchar(200)
,`autor` varchar(60)
);

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

DROP TABLE IF EXISTS `vlivro`;

CREATE ALGORITHM=UNDEFINED DEFINER=`profro26_biblio`@`%.%.%.%` SQL SECURITY DEFINER VIEW `vlivro`  AS SELECT `l`.`cd` AS `cd`, `l`.`titulo` AS `titulo`, `l`.`capa` AS `capa`, `a`.`nome` AS `autor` FROM ((`livro` `l` join `autor_livro` `al`) join `autor` `a`) WHERE ((`al`.`id_livro` = `l`.`cd`) AND (`a`.`cd` = `al`.`id_autor`)) ;

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
