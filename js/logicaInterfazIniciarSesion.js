document.querySelector('#btnIngresar').addEventListener('click', ingresar);

function ingresar(){
  var sCorreo = '';
  var sContrasenna = '';

  sCorreo = document.querySelector('#txtCorreo').value;
  sContrasenna = document.querySelector('#txtContrasenna').value;

  iniciarSesion(sCorreo,sContrasenna);
}
