function ajaxCall(stringCall, callback){
var httpRequest = new XMLHttpRequest;
    
	httpRequest.onreadystatechange = function(){
		if (httpRequest.readyState === 4) {
			if (httpRequest.status === 200) {
			  callback(httpRequest.responseText);
			}
		}
	};
	httpRequest.open('GET', stringCall);
	httpRequest.send();
}
function inicializa(){
	ajaxCall("games.php?action=recuperaCidades", inicializaSelecaoCidades);
	ajaxCall("games.php?action=recuperaFabricantes", inicializaSelecaoFabricantes);
    ajaxCall("games.php?action=recuperaRemetentes", inicializaSelecaoRemetentes);
	ajaxCall("games.php?action=mostraUsuarios", listaUsuarios);
	ajaxCall("games.php?action=mostraJogos", listaJogos);
    ajaxCall("games.php?action=mostraForum", listaForum);
}
function insereUsuario(){	
	var i_use = document.getElementById('i_use').value;
	var i_nic = document.getElementById('i_nic').value;
	var i_ema = document.getElementById('i_ema').value;
	var i_ida = document.getElementById('i_ida').value;
	var i_cid = document.getElementById('listaCidades').value;
	//limpeza dos campos do form	
	document.getElementById('i_use').value = '';
	document.getElementById('i_nic').value = '';
	document.getElementById('i_ema').value = '';
	document.getElementById('i_ida').value = '';
	document.getElementById('listaCidades').value = 0;
	
	parms= "&usuario="+i_use+"&nick="+i_nic+"&email="+i_ema+"&idade="+i_ida+"&cidade="+i_cid;	
	ajaxCall("games.php?action=ins" + parms, listaUsuarios);
}
function insereJogo(){	
	var i_jog = document.getElementById('i_jog').value;
	var i_fab = document.getElementById('listaFabricantes').value;
	var i_pre = document.getElementById('i_pre').value;
	var i_cla = document.getElementById('i_cla').value;
	//limpeza dos campos do form
	document.getElementById('i_jog').value = '';
	document.getElementById('listaFabricantes').value = 0;
	document.getElementById('i_pre').value = '';
	document.getElementById('i_cla').value = '';
	
	parms= "&jogo="+i_jog+"&fab="+i_fab+"&preco="+i_pre+"&class="+i_cla;
	ajaxCall("games.php?action=insJogo" + parms, listaJogos);
}
function deletaUsuario(codUsuario){
		ajaxCall("games.php?action=del&id=" + codUsuario, listaUsuarios);
}
function deletaJogo(codJogo){
		ajaxCall("games.php?action=delJogo&id=" + codJogo, listaJogos);
}
function inicializaSelecao(lis, elemento){
	var x = document.getElementById(elemento);	
	var jsonData = JSON.parse(lis);

	for(i=0;i<jsonData.length;i++){
		var option = document.createElement("option");
		option.text = jsonData[i];
		option.value = i + 1;
		if (i==0) option.selected = true;
		x.add(option);
	}
}
function inicializaSelecaoCidades(lisCidades){  
  inicializaSelecao(lisCidades, "listaCidades");
}
function inicializaSelecaoFabricantes(lisFabricantes){  
  inicializaSelecao(lisFabricantes, "listaFabricantes");
}

function inicializaSelecaoRemetentes(lisRemetentes){  
    inicializaSelecao(lisRemetentes, "listaRemetentes");
    console.log('remetentes',lisRemetentes);
  }
function listaUsuarios(lisUsuarios){
	document.getElementById('tab_usuarios').innerHTML = lisUsuarios;
}
function listaJogos(lisJogos){
	document.getElementById('tab_jogos').innerHTML = lisJogos;
}

function listaForum(lisForum){
	document.getElementById('tab_forum').innerHTML = lisForum;
}

