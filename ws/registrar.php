<?php 

include 'conexion.php';

$respuesta = array();

if ($_SERVER['REQUEST_METHOD'] == 'POST'){

	$usuario = $_POST['usuario'];
	$pass = $_POST['pass'];
	$nombre = $_POST['nombre'];
	$email = $_POST['email'];

	$ins = $con -> query("INSERT INTO contactos VALUES(DEFAULT,'$usuario','$pass','$nombre','$email')");

	if ($ins) {
		$respuesta['mensaje'] = "SE REGISTRO CORRECTAMENTE";
	}else{
		$respuesta['mensaje'] = "NO FUNCIONO";
	}


}


echo json_encode($respuesta);

 ?>