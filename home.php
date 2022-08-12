<?php
include('biblioteca.php');
?>

<form id="novoGenero">
    <fieldset>
        <legend> Novo Gênero</legend>
        Nome: <input type="text" name="genero"><br>
        <button>Cadastrar </button>
</fieldset>
</form>
<?php
    if(isset($_POST['genero'])){
        CadastrarGenero($_POST['genero']);
    }
    ?>
    <h1> Gêneros Cadastrados</h1>
    <table>
        <tr>
            <td>Nome</td>
            <td>#</td>
</tr>
<?php
$todos = ListarGenero("");
while($gen = $todos->fetch_array()){
    echo '<tr>
    <td>' .$gen->nome. '</td>
    <td>
        <a href="?exluir_gen=' .$gen->cd. '">Excluir</a>
        </td>
        </tr>';}
        ?>
        </table>
