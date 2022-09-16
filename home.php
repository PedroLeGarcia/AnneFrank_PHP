<?php
include('biblioteca.php');
?>
<style type="text/css">
*{
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: 'Rubik', sans-serif;
	color: #fff;
}
body{
	width: 100%;
    min-height: 100%;
    background: #2980B9;  
    background: radial-gradient(#2980B9,#6DD5FA );
}
.container{
	display: flex;
}
.form{
	width: 100%;
	display: flex;
	justify-content: center;
    align-items: center;
    flex-direction: column;
    padding: 3rem;
}
.title{
	display: flex;
	justify-content: center;
}
.title h1{
	margin-bottom: 0.5rem;
}
.input-group{
	display: flex;
	align-items: center;
	flex-direction: column;
}
.input-box{
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
.bnt button{
	padding: 10px 100px;
	font-size: 20px;
	background-color: #fff;
	border: 1px solid #fff;
	border-radius: 5px;
	cursor: pointer;
	color: #1E90FF;
	transition: 0.5s;
}
.bnt button:hover{
	background-color: #1E90FF;
	color: #fff;
}
table tr td{
	color: #fff;
}
.livro{
	display: flex;
	align-items: center;
	flex-direction: column;

}
.livro img{
	width: 10rem;
	box-shadow: 0 5px 10px rgba(0, 0, 0, 0.2);
}
</style>
<div class="container">
	<div class="form"><br>
		<div class="form-header">
			<div class="title"> <h1>Olá<?php echo $_SESSION['nome']; ?>! </h1> </div>
		</div>
	<div class="input-group">
		<form id="novoGenero" method="post">
			<div class="input-box">
				<div class="title"><h2>Novo Genêro</h2></div>
				<input type="text" name="genero" placeholder="Nome do Genêro...">
			</div>
			<div class="bnt">
				<button>Cadastrar</button>
			</div>
		</form>
<?php
	if(isset($_POST['genero'])){
		CadastrarGenero($_POST['genero']);
	}
?>
<h2>Gêneros Cadastrados</h2>
<table>
	<tr>
		<td>Nome</td>
		<td>#</td>
	</tr>
	<?php
		if(isset($_GET['excluir_gen'])){
			ExcluirGenero($_GET['excluir_gen']);
		}
		$todos = ListarGenero("");
		while($gen = $todos->fetch_object()){
			echo '<tr>
					<td>'.$gen->nome.'</td>
					<td>
						<a href="?excluir_gen='.$gen->cd.'">Excluir</a>
					</td>
				</tr>';		}
	?>
	</table>
	</div> <!--fim do input-group-->

	<div class="input-group">
		<form id="novoAutor" method="post">
			<div class="input-box">
				<div class="title"><h2>Novo Autor</h2></div>
				<input type="text" name="autor" placeholder="Nome do Autor...">
			</div>
			<div class="bnt">
				<button>Cadastrar</button>
			</div>
		</form>
<?php
	if(isset($_POST['autor'])){
		CadastrarAutor($_POST['autor']);
	}
?>

<h2>Autores Cadastrados</h2>
<table>
	<tr>
		<td>Nome</td>
		<td>#</td>
	</tr>
	<?php
		if(isset($_GET['excluir_autor'])){
			ExcluirGenero($_GET['excluir_autor']);
		}
		$todos = ListarAutor("");
		while($autor = $todos->fetch_object()){
			echo '<tr>
					<td>'.$autor->nome.'</td>
					<td>
						<a href="?excluir_autor='.$autor->cd.'">Excluir</a>
					</td>
				</tr>';		}
	?>
	</table>
	</div>
	

	<div class="input-group">
		<form id="novaEditora" method="post">
			<div class="input-box">
				<div class="title"><h2>Nova Editora</h2></div>
				<input type="text" name="editora" placeholder="Nome da Editora...">
			</div>
			<div class="bnt">
				<button>Cadastrar</button>
			</div>
		</form>
<?php
	if(isset($_POST['editora'])){
		CadastrarEditora($_POST['editora']);
	}
?>

<h2>Editoras Cadastradas</h2>
<table>
	<tr>
		<td>Nome</td>
		<td>#</td>
	</tr>
	<?php
		if(isset($_GET['excluir_editora'])){
			ExcluirEditora($_GET['excluir_editora']);
		}
		$todos = ListarEditora("");
		while($editora = $todos->fetch_object()){
			echo '<tr>
					<td>'.$editora->nome.'</td>
				</tr>';		}
	?>
	</table>
	<br><hr><br>

		</div><!--fim do input-group-->
	<div class="livro">
		<h2>Livros Cadastrados</h2>
		<?php
			$fLivro = ListarLivro("");
			while ($livros = $fLivro->fetch_object()) {
				echo '
					<br>
					<h3>'.$livros->titulo.'</h3>
					<img src="'.$livros->capa.'">
					<br>
					<br>

				';
			}

		?>
	</div>
	</div>

</div>

<form method="post">
	Livro:
	<select name="item">
		<?php
			$acervo = ListarLivro(0);
			while($livro = $acervo->fetch_object()){
				$capa = ($livro->capa !="") ? $livro->capa : 'imgs/sem_capa.png';
			echo '<option value="'.$livro->cd.'">'.$livro->titulo.'</option>' ;
			}
			?>
		</select>
		Pessoa:
		<select name ="pessoa">
			<?php
				$todos = ListarUsuario(0);
				while($p = $acervo->fetch_object()){
					echo '<option value="'.$p->rm.'">'.$p->nome.'</option>' ;
				}
				?>
		</select>
		<select name="prazo">
			<option value="7">1 Semana</option>
			<option value="15">15 Dias</option>
			<option value="30"> 30 Dias</option>
		</select>
		<br>
		<button>Emprestar</button>
	</form>
	<?php
		if(isset($_POST['pessoa'])){
			Emprestar($_POST['pessoa'],$_POST['item'],$_POST['prazo']);
	}
	?>
	<?php 
