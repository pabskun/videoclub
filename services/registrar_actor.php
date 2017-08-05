
<?php
require_once 'conexion.php';

$nombre1 = $_POST['pnombre1'];
$nombre2 = $_POST['pnombre2'];
$apellido1 = $_POST['papellido1'];
$apellido2 = $_POST['papellido2'];
$nacimiento = $_POST['pnacimiento'];
$genero = $_POST['pgenero'];
$estado = 1;


$sentencia_sql = "CALL pa_registrar_actor"."('$nombre1','$nombre2','$apellido1','$apellido2','$nacimiento','$genero',$estado)";

$result = $conexion->query($sentencia_sql);

if(!$result)die('Falló la sentencia SQL' . $conexion->error);

echo $result;

?>
