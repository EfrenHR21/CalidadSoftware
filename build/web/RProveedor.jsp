<%@page import="Persistencia.*" %>
<%@page import="Negocio.*" %>
<%@page import="Controlador.*" %>
<%@page import="java.util.*" %>
<html>
    <head>
        <meta charset="UTF-8">
        <link rel="icon" type="image/png" href="Imagenes/IProductos/Inicio/LOGO.jpg">
        <title>Restaurante Pihuicho</title>
        <link href="CSS-Header/EstiloHeade.css" rel="stylesheet" type="text/css"/>
        <link href="CSS-Login/EstiloLogin01.css" rel="stylesheet">
        <link href="CSS/Catalogo/EstiloLateralB.css" rel="stylesheet" type="text/css"/>
        <link href="CSS/Catalogo/EstiloBFilas.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css">
        <meta name="viewport" content="width=device-width, initial-scale=1" />
    </head>
    <body>
        <%!
            ProveedorDAO provDao = new ProveedorDAO();
        %>       
        <main>
            <div class="contenedor-proveedor">
                <div class="login-box">
                    <h2>Registro Proveedor</h2>
                    <form action="${pageContext.servletContext.contextPath}/RgtrProveedor" method="POST">
                      <div class="user-box">
                        <input type="text" name="nombreProv" required="">
                        <label>Nombre</label>
                      </div>
                       <div class="user-box">
                        <input type="text" name="correo" required="">
                        <label>Correo</label>
                      </div> 
                      <div class="user-box">
                        <input type="text" name="RUC" required="">
                        <label>RUC</label>
                      </div> 
                      <div class="user-box">
                        <input type="text" name="telefono" required="">
                        <label>Numero</label>
                      </div>
                      <div class="user-box">
                        <input type="text" name="direccion" required="">
                        <label>Direccion</label>
                      </div>
                      <div class="boton-box">
                          <input type="submit" name="enviar" value="Registrar P." id="enviar">
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
