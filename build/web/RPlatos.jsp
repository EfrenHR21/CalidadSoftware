<%@page import="DAO.*" %>
<%@page import="Modelo.*" %>
<%@page import="Controlador.*" %>
<%@page import="java.util.*" %>
<html>
    <head>
        <meta charset="UTF-8">
        <link rel="icon" type="image/png" href="Imagenes/IProductos/Inicio/LOGO.jpg">
        <title>Restaurante Pihuicho</title>
        <link href="CSS-Login/EstiloHLogin.css.css" rel="stylesheet">
        <link href="CSS-Header/EstiloHeadeR.css" rel="stylesheet" type="text/css"/>
        <link href="CSS-Login/EstiloLogin01.css" rel="stylesheet">
        <link href="CSS/Catalogo/EstiloLateralB.css" rel="stylesheet" type="text/css"/>
        <link href="CSS/Catalogo/EstiloBFilas.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css">
        <meta name="viewport" content="width=device-width, initial-scale=1" />
    </head>
    <body>
        <%!
            PlatosDAO plaDao = new PlatosDAO();
        %>
        <main>
            <div class="contenedor-cliente">
                <div class="login-box">
                    <h2>Registro Plato</h2>
                    <form action="RgtrPlatos" method="POST" enctype="multipart/form-data">
                      <div class="user-box">
                        <input type="text" REQUIRED name="nombrep" required="">
                        <label>Nombre</label>
                      </div>
                      <div class="user-box">
                        <input type="text" REQUIRED name="descripcionp" required="">
                        <label>Descripción</label>
                      </div>  
                      <div class="user-box">
                        <input type="text" REQUIRED name="preciop" required="">
                        <label>Precio</label>
                      </div>   
<!--                      <div class="user-box">
                        <input type="text" REQUIRED name="urlimagen" required="">
                        <label>URL imagen</label>
                      </div> -->
                      <div class="box-upload">
                            <label for="subirImagen"><i class="fa-solid fa-upload"></i>Subir imagen</label>
                            <input type="file" id="subirImagen" name="fileImagen" required="">
                      </div>

                      <div class="boton-box">
                          <input type="submit" name="enviar" value="Registrar plato" id="enviar">
                      </div>

                    </form>
                </div>
            </div>    
        </main> 
        <% 
            if(request.getAttribute("message")!=null){
        %>
        <script>alert('<%= request.getAttribute("message") %>') </script>
        <% 
            }
        %>     
    </body>
</html>

