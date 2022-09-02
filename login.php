<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Anne Frank | Login</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Oswald:wght@300&family=Rubik&family=Varela+Round&display=swap" rel="stylesheet">

   
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

    <style type="text/css">
*{
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: 'Rubik', sans-serif;
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
.container{
	max-width: 500px;
	box-shadow: 0 5px 10px rgba(0, 0, 0, 0.2);
	display: flex;
	justify-content: center;
    align-items: center;
    padding: 40px 30px;
    border-radius: 10px;
    background: #2980B9;  
    background: -webkit-linear-gradient(to top, #2980B9, #6DD5FA, #FFFFFF);
    background: linear-gradient(to top, #2980B9, #6DD5FA, #FFFFFF); 
}
h2{
    font-family: 'Rubik', sans-serif;
    color: #fff;
}
i{
	color: #fff;
}
img{
	border-radius: 50%;
	border: 2px solid #fff;
}
hr{
	color: #fff;
	border: 1px solid #fff;
}
input[type="submit"]{
	padding: 15px 65px;
	font-size: 20px;
	background-color: #fff;
	border: 1px solid #fff;
	border-radius: 50px;
	cursor: pointer;
	color: #1E90FF;
	transition: 0.5s;
}
input[type="submit"]:hover{
	background-color: #1E90FF;
	color: #fff;
}
.input-box input{
	margin: 0.6rem 0;
	padding: 0.8rem 1.2rem;
	border: none;
	border-radius: 10px;
	box-shadow: 1px 1px #0000001c;
	transition: 0.5s;
}
.input-box input:hover{
	background-color: #eeeeee75;
}
.forgot a{
	text-decoration: none;
	color: #2980B9;
	cursor: pointer;
	transition: 0.5s;
}
.forgot a:hover{
	color: #fff;
}
@media screen and(max-width: 1330px){
	.container{
		width: 50%;
	}
	.login-form{
		width: 100%;
	}
}
@media(max-width: 1064px){
	.container{
		height: auto;
		width: 90%;
	}
	.login-form{
		width: 100%;
	}
}


    </style>
<body>
	<div class="container">
		<center>
			<div class="imagem"><img src="img/logo.jpeg" width="100px"></div><br>
			<div class="login-form">
			<form id="entrar" method="post">
				<div class="input-box">
					<h2>Usuário</h2>
					<i class="fa fa-envelope"></i>
					<input type="text" id="login" name="login" placeholder="Usuário..." required>
				</div>
				<hr>
				<div class="input-box">
					<h2>Senha</h2>
					<i class="fa fa-lock"></i>
					<input type="password" id="senha" name="senha" placeholder="Senha..." required>
				</div>

				<hr>
				<div class="input-bnt">
					<input type="submit" name="Entrar" value="Entrar">
				</div>
			</form>
		</div>
		</center>
	</div>
</body>
</html>

<?php
include('biblioteca.php');
if($_POST){
	$resultado = Login($_POST['login'],$_POST['senha'],"");
	if($resultado['erro']){
		echo "Usuário e/ou Senha inválido";
	}else{		
		$user = $resultado['dados'];
		if($user->status == 'bloqueado'){
			echo 'Usuário bloqueado.';
		}else{
			$_SESSION['rm'] = $user->rm;
			$_SESSION['nome'] = $user->nome;
			$_SESSION['email'] = $user->email;
			$_SESSION['senha'] = $user->senha;
			$_SESSION['perfil'] = $user->perfil;
			$_SESSION['status'] = $user->status;
			$_SESSION['adm'] = $user->adm;
			//redireciona o usuário para a pag adm
			header('location: home.php');
		}
	}
}
