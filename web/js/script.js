$(document).ready(function () {
  $("input#password").focus(function(){
      $(this).val('');
      $(this).get(0).type = 'password';
  });
  $("input#password").click(function(){
      $(this).val('');
      $(this).get(0).type = 'password';
  });        
  $('#btnMostrarClave').click(function () {
      var tipo = document.getElementById("password");

      if(tipo.type == "password"){
          var input=$('#password').attr('type');
          // alert (input);
          $('#password').attr('type', 'text');
          $('#btnMostrarClave').text('Ocular!');
      }else{
          var input=$('#password').attr('type');
          // alert (input);
          $('#password').attr('type', 'password');
          $('#btnMostrarClave').text('Mostrar!');
      }
  });
});