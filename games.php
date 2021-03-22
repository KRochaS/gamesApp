<?php

//  ....................................
//  Games App - Aplica��o exemplo em PHP
//  ....................................


function conectaDB(){
	$con  =  mysqli_connect("localhost","root","","games");
	
	if(!$con){
		echo "<h2>Erro na conexao com a base dados...</h2>"; 
		echo "<h2> Erro " . mysqli_connect_errno() . ".</h2>";
		die();
	}
	$con->set_charset("utf8");
	return $con;
}
function mostraTabela($qtdeColunas, $consulta, $func){
	
	$i = 0;
	$tab = "";
	while( $row = mysqli_fetch_array($consulta, MYSQLI_NUM) ) 
	{
		$tab .=  "<tr valign = center>";
		$tab .=  "<td class=tabv><img src=img/sp.gif width=10 height=8></td>";
		for($j = 0; $j < $qtdeColunas; $j++){
			$tab .=  "<td class = tabv width = 180 height = 6>".htmlspecialchars($row[$j])."&nbsp;</td>"; 
		}		
		$tab .=  "<td class = tabv><button type = \"button\" onclick = \"deleta".$func."(".htmlspecialchars($row[$j]).")\">X</button></td>";
		$tab .=  "<td class = tabv></td>"; //exemplo de html gerado: "... onclick = deletaJogo(3)><X> ..."
		$tab .=  "</tr>";
		$i++;
	}
	$tab .=  "<p></p>";
	echo $tab;
}
function recuperaTabela($tabela){
		$con = conectaDB();				
		$result  =  mysqli_query($con, "SELECT nome FROM ".$tabela);
		$retData  =  array();
		while( $row = mysqli_fetch_array($result, MYSQLI_NUM) ){
		  $retData[] = $row[0];
		}
		echo json_encode($retData);
		$con->close();
}
function mostraUsuarios(){
		$con = conectaDB();
		$result = mysqli_query($con,"SELECT usuarios.nome,nick,cidades.nome,email,idade,usuarios.cod FROM usuarios,cidades WHERE usuarios.cidade  =  cidades.cod ORDER BY usuarios.nome"); //eh retornada nesta consulta o campo de codigo do usuario (na ultima posicao) 		
		mostraTabela(5,$result,'Usuario');    //este codigo eh usado como parametro na funcao javascript de delecao
		$con->close();                        //o html da chamada desta funcao de delecao eh montado na funcao php mostraTabela
}
function mostraJogos(){
		$con = conectaDB();
		$result = mysqli_query($con,"SELECT titulos.nome,fabricantes.nome,preco,classificacao,titulos.cod FROM titulos,fabricantes WHERE titulos.fabricante  =  fabricantes.cod ORDER BY titulos.nome"); 		
		mostraTabela(4,$result,'Jogo');
		$con->close();
}

function mostraForum(){
    $con = conectaDB();
    $result = mysqli_query($con,"SELECT forum.CodUsuario,forum.titulo, forum.mensagem FROM forum"); 		
    mostraTabela(4,$result,'Forum');
    $con->close();
}

	if(@$_REQUEST['action'] == "recuperaCidades")     //recupera lista de nomes das cidades
	{
		recuperaTabela('cidades');
	}
	if(@$_REQUEST['action'] == "recuperaFabricantes") //recupera lista de nomes dos fabricantes
	{
		recuperaTabela('fabricantes');
	}
    if(@$_REQUEST['action'] == "recuperaRemetentes") //recupera lista de nomes dos fabricantes
	{
		recuperaTabela('usuarios');
	}
	if(@$_REQUEST['action'] == "ins")  //insere novo Usuario
	{
		$con = conectaDB();
		$nomeUsuario = $con->real_escape_string($_REQUEST['usuario']);
		$nick = $con->real_escape_string($_REQUEST['nick']);
		$email = $con->real_escape_string($_REQUEST['email']);
		$idade = intval($_REQUEST['idade']);
		if($idade == "") $idade = "NULL";  //no input do form em index.html eh empregado min = "1" para limitar a idade minima a 1
		$cidade = $con->real_escape_string($_REQUEST['cidade']);
		
		mysqli_query($con,"INSERT INTO usuarios (nome,nick,email,idade,cidade) VALUES('$nomeUsuario','$nick','$email','$idade','$cidade');");
		$con->close();			
		mostraUsuarios();
	}
	if(@$_REQUEST['action'] == "insJogo") //insere novo Jogo
	{
		$con = conectaDB();
		$jogo = $con->real_escape_string($_REQUEST['jogo']);
		$fabricante = $con->real_escape_string($_REQUEST['fab']);
		$preco = floatval($_REQUEST['preco']);
		$classificacao = intval($_REQUEST['class']);
		
		mysqli_query($con,"INSERT INTO titulos (nome,fabricante,preco,classificacao) VALUES('$jogo','$fabricante','$preco','$classificacao');");
		$con->close();			
		mostraJogos();
	}
	if(@$_REQUEST['action'] == "del")     //remove Usuario
	{
		$con = conectaDB();
		$res = mysqli_query($con,"DELETE FROM usuarios WHERE usuarios.cod  =  ".$_REQUEST['id']);
		$con->close();
		mostraUsuarios();
	}
	if(@$_REQUEST['action'] == "delJogo") //remove Jogo
	{
		$con = conectaDB();
		$res = mysqli_query($con,"DELETE FROM titulos WHERE titulos.cod  =  ".$_REQUEST['id']);
		$con->close();
		mostraJogos();
	}
	
	if(@$_REQUEST['action'] == "mostraUsuarios")
	{
		mostraUsuarios();
	}
		if(@$_REQUEST['action'] == "mostraJogos")
	{
		mostraJogos();
	}

    if(@$_REQUEST['action'] == "mostraForum")
	{
		mostraForum();
	}
?>

