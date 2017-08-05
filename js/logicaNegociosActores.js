
function obtenerListaActores(){
  var aListaActores = [];
  //request es quien establece la conexion con el php
  var request = $.ajax({
    url: 'services/listar_actores.php',
    dataType: 'json',
    async: false,
    method: 'get',
    data:{
      //Aqui van las paramatros que enviarle al php
    }
  });
  //Peticion que recibe los datos y los almacena en el arreglo si la conexion es exitosa
  request.done(function(datos){
    aListaActores = datos;
  });
  //Si la conexion falla, imprime en consola un mensaje
  request.fail(function(){
    console.log('Error de conexion');
  });
  //Devuelve la lista de actores
  return aListaActores;
}


function obtenerListaActoresAproximacion(psFiltro){
  var listaActores =[];
  var peticion = $.ajax({
    url: 'services/listar_actores_por_aproximacion_nombre.php',
    type: 'get',
    contentType: 'application/x-www-form-urlencoded;charset=ISO-8859-15',
    dataType : 'json',
    async:false,
    data:{
      'filtro': psFiltro
    },
    success: function(respuesta){
      listaActores = respuesta;
    },
    error: function(respuesta,error){
      console.log(respuesta + 'error: ' + error);
      listaActores = [];
    }
  });
  return listaActores;
}

function registrarActor(pinfoActor){
  var peticion = $.ajax({
    url: 'services/registrar_actor.php',
    type: 'post',
    contentType: 'application/x-www-form-urlencoded;charset=ISO-8859-15',
    dataType : 'json',
    async:false,
    data:{
      'pnombre1': pinfoActor[0],
      'pnombre2': pinfoActor[1],
      'papellido1': pinfoActor[2],
      'papellido2': pinfoActor[3],
      'pnacimiento': pinfoActor[4],
      'pgenero': pinfoActor[5]
    }
  });
  request.done(function(datos){
    console.log('Conexion exitosa');
  });
  request.fail(function(){
    console.log('Error de conexion');
  });
}
