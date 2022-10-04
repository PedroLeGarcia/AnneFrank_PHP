<?php
include('biblioteca.php');
?>
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@200;300;400&display=swap" rel="stylesheet"> 
<style type="text/css">
*{
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: 'Inter', sans-serif;
}
body{
	width: 100%;
    min-height: 100%;
    background: #2980B9;  
}
header{
	background-color: #000080;
	box-shadow: 0px 3px 10px #464646;
}
.nav-bar{
	display: flex;
	justify-content: space-between;
	padding: 1.5rem 6rem;
}
.logo img{
	width: 50px;
	border-radius: 50%;
	border: 2px solid #fff;
}
.nav-listem{
	display: flex;
	justify-content: center;
}
.nav-listem ul{
	display: flex;
	align-items: center;
	list-style: none;
}
.nav-item{
	margin: 0 15px;
}
.nav-link{
	text-decoration: none;
	font-size: 1.15rem;
	color: #fff;
	font-weight: 400;
}
.nav-link:hover{
    color: #1E90FF;
}
.nav-btn button{
	border: none;
	background-color: transparent;
	padding: 10px 15px;
	border-radius: 5px;
	transition: 0.5s;
}
.nav-btn button:hover{
	background-color: #1E90FF;
}
.nav-btn button a{
	text-decoration: none;
	color: #fff;
	font-weight: 500;
	font-size: 1.1rem;
}
.form{
	width: 100%;
	display: flex;
	justify-content: center;
    align-items: center;
    flex-direction: column;
    padding: 3rem;
}
.header h2{
	display: flex;
	justify-content: center;
	color: #fff;
}
.header p{
    text-align: center;
    color: #fff;
}
.header th{
    color: #fff;
}

.modalContainer{
	display: flex;
	align-items: center;
	flex-direction: column;
}
.hide{
	display: flex;
	flex-direction: column;
	margin-bottom: 0.5rem
}
.input-box input{
	margin: 0.1rem 0;
	padding: 10px 60px;
	border: 1px solid #fff;
	border-radius: 5px;
	background-color: #fff;
	box-shadow: 1px 1px #0000001c;
	transition: 0.5s;
	color: #1E90FF;
	text-align: center;
}
.input-box input:hover{
	background-color: #eeeeee75;
}
.dados{
	display: flex;
    justify-content: center;
    align-items: center;
    flex-direction: column;
}
.productBox{
    width: 25rem;
   padding: 1.5rem;
   margin: 0.5rem;
   background-color: #f8f8ff;
   border: 1px solid lightgray;
   box-shadow: 1px 3px 1px #0000001c;
}
.productBox h1{
    font-weight: 500;
    text-align: center;
    font-size: 1.5rem;
}
.productBox img{
    width: 15rem;
}
</style>
<div class="container">
	<div class="header-anne">
		<header>
			<nav class="nav-bar">
				<div class="logo">
					<a href="#" class="logo"><img src="img/logo.jpeg"></a>
				</div>
				<div class="nav-listem">
					<ul>
						<li class="nav-item"><a href="editoras.php" class="nav-link">Editoras</a></li>
						<li class="nav-item"><a href="autores.php" class="nav-link">Autores</a></li>
						<li class="nav-item"><a href="home.php" class="nav-link">Livros</a></li>
						<li class="nav-item"><a href="generos.php" class="nav-link">Gêneros</a></li>
					</ul>
				</div>
        		</div>
   			</nav>
		</header>
		</div><!-- Fim da header-anne-->
	</div><br>

	<div class="containerGen">
            <div class="header">
                <h2>Livros Cadastrados</h2>
                <p>Você pode adicionar, visualizar e editar novos livros.</p>
            </div>

            <div class="modalContainer">
                <button class="btnAdd" id="open-modal"><i class="fa-solid fa-plus"></i> Adicionar Livro</button>
                <div id="modal" class="hide">
                    <div class="modal-header">
                    <br>
                      <div class="header">
                        <i class="fa-solid fa-book"></i>
                        <h2>Cadastrar Livro</h2>
                      </div>
                        <button id="close-modal"><i class="fa-solid fa-xmark"></i></button>
                    </div>

                    <div class="modal-body">
                        <form method="POST">
                            <input type="number" name="isbn" id="isbn" placeholder="Isbn">
                            <input type="text" name="titulo" id="titulo" placeholder="Titulo">

                            <div class="numberBox">
                                <input type="number" name="ano" id="ano" placeholder="Ano">
                                <input type="number" name="qtd" id="qtd" placeholder="Qtd">
                            </div>

                            <textarea name="sinopse" id="sinopse" placeholder="sinopse"></textarea>

                            <input type="text" name="classificacao" id="classificacao" placeholder="Classificação">
                            <input type="text" name="capa" id="capa" placeholder="Url capa">
                            
                            <div class="numberBox">
                                <select name="id_editora" id="editora">
                                    <option value="#">Selecione uma Editora</option>
                                    <?php
                                        $editora = ListarEditora("");
                                        while($book = $editora->fetch_object()){
                                            echo '
                                                                            
                                            <option value="'.$livro->cd.'">'.$livro->nome.'</option>
                                            ';
                                        }
                                    ?>
                                </select>
                                <select name="id_genero" id="genero">
                                    <option value="#">Selecione um Gênero</option>
                                    <?php
                                        $genero = ListarGenero("");
                                        while($livro = $genero->fetch_object()){
                                            echo '
                                                                            
                                            <option value="'.$livro->cd.'">'.$livro->nome.'</option>
                                            ';
                                        }
                                    ?>                                    
                                </select>
                                <select name="id_autor" id="autor">
                                  <option value="#">Selecione um Autor</option>
                                    <?php
                                        $autor = ListarAutor("");
                                        while($livro = $autor->fetch_object()){
                                            echo '
                                                                            
                                            <option value="'.$livro->cd.'">'.$livro->nome.'</option>
                                            ';
                                        }
                                    ?>  
                                </select>
                            </div>

                            <input type="text" name="estado" id="estado" placeholder="Estado">

                            <input type="submit" id="enviar" value="Enviar">
                        </form>
                    </div>
                </div>
            </div>

                <?php
                   if(isset($_POST['isbn'],$_POST['titulo'],$_POST['ano'],$_POST['qtd'],$_POST['sinopse'],$_POST['classificacao'],$_POST['id_editora'],$_POST['id_genero'],$_POST['id_autor'],$_POST['estado'],$_POST['capa'])){
                      CadastrarLivro($_POST['isbn'],$_POST['titulo'],$_POST['ano'],$_POST['qtd'],$_POST['sinopse'],$_POST['classificacao'],$_POST['id_editora'],$_POST['id_genero'],$_POST['id_autor'],$_POST['estado'],$_POST['capa']);
                    } 
                ?>
            <center>
            <div class="header">
                <table>
                <tr>
                    <th>Título</th>
                    <th>Status</th>
                    <th>Edidora</th>
                    <th>Gênero</th>
                    <th>Quantidade</th>
                </tr>
                <?php
                    $todos = ListarLivro("");
                    while($livro = $todos->fetch_object()){
                        echo '
                        <tr>
                            <td class="titulo">'.$livro->titulo.'</td>
                            <td>'.$livro->estado.'</td>
                            <td>'.$livro->id_editora.'</td>
                            <td>'.$livro->id_genero.'</td>
                            <td>'.$livro->qtd.'</td>
                        </tr>
                    ';
                    }
                ?>
            </table>
            </div>   
        </center>
        </div>
    </div>
