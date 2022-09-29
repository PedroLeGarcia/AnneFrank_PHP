<?php
session_start();
//conexão
$user = 'root';
$pass = '';
$banco = 'biblioteca20';
$server = 'localhost';
$conn = new mysqli($server,$user,$pass,$banco);
if(!$conn){
	echo 'Erro de conexão: '.$conn->error;
}
/* Métodos do CRUD do Usuario*/
function Login($email,$senha,$tipo){	
	$sql = 'SELECT * FROM usuario 
			WHERE email = "'.$email.'" AND senha = "'.$senha.'"';
	$res = $GLOBALS['conn']->query($sql);
	if($res->num_rows > 0){		
		$retorno['erro'] = false;
		$user = $res->fetch_object();
		$retorno['dados'] = $user;
	}else{
		$retorno['erro'] = true;		
	}
	if($tipo == "json")
		return json_encode($retorno);
	else
		return $retorno;
}
function CadastrarUsuario($rm,$nome,$email,$senha,$adm){
	$sql = 'INSERT INTO usuario (rm,nome,email,senha,adm) VALUES (';
	$sql.= $rm.',"'.$nome.'","'.$email.'","'.$senha.',"'.$adm.'")';
	$destino = 'usuario/fotos/'.$rm;
	if(!is_dir($destino)){
		mkdir($destino,0777);
	}
	$res = $GLOBALS['conn']->query($sql);
	if($res)
		echo "Usuário cadastrado com sucesso!";
	else
		echo "Erro ao cadastrar ";
}
function ExcluirUsuario($rm){
	$sql = 'DELETE FROM usuario WHERE rm = '.$rm;
	$res = $GLOBALS['conn']->query($sql);
	if($res)
		echo "Excluído com sucesso!";
	else
		echo "Erro ao excluir";
}
function AtualizarUsuario($rm,$nome,$nasc,$gen,$tel){
	$sql = 'UPDATE usuario SET nome= "'.$nome.'", 
				dt_nascimento = "'.$nasc.'", genero = "'.$gen.'",
				telefone = "'.$tel.'" WHERE rm ='.$rm ;
	$res = $GLOBALS['conn']->query($sql);
	if($res)
		echo "Atualizado com sucesso!";
	else
		echo "Erro ao atualizar";
}
function TrocarFoto($rm,$foto){
	$destino = 'usuario/fotos/'.$rm.'/'.$foto['name'];
	if(move_uploaded_file($foto['tmp_name'], $destino)){
		$sql = 'SELECT * FROM usuario WHERE rm = '.$rm;
		$res = $GLOBALS['conn']->query($sql);
		$user = $res->fetch_array();
		unlink($user['perfil']);
		$sql = 'UPDATE usuario SET perfil = "'.$destino.'" WHERE rm = '.$rm;
		$res = $GLOBALS['conn']->query($sql);
		if($res){
			echo "Atualizado com sucesso";
		}else{
			echo "Erro ao atualizar foto";
		}
	}
}
function TrocarSenha($rm){
	$nova_senha = ""; //fazer método
	$msg = "Sua nova senha: ".$nova_senha;
	$sql = 'SELECT * FROM usuario WHERE rm = '.$rm;
	$res = $GLOBALS['conn']->query($sql);
	$user = $res->fetch_array();
	if(mail($user['email'],"Biblioteca [nova senha]",$msg)){
		$sql = 'UPDATE usuario SET senha = "'.$nova_senha.'" WHERE rm = '.$rm;
		$res = $GLOBALS['conn']->query($sql);
		if($res){		
			echo "Nova senha encaminhada para seu email!";
		}else{
			echo "Erro ao trocar a senha. Tente novamente";
		}
	}	
}
/*			genero      */
function CadastrarGenero($nome){
	$sql = 'INSERT INTO genero VALUES(null,"'.$nome.'")';
	$res = $GLOBALS['conn']->query($sql);
	if($res){		
		echo "Gênero Cadastrado";
	}else{
		echo "Erro ao Cadastrar".$GLOBALS['conn']->error;
	}
}

function ListarGenero($cd){
	$sql = 'SELECT * FROM genero';
	if($cd !=""){
		$sql.= ' WHERE cd = '.$cd;
	}
	$res = $GLOBALS['conn']->query($sql);	
	return $res;
}
function ExcluirGenero($cd){
	$sql = 'DELETE FROM genero WHERE cd = '.$cd;
	$res = $GLOBALS['conn']->query($sql);
	if($res){		
		echo "Gênero Excluído";
	}else{
		echo "Erro ao Excluir, verifique se há livros utilizando.";
	}
}

