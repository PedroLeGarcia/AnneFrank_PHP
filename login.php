<form id="entrar" method="post">
    Usuário:
    <input type= "text" id="login" name="login">
    <BR>
        Senha:
        <input type="password" id="senha" name="senha">
        <br>
        <button> Entrar</button>
</form>
<?php
include ('biblioteca.php');
if($_POST){
    $resultado = Login ($_POST['login'],$_POST['senha'],"");
    if($resultado['erro']){
        echo "Usuário e/ou Senha inválido";
    }
    else{
        $user = resultado ['dados'];
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

            header('location: home.php');

        }
        echo "Usuário existe";
    }
}
