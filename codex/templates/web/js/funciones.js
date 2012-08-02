/*

	Generador de tiradas de dados:

	- Versión:	1.2

	- Autor:	Miguel Ángel Rodríguez Valverde

	- Fecha:	24/05/2012

	- email:	miguelarvalverde@hotmail.com



	- Si vas a usar este código en tu página, me gustaría que me lo comunicases. (:

*/

var capa;									// ------------------------------ capa donde mostrar resultados
var resultados;								// ------------------------------ matriz para resultados
function tirar1Dado( tipoDado )				// ------------------------------ función tirar1Dado()
{
	return Math.floor( ( ( Math.random() / 10 ) * tipoDado ) * 10 ) + 1;
}
function repetirDado( i, j )				// ------------------------------ función repetirDado()
{
	resultados[i][j] = tirar1Dado( formulario.tipoDado.value )
	mostrarResultados( capa );
}

function mostrarResultados()				// ------------------------------ función mostrarResultados()
{
	$( '#' + capa ).empty();
	$( '#' + capa ).append( '<h2>Tiradas generadas</h2>' );
	for ( var i = 0; i < resultados.length; i++ )
	{
		$( '#' + capa ).append( '<div id="tanda' + i + '" class="tanda"></div>' );
		$( '#tanda' + i ).append( '<h3>Tanda ' + ( i + 1 ) + '</h3>' );
		$( '#tanda' + i ).append( '<div id="dados' + i + '" class="img_dados"></div>' );
		var totalTanda = 0;
		for ( var j = 0; j < resultados[i].length; j++ )
		{
			totalTanda += resultados[i][j];
			if ( 100 != formulario.tipoDado.value )
				$( '#dados' + i ).append( '<img id="dado_' + i + '_' + j + '" alt="' + resultados[i][j] + '" title="' + resultados[i][j] + '" src="/ima/dados/' + resultados[i][j] + 'd' + formulario.tipoDado.value + '.png" onclick="javascript:repetirDado( ' + i + ', ' + j + ' )">' );

			else
			{
				var dado1 = Math.floor( resultados[i][j] / 10 );
				var dado2 = resultados[i][j] - ( dado1 * 10 );
				if ( 0 == dado1 )
					jQuery( "#dados" + i ).append( '<img id="dado_'+i+'_'+j+'_1" title="0" alt="0" src="/ima/dados/10d10.png" onclick="javascript:repetirDado( ' + i + ', ' + j + ' )">' );
				else
					jQuery( "#dados" + i ).append( '<img id="dado_'+i+'_'+j+'_1" title="'+dado1+'" alt="'+dado1+'" src="/ima/dados/'+dado1+'d10.png" onclick="javascript:repetirDado( ' + i + ', ' + j + ' )">' );
				if ( 0 == dado2 )
					jQuery( "#dados" + i ).append( '<img id="dado_'+i+'_'+j+'_2" title="0" alt="0" src="/ima/dados/10d10.png" onclick="javascript:repetirDado( ' + i + ', ' + j + ' )">' );
				else
					jQuery( "#dados" + i ).append( '<img id="dado_'+i+'_'+j+'_2" title="'+dado2+'" alt="'+dado2+'" src="/ima/dados/'+dado2+'d10.png" onclick="javascript:repetirDado( ' + i + ', ' + j + ' )">' );

				if ( ( resultados[i].length - j ) > 1 ) $( '#dados' + i ).append( '<div class="separador_dados"></div>' );
			}
		}

		$( '#tanda' + i ).append( '<div id="resultadotanda' + i + '" class="resultado_tanda">' + totalTanda + ' + ' + ( formulario.bonusDado.value * formulario.numDados.value ) + ' = <span>' + (totalTanda + (formulario.bonusDado.value * formulario.numDados.value)) + '<span></div>' );
	}
}

function tirarDados( div )				// ------------------------------ función tirarDados() ( FUNCIÓN PRINCIPAL )
{
	capa = div;
	resultados = new Array();

	for ( var i = 0; i < formulario.numTandas.value; i++ )
	{
		resultados[i] = new Array();
		for ( var j = 0; j < formulario.numDados.value; j++ )
		{
			resultados[i][j] = tirar1Dado( formulario.tipoDado.value );
		}
	}

	mostrarResultados();

}
