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

<div class="input-group">
		<form id="novoLivro" method="post">
			<div class="input-box">
				<div class="title"><h2>Digite o título do livro</h2></div>
				<input type="text" name="livro" placeholder="Nome do Livro...">
			</div>
			<label for="ano"> Ano do Livro:</label>
			<input type="date" name="ano" id="ano">
			<label for="genero"> Capa do Livro: </label>
			<input type="file" name="fileToUpload" id="fileToUpload">
			<input type="text" name= "classf" id="classf" placeholder="Classificação do Livro:">
			<input type="text" name="estado" id="estado" placeholder="Digite o estado do livro">
			<label for="genero"> Gênero do Livro: </label>
			<?php 
				echo '<select class="select" name="genero" id="genero">';
				ListarGeneroOff();
				echo '</select>';
				?>
				<label for ="editora"> Editora do Livro: </label>
				<?php
					echo '<select class="select" name="editora" id="editora">';
					ListarEditoraOff();
					echo '</select>';
					?>
				<input type="text" name="autor" id="autor" placeholder="Digite o código do autor:">
				<input type="text" name="isbn" id="isbn" placeholder="ISBN do Livro: ">
				<input type="text" name="qtd" id="qtd" placeholder="Quantidade de Livros: ">
				<input type="text" name="sinopse" id="sinopse" placeholder="Sinopse do Livro: ">

			<div class="bnt">
				<button>Cadastrar</button>
			</div>
		</form>
<?php
	if(isset($_POST['livro'])){
		CadastrarLivro($_POST['livro']);
	}
?>

	

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
