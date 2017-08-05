
<?php
require_once 'conexion.php';

$nombre1 = 'Denis';
$nombre2 = 'David';
$apellido1 = 'Salmerón';
$apellido2 = 'Ocón';
$nacimiento = '1998-06-28';
$genero = 'Masculino';
$id = 6;


$sentencia_sql = "CALL pa_modificar_actor"."('$nombre1','$nombre2','$apellido1','$apellido2','$nacimiento','$genero',$id)";

$result = $conexion->query($sentencia_sql);

if(!$result)die('Falló la sentencia SQL' . $conexion->error);

echo $result;

?>
