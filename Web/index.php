<?php
/*
--	#**************************************************************************************************
--	#     Copyright (c) 2008 - 2013 Fernando A. Rodríguez para SerInformaticos.es                     #
--	#                                                                                                 #
--	#     Este programa es software libre: usted puede redistribuirlo y / o modificarlo               #
--	#     bajo los t&eacute;rminos de la GNU General Public License publicada por la                  #
--	#     la Free Software Foundation, bien de la versi&oacute;n 3 de la Licencia, o de               #
--	#     la GPL2, o cualquier versi&oacute;n posterior.                                              #
--	#                                                                                                 #
--	#     Este programa se distribuye con la esperanza de que sea &uacute;til,                        #
--	#     pero SIN NINGUNA GARANTÍA, incluso sin la garant&iacute;a impl&iacute;cita de               #
--	#     COMERCIABILIDAD o IDONEIDAD PARA UN PROPÓSITO PARTICULAR. V&eacute;ase el                   #
--	#     GNU General Public License para m&aacute;s detalles.                                        #
--	#                                                                                                 #
--	#     Usted deber&iacute;a haber recibido una copia de la Licencia P&uacute;blica General de GNU  #
--	#     junto con este programa. Si no, visite <http://www.gnu.org/licenses/>.                      #
--	#                                                                                                 #
--	#     Puede descargar la version completa de la GPL3 en este enlace:                              #
--	#     	< http://www.serinformaticos.es/index.php?file=kop804.php >                               #
--	#                                                                                                 #
--	#     Para mas información puede contactarnos :                                                   #
--	#                                                                                                 #
--	#       Teléfono  (+34) 961 19 60 62                                                              #
--	#                                                                                                 #
--	#       Email:    info@serinformaticos.es                                                         #
--	#                                                                                                 #
--	#       MSn:      info@serinformaticos.es                                                         #
--	#                                                                                                 #
--	#       Twitter:  @SerInformaticos                                                                #
--	#                                                                                                 #
--	#       Web:      www.SerInformaticos.es                                                          #
--	#                                                                                                 #
--	#*************************************************************************************************#
*/
// ********************************************************************* //
// Funciones
function mysql00($servidor,$usuario,$clave,$db){
	if ( empty($servidor) AND empty($usuario) AND empty($clave) AND empty($db) ){
		$servidor="SERVER";
		$usuario="USER";
		$clave="PASSWORD";
		$db="hostOnline";
	}

	$enlace=mysql_connect($servidor,$usuario,$clave);
	if (!$enlace) {
		mysql_close($enlace);
		$a1="Error de Conexi&oacute;n";
	} else {
		$a1="Conectado Correctamente";
	}
	$db=mysql_select_db($db,$enlace);
	return $a1;
}

function mysql08($campos, $tabla){
	$query01="SELECT $campos FROM $tabla ";
    $query02=mysql_query($query01);
	$resultado = array();
	while($line = mysql_fetch_array($query02, MYSQL_ASSOC)){
		$resultado[] = $line;
	}
	return $resultado;
}

function mysql12($campos,$tabla,$columna1,$queBuscar1){
	$query01="SELECT $campos FROM $tabla WHERE $columna1 = '$queBuscar1'";
    $query02=mysql_query($query01);
	$resultado = array();
	while($line = mysql_fetch_array($query02, MYSQL_ASSOC)){
		$resultado[] = $line;
	}
	return $resultado;
}

function aleatorio(){
	$caracteres = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
	$aleatorio = '';
	for ($i = 0; $i < 20; $i++) {
		$aleatorio .= $caracteres[rand(0, strlen($caracteres) - 1)];
	}
	return $aleatorio;
}
// ********************************************************************* //
include("libchart/classes/libchart.php");

echo mysql00()."<br />\n";

/*
echo "<pre><br />\n";
print_r($fechas);
echo "</pre><br />\n";
*/

$campos = 'fecha';
$tabla = 'hosts';
$resultado = mysql08($campos, $tabla);

$i='0';
$fechas=array();
foreach($resultado as $resultado0){
	foreach ($resultado0 as $key => $value){
		if( $value2 != $value ){
			$fechas[$i]=$value;
			$i++;
			$value2 = $value;
		}
	}
}

rsort($fechas);

$fechas2=array();
foreach( $fechas as $key => $value ){
	$campos = 'id';
	$tabla = 'hosts';
	$columna1 = 'fecha';
	$queBuscar1 = $value;
	$resultado = mysql12($campos,$tabla,$columna1,$queBuscar1);
	$fechas2[$value]=count($resultado);
}

$chart = new VerticalBarChart();

$i='0';
foreach( $fechas2 as $key => $value ){
	$dia=substr($key,0,10);
	if( $dia != $dia2 ){
		$i++;
		$dia2 = $dia;
		$dataSet[$i] = new XYDataSet();
		$dataSet[$i]->addPoint(new Point($key, $value));
	} else{
		$dataSet[$i]->addPoint(new Point($key, $value));
	}
}

// grafico
foreach( $dataSet as $value ){
	$aleatorio=aleatorio();
	$chart->setDataSet($value);
	$chart->setTitle("Ordenadores Por D&iacute;a");
	$chart->render("generated/$aleatorio.jpg");
	print "<img src=\"generated/".$aleatorio.".jpg\">";
}
?>
