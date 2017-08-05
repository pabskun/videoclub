

function obtenerListaActoresPelicula(pidPelicula){
  var listaActores =[];
  var peticion = $.ajax({
    url: 'services/listar_actores_por_pelicula.php',
    type: 'get',
    dataType : 'json',
    async:false,
    data:{
      'pid': pidPelicula
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