<br>
	<div class="containerGen">
            <div class="header">
                <h2>Empréstimos Cadastrados</h2>
                <p>Você pode adicionar, visualizar e editar novos empréstimos.</p>
            </div>

            <div class="modalContainer">
                <button class="btnAdd" id="open-modal"><i class="fa-solid fa-plus"></i> Adicionar Empréstimo</button>
                <div id="fade" class="hide"></div>

                <div id="modal" class="hide">
                    <div class="modal-header">
                        <br>
                        <div class="header">
                            <i class="fa-solid fa-handshake"></i>
                            <h2>Cadastrar Empréstimo</h2>
                        </div>
                        <button id="close-modal"><i class="fa-solid fa-xmark"></i></button>
                    </div>

                    <div class="modalContainer">
                        <form method="POST">
                            <select name="id_usuario" id="id_usuario">
                                <option value="$">Selecione um Usuário</option>
                                <?php
                                    $funcUser = ListarUsuario("");
                                        while($user = $funcUser->fetch_object()){
                                        echo '<option value="'.$user->rm.'">'.$user->nome.'</option>';
                                        }
                                ?>        
                            </select>
                            <select name="id_livro" id="id_livro">
                                <option value="#">Selecione um Livro</option>
                                <?php
                                    $todos = ListarLivro("");
                                        while($book = $todos->fetch_object()){
                                        echo '<option value="'.$book->cd.'">'.$book->titulo.'</option>';
                                        }
                                ?>
                            </select>

                            <br>

                        
                                <span style="display: flex;flex-direction: column;">
                                    <label for="">Data de Empréstimo:</label>
                                    <input type="date" name="dt_emprestimo" id="dt_emprestimo">
                                </span>
                                <span style="display: flex;flex-direction: column;">
                                    <label for="">Data de Devolução:</label>  
                                    <input type="date" name="dt_devolucao" id="dt_devolucao">
                                </span>
                                
                                

                            <input type="submit" id="enviar" value="Enviar">
                        </form>
                    </div>
                </div>
            </div>

            <?php
                if(isset($_POST['id_usuario'], $_POST['id_livro'], $_POST['dt_emprestimo'], $_POST['dt_devolucao'])){
                    CadastrarEmprestimo($_POST['id_usuario'], $_POST['id_livro'], $_POST['dt_emprestimo'], $_POST['dt_devolucao']);
                }
            ?>
            <center>
            <div class="header">
                <table>
                <tr>
                    <th>Usuário</th>
                    <th>Livro</th>
                    <th>Retirada</th>
                    <th>Devolução</th>
                    <th>Status</th>
                    <th>Ações</th>
                </tr>
                <?php
                    if(isset($_GET['cheack_emprestimo'])){
                        ValidarEmprestimo($_GET['cheack_emprestimo']);
                    }

                    $funcEmprestimo = ListarEmprestimo("");
                    while($emprestimo = $funcEmprestimo->fetch_object()){
                        echo ' <tr>
                                <td>'.$emprestimo->id_usuario.'</td>
                                <td>'.$emprestimo->id_livro.'</td>
                                <td>'.$emprestimo->dt_emprestimo.'</td>
                                <td>'.$emprestimo->dt_devolucao.'</td>
                                <td>'.$emprestimo->status.'</td>
                                <td>
                                <button><i class="fa-solid fa-pen-to-square"></i></button>
                                <a href="?cheack_emprestimo='.$emprestimo->cd.'"><i class="fa-solid fa-square-check"></i></a>
                                </td>
                               </tr>';
                    }
                ?>
                
            </table>
            </div>
        </center>
        </div>
        <div class="dados">   
        <?php
            $fLivro = ListarLivro("");
            while ($livros = $fLivro->fetch_object()) {
                echo '
                    <center>
                    <div class="productBox"
                    <h1>'.$livros->titulo.'</h1>
                    <br>
                    <img src="'.$livros->capa.'">
                    <br>
                    </center>

                ';
            }

        ?>
        </div>
    </div>
	

	
