<?php 

include 'conexion.php';

$respuesta = array();

if ($_SERVER['REQUEST_METHOD'] == 'POST'){

	$nombre = $_POST['nombre'];
	$email = $_POST['email'];
	$id = $_POST['id'];

	$ins = $con -> query("UPDATE contactos SET nombre = '$nombre', email = '$email' WHERE id = '$id'   ");

	if ($ins) {
		$respuesta['mensaje'] = "edito completo";
	}else{
		$respuesta['mensaje'] = "NO FUNCIONO";
	}


}


echo json_encode($respuesta);

 ?>