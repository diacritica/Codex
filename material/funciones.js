/*
	- Versión:	1.0
	- Autor:	Miguel Ángel Rodríguez Valverde
	- Fecha:	17/05/2012
	- email:	miguelarvalverde@hotmail.com

	- Si vas a usar este código en tu página, me gustaría que me lo comunicases. (:
*/
function limpiar( capa )
{
var capaALimpiar = document.getElementById( capa );while( capaALimpiar.firstChild ) capaALimpiar.removeChild( capaALimpiar.firstChild );
}
function tirarDados( capa )
{
limpiar( capa );var numTiradas = formulario.numTiradas.value;var numDados = formulario.numDados.value;
var tituloTiradasGeneradas = document.createElement( "h2" );
tituloTiradasGeneradas.appendChild( document.createTextNode( "Tiradas generadas" ) );
document.getElementById( capa ).appendChild( tituloTiradasGeneradas );
var imgDado;var tirada;var totalTirada;var i;var j;
for( i = 1; i <= numTiradas; i++ )
{
var divTirada = document.createElement( "div" );
divTirada.id = "tirada" + i;
divTirada.className = "tirada";
var h3TituloTirada = document.createElement( "h3" );
h3TituloTirada.appendChild( document.createTextNode( "Tanda " + i + ":" ) );
divTirada.appendChild( h3TituloTirada );
var divDados = document.createElement( "div" );
divDados.id = "dados" + i;divDados.className = "img_dados";totalTirada = 0;
for( j = 1; j <= numDados; j++ )
{
tirada = Math.floor( ( ((Math.random()/10)*formulario.tipoDado.value) * 10 ) + 1 );totalTirada += tirada;
if( 100 != formulario.tipoDado.value )
{
imgDado = document.createElement( "img" );imgDado.id = "dado-" + i + "-" + j;imgDado.alt = tirada;
imgDado.title = tirada;imgDado.src = "ima/dados/" + tirada + "d" + formulario.tipoDado.value + ".png";
divDados.appendChild( imgDado );
}else{
var dado1 = Math.floor(tirada/10);var dado2 = tirada - (Math.floor(tirada/10)*10);
imgDado = document.createElement( "img" );imgDado.id = "dado-" + i + "-" + j + "-a";imgDado.alt = dado1;imgDado.title = dado1;
if( dado1 < 1 ) imgDado.src = "ima/dados/10d10.png";
else imgDado.src = "ima/dados/" + dado1 + "d10.png";
divDados.appendChild( imgDado );imgDado = document.createElement( "img" );
imgDado.id = "dado-" + i + "-" + j + "-b";imgDado.alt = dado2;imgDado.title = dado2;
if( 100 == tirada ) imgDado.src = "ima/dados/10d10.png";
else if( 0 == dado2 ) imgDado.src = "ima/dados/10d10.png";
else imgDado.src = "ima/dados/" + dado2 + "d10.png";
divDados.appendChild( imgDado );
}
if( numDados - j >= 1 && 100 == formulario.tipoDado.value )
{
var separador = document.createElement( "div" );separador.className = "separador_dados";divDados.appendChild( separador );
}
divTirada.appendChild( divDados );
}
if( 100 != formulario.tipoDado.value )
{
var divResultadoTirada = document.createElement( "div" );divResultadoTirada.id = "resultadotirada" + i;divResultadoTirada.className = "resultado_tirada";
divResultadoTirada.appendChild( document.createTextNode( " Total: " + totalTirada ) );
divTirada.appendChild( divResultadoTirada );
}
document.getElementById( capa ).appendChild( divTirada );
}
}

function tiradaRapida( ndados, tdados, bonus )
{
var tirada = 0;
for( var i = 1; i <=ndados; i++ )
{
tirada += Math.floor( ( ((Math.random()/10)*tdados)*10 ) + 1 );
}
return tirada + ( bonus * ndados );
}