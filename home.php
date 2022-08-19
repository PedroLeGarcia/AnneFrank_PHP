<?php
include('biblioteca.php');
?>
<h1>Olá <?php echo $_SESSION['nome']; ?> </h1>

<form id="novoGenero" method="post">
	<fieldset>
		<legend>Novo Gênero</legend>
		Nome: <input type="text" name="genero"><br>
		<button>Cadatrar</button>
	</fieldset>
</form>
<?php
	if(isset($_POST['genero'])){
		CadastrarGenero($_POST['genero']);
	}
?>
<h1>Gêneros Cadastrados</h1>
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
		<br>
	<form id="novoAutor" method="post">
	<fieldset>
		<legend>Novo Autor</legend>
		Nome: <input type="text" name="autor"><br>
		<button>Cadatrar</button>
	</fieldset>
</form>
<?php
	if(isset($_POST['autor'])){
		CadastrarAutor($_POST['autor']);
	}
?>

<h1>Autores Cadastrados</h1>
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
	<br>

	<form id="novaEditora" method="post">
	<fieldset>
		<legend>Nova Editora</legend>
		Nome: <input type="text" name="editora"><br>
		<button>Cadatrar</button>
	</fieldset>
</form>
<?php
	if(isset($_POST['editora'])){
		CadastrarEditora($_POST['editora']);
	}
?>

<h1>Editoras Cadastradas</h1>
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