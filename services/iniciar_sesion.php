<?php

//se carga la conexion
require_once 'conexion.php';

$pcorreo = $_GET['pcorreo_electronico'];
$pcontrasenna = $_GET['pcontrasenna'];
//Se crea la sentencia que llama al procedimiento almacenado
$sentencia_sql = "CALL pa_iniciar_sesion"."('$pcorreo','$pcontrasenna')";


//Se ejecuta la sentencia sql y se alamcena el resultado
$result = $conexion->query($sentencia_sql);

if(!$result)die("Falló la sentencia sql " . $conexion->error);



$registro = mysqli_fetch_assoc($result);




echo json_encode($registro);

?>
