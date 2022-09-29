<?php
include('biblioteca.php');
?>
<style type="text/css">
*{
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: 'Rubik', sans-serif;
	color: black;
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
</style>

<div class="container">
	<div class="form"><br>
		<div class="form-header">
			<div class="title"> <h1>Olá <?php echo $_SESSION['nome']; ?> Bem-vindo(a) as editoras! </h1> </div>
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
</div>