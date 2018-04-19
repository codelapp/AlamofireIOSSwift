<?php 

include 'conexion.php';

$respuesta = array();

if ($_SERVER['REQUEST_METHOD'] == 'POST'){


	$id = $_POST['id'];

	$ins = $con -> query("DELETE FROM contactos WHERE id = '$id' ");

	if ($ins) {
		$respuesta['mensaje'] = "borro completo";
	}else{
		$respuesta['mensaje'] = "NO FUNCIONO";
	}


}


echo json_encode($respuesta);

 ?>