function CadastrarAutor($nome){
	$sql = 'INSERT INTO autor VALUES(null,"'.$nome.'")';
	$res = $GLOBALS['conn']->query($sql);
	if($res){		
		echo "Autor Cadastrado";
	}else{
		echo "Erro ao Cadastrar".$GLOBALS['conn']->error;
	}
}

function ListarAutor($cd){
	$sql = 'SELECT * FROM autor';
	if($cd !=""){
		$sql.= ' WHERE cd = '.$cd;
	}
	$res = $GLOBALS['conn']->query($sql);	
	return $res;
}
function ExcluirAutor($cd){
	$sql = 'DELETE FROM autor WHERE cd = '.$cd;
	$res = $GLOBALS['conn']->query($sql);
	if($res){		
		echo "Autor Excluído";
	}else{
		echo "Erro ao Excluir, verifique se há livros utilizando.";
	}
}

function CadastrarEditora($nome){
	$sql = 'INSERT INTO editora VALUES(null,"'.$nome.'")';
	$res = $GLOBALS['conn']->query($sql);
	if($res){		
		echo "Editora Cadastrada";
	}else{
		echo "Erro ao Cadastrar".$GLOBALS['conn']->error;
	}
}

function ListarEditora($cd){
	$sql = 'SELECT * FROM editora';
	if($cd !=""){
		$sql.= ' WHERE cd = '.$cd;
	}
	$res = $GLOBALS['conn']->query($sql);	
	return $res;
}
function ExcluirEditora($cd){
	$sql = 'DELETE FROM editora WHERE cd = '.$cd;
	$res = $GLOBALS['conn']->query($sql);
	if($res){		
		echo "Editora Excluída";
	}else{
		echo "Erro ao Excluir, verifique se há livros utilizando.";
	}
}

function CadastrarLivro($isbn, $titulo, $ano, $qtd, $sinopse, $classificacao, $id_editora, $id_genero, $estado, $capa, $autores){
	$sql = 'INSERT INTO livro VALUES (null,
	"'.$isbn.'",
	"'.$titulo.'",
	'.$ano.',
	'.$qtd.',
	"'.$sinopse.'",
	"'.$capa['nome'].'",
	"'.$classificacao.'",
	'.$editora.',
	'.$genero.',
	"'.$estado.'")';
	$res = $GLOBALS['conn']->query($sql);
	$id = $GLOBALS['conn']->insert_id;
	if($res){
		if(!is_dir('imgs/'.$id.'/')){
			mkdir('imgs/'.$id.'/');	
		}
		$destino = 'imgs/'.$id.'/'.$capa['name'];
		if(move_uploaded_file($capa['tmp_name'], $destino)){

			$cadastro2 = 'INSERT INTO autor_livro VALUES ';
			$total_autores = count($autores);
			for($i = 0;$i< $total_autores; $i++){
				$cadastro2 .= '('.$id.','.$autores[$i].'),'; 
			} 
			$cadastro2 = substr($cadastro2, 0, -1);
			$cadastro2 .= ';';
			$res2 = $GLOBALS['conn']->query($cadastro2);
			if($res2){
				echo "Livro cadastrado com sucesso";
			}else{
				echo "Erro ao vincular autores";
			}
			}else{
				echo "Erro ao salvar foto dos livros: ".$GLOBALS['conn']->insert_id;
			}
		}else{
			echo "Erro ao cadastrar";
		}
		
	}



function ListarLivro($cd){
	$sql = 'SELECT * FROM livro';
	if($cd>0){
		$sql.=' WHERE cd ='.$cd;
	} 
	$res = $GLOBALS['conn']->query($sql);
	return $res;
}

function Emprestar($usuario,$livro){
	$prazo = "ADDDATE(CURDATE(), INTERVAL ".$prazo." DAY)";
	$sql = 'INSERT INTO emprestimo (id_usuario, id_livro, dt_emprestimo, dt_devolucao)
	VALUES ('.$usuario.','.$livro.',"CURDATE()","'.$prazo.'")';
	$res = $GLOBALS['conn']->query($sql);
	if($res){
		echo "Empréstimo realizado!";
	}else{
		echo "Erro ao registrar empréstimo";
	}
}