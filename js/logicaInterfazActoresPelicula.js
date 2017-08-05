document.querySelector('#txtIdPelicula').addEventListener('keyup', imprimirActoresPelicula);

function imprimirActoresPelicula(){
  var idPelicula = document.querySelector('#txtIdPelicula').value;
  var actores = obtenerListaActoresPelicula(idPelicula);
  var tbody =  document.querySelector('#tblActores tbody');

  tbody.innerHTML = '';

  for(var i = 0; i < actores.length;i++){
    var fila = tbody.insertRow(i);
    var celdaPelicula = fila.insertCell();
    var celdaActor = fila.insertCell();
    var celdaTipoActor = fila.insertCell();

    celdaPelicula.innerHTML = actores[i]['titulo'];
    celdaActor.innerHTML = actores[i]['nombre'];
    celdaTipoActor.innerHTML = actores[i]['tipo_actor'];
  }
}
