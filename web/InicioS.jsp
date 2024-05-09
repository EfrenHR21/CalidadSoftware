<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="Modelo.Trabajador"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1"/>
        <link rel="icon" type="image/png" href="Imagenes/IProductos/Inicio/LOGO.jpg">
        <title>Restaurante Pihuicho</title>
        <link href="CSS-Header/EstiloHeade.css" rel="stylesheet" type="text/css"/>
        <link href="CSS-Login/EstiloLogin01.css" rel="stylesheet">
        <link href="CSS/Catalogo/EstiloLateralB.css" rel="stylesheet" type="text/css"/>
        <link href="CSS/Catalogo/EstiloBFilas.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css">
    </head>
    <body>
        <header>
            <jsp:include page="Header.jsp" flush="true" />
        </header>
        
        <main>
            <div class="contenedor-login">
                <div class="login-box">
                    <h2>Inicio de sesión</h2>    
                    <form action="Sesion" method="POST"> 
                       <div class="user-box">
                        <input type="email" name="correo" id="correo" required="">
                        <label>Correo</label>
                      </div> 
                      <div class="user-box">
                        <input type="password" name="contra" id="contra" required="">
                        <label>Contraseña</label>
                      </div>
                      <div class="boton-box">
                          <input type="submit" name="accion" value="ingresar">
                      </div>  
                    </form>
                </div>
            </div>    
        </main> 
        <% 
            if(request.getAttribute("mensajito")!=null){
        %>
        <script>alert('<%= request.getAttribute("mensajito") %>') </script>
        <% 
            }
        %>
    </body>
</html>