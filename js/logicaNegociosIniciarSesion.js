function iniciarSesion(pcorreo,pcontrasenna){
  var req = $.ajax({
    url: 'services/iniciar_sesion.php',
    dataType: 'json',
    async:false,
    method: 'get',
    data:{
      'pcorreo_electronico' : pcorreo,
      'pcontrasenna': pcontrasenna
    }
  });
  req.done( function( respuesta ) {
    if(respuesta == null){
      console.log('Correo o contraseña incorrectos');
    }else{
      var tipo_usuario = respuesta['tipo_usuario'];

      sessionStorage.setItem('correo_activo', respuesta['correo']);
      sessionStorage.setItem('tipo_usuario_activo', tipo_usuario );

      switch (tipo_usuario) {
        case '1':
            location.href = 'index.html';
        break;
        case '2':
            location.href = 'index.html';
        break;
        default:

      }

    }


  });
  req.fail(function() {

    console.log('error')
  });



}
