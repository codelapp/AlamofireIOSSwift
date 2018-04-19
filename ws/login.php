<?php 
include 'conexion.php';

$respuesta = array();

if ($_SERVER['REQUEST_METHOD'] == 'POST'){

	$usuario = $_POST['usuario'];
	$pass = $_POST['pass'];

	$sel = $con->query("SELECT id FROM contactos WHERE usuario = '$usuario' AND pass = '$pass' ");
	$res = mysqli_num_rows($sel);

	if ($res == 1) {
		$respuesta['mensaje'] = 'login completo';
	}else{
		$respuesta['mensaje'] = 'no funciono';
	}
	


}


echo json_encode($respuesta);


 ?>