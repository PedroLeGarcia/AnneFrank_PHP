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
    min-height: 100vh;
    display: flex;
    justify-content: center;
    align-items: center;
    background: #2980B9;  
    background: -webkit-linear-gradient(to top, #FFFFFF, #6DD5FA, #2980B9);
    background: linear-gradient(to top, #FFFFFF, #6DD5FA, #2980B9); 
}
.tittle{
	
}
</style>
<div class="container">
	<div class="tittle">
		<h1>Olá <?php echo $_SESSION['nome']; ?>! </h1>
	</div>

	<div class="form-novoGenero">
		<form id="novoGenero" method="post">
				<h2>Novo Genêro</h2><br>
					<input type="text" name="genero" placeholder="Nome do Genêro..."><br><br>
				<button>Cadatrar</button>
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
	</div> <!--fim do form-novoGenero-->

	<br><hr><br>

	<div class="form-autor">
		<form id="novoAutor" method="post">
			<h2>Novo autor</h2><br>
			<input type="text" name="autor" placeholder="Nome do Autor..."><br><br>
			<button>Cadatrar</button>
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
	</div><!--fim do form-autor-->
	
	<br><hr><br>

	<div class="form-editora">
	<form id="novaEditora" method="post"><br>
		<h2>Nova Editora</h2><br>
		<input type="text" name="editora" placeholder="Nome da Editora..."><br><br>
		<button>Cadatrar</button>
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
					<td>
						<a href="?excluir_autor='.$editora->cd.'">Excluir</a>
					</td>
				</tr>';		}
	?>
	</table>
	<br><hr><br>
	</div>
</div>
