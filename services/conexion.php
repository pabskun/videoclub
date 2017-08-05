

<?php
  //Se cargan las credenciales
  require_once 'credenciales.php';

  //Se usan las credenciales para establecer conexión con mysql
  $conexion = new mysqli($host_name,$user_name,$password,$data_base);

  //En caso de que no se pueda conectar a la base de datos, se muestra un mensaje de error
  if($conexion->connect_error)die(($conexion->error).' No se pudo establecer la conexión, revise las credenciales');

  //Establece el mapa de caracteres utf8
  $conexion->set_charset("utf8");


?>
