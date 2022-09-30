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
.title{
	display: flex;
	justify-content: center;
	color: #fff;
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
.card{
	width:18rem;
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
	</div>

	<div class="card" style="width: 18rem;">
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
	

	
