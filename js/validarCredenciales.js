document.querySelector('#opcionCerrar').addEventListener('click',cerrarSesion);
function validarCredenciales(){

  var tipo_usuario = sessionStorage.getItem('tipo_usuario_activo');

  var opcionHome = document.querySelector('#opcionHome');
  var opcionRegistrar = document.querySelector('#opcionRegistrar');
  var opcionVisualizar = document.querySelector('#opcionVisualizar');
  var opcionModificar = document.querySelector('#opcionModificar');

  opcionHome.classList.remove('ocultar');
  opcionRegistrar.classList.remove('ocultar');
  opcionVisualizar.classList.remove('ocultar');
  opcionModificar.classList.remove('ocultar');

  switch(tipo_usuario){
    case '1'://adiministrador


    break;
    case '2'://profesor

      opcionRegistrar.classList.add('ocultar');
      opcionModificar.classList.add('ocultar');
    break;
    default:
      location.href="iniciarSesion.html";
    break;
  }
}

function cerrarSesion(){
  sessionStorage.clear();
  location.href="iniciarSesion.html";
}
