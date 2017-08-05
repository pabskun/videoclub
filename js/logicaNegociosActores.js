
function obtenerListaActores(){
  var aListaActores = [];

    var req = $.ajax({
      url: 'services/listar_actores.php',
      dataType: 'json',
      async:false,
      data:{

      }
    });
    req.done( function( respuesta ) {
      aListaActores = respuesta;

    });
    req.fail(function() {
      aListaActores = [];
      console.log('error')
    });

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
    },
    success: function(respuesta){
      console.log('Se registro satisfactoriamente');
    },
    error: function(respuesta,error){
      console.log(respuesta + 'error: ' + error);

    }
  });
}
