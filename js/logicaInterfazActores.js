validarCredenciales();
imprimirTablaActores();


document.querySelector('#txtAproximacion').addEventListener('keyup',imprimirTablaConFiltro);
document.querySelector('#btnRegistrar').addEventListener('click',obtenerDatosRegistro);
function obtenerDatosRegistro(){
  var sNombre1 = '';
  var sNombre2 = '';
  var sApellido1 = '';
  var sApellido2 = '';
  var dNacimiento = '';
  var sGenero = '';
  var infoActor =[];

  sNombre1 = document.querySelector('#txtNombre1').value;
  sNombre2 = document.querySelector('#txtNombre2').value;
  sApellido1 = document.querySelector('#txtApellido1').value;
  sApellido2 = document.querySelector('#txtApellido2').value;
  dNacimiento = document.querySelector('#txtNacimiento').value;
  sGenero = document.querySelector('input[type=radio]:checked').value;

  infoActor.push(sNombre1, sNombre2, sApellido1, sApellido2, dNacimiento,sGenero);
  registrarActor(infoActor);
  imprimirTablaActores();
}
function imprimirTablaConFiltro(){
  var sFiltro = document.querySelector('#txtAproximacion').value;
  var lista =[];
  var listaActores = obtenerListaActoresAproximacion(sFiltro);


  var tbody = document.querySelector('#tblActores tbody');
  tbody.innerHTML ='';
  for(var i = 0; i < listaActores.length;i++){
    var fila = tbody.insertRow(i);

    var celdaPrimerNombre = fila.insertCell();
    celdaPrimerNombre.innerHTML = listaActores[i]['nombre1'];

    var celdaSegundoNombre = fila.insertCell();
    celdaSegundoNombre.innerHTML = listaActores[i]['nombre2'];

    var celdaPrimerApellido = fila.insertCell();
    celdaPrimerApellido.innerHTML = listaActores[i]['apellido1'];

    var celdaSegundoApellido = fila.insertCell();
    celdaSegundoApellido.innerHTML = listaActores[i]['apellido2'];

    var celdaNacimiento = fila.insertCell();
    var fechaNacimiento = new Date(listaActores[i]['fecha_nacimiento']);
    var dia = Number(fechaNacimiento.getDate() + 1);
    var mes = Number(fechaNacimiento.getMonth() + 1);
    var anno = fechaNacimiento.getFullYear();
    if(dia < 10){
      dia = '0' + dia;
    }
    if(mes < 10){
      mes = '0' + mes;
    }
    celdaNacimiento.innerHTML = dia+'-'+mes+'-'+anno;

    var celdaGenero = fila.insertCell();
    celdaGenero.innerHTML = listaActores[i]['genero'];
  }
}

function imprimirTablaActores(){
  var listaActores = obtenerListaActores();


  var tbody = document.querySelector('#tblActores tbody');
  tbody.innerHTML ='';
  for(var i = 0; i < listaActores.length;i++){
    var fila = tbody.insertRow(i);

    var celdaPrimerNombre = fila.insertCell();
    celdaPrimerNombre.innerHTML = listaActores[i]['nombre1'];

    var celdaSegundoNombre = fila.insertCell();
    celdaSegundoNombre.innerHTML = listaActores[i]['nombre2'];

    var celdaPrimerApellido = fila.insertCell();
    celdaPrimerApellido.innerHTML = listaActores[i]['apellido1'];

    var celdaSegundoApellido = fila.insertCell();
    celdaSegundoApellido.innerHTML = listaActores[i]['apellido2'];

    var celdaNacimiento = fila.insertCell();
    var fechaNacimiento = new Date(listaActores[i]['fecha_nacimiento']);
    var dia = Number(fechaNacimiento.getDate() + 1);
    var mes = Number(fechaNacimiento.getMonth() + 1);
    var anno = fechaNacimiento.getFullYear();
    if(dia < 10){
      dia = '0' + dia;
    }
    if(mes < 10){
      mes = '0' + mes;
    }
    celdaNacimiento.innerHTML = dia+'-'+mes+'-'+anno;

    var celdaGenero = fila.insertCell();
    celdaGenero.innerHTML = listaActores[i]['genero'];
  }
}
