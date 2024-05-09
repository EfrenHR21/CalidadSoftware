<%@page import="DAO.*" %>
<%@page import="Modelo.*" %>
<%@page import="Controlador.*" %>
<%@page import="java.util.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1"/>
        <link rel="icon" type="image/png" href="Imagenes/IProductos/Inicio/LOGO.jpg">
        <title>Restaurante Pihuicho</title>
        <link href="CSS-Login/EstiloHLogin.css.css" rel="stylesheet">
        <link href="CSS-Header/EstiloHeade.css" rel="stylesheet" type="text/css"/>
        <link href="CSS-Login/EstiloLogin01.css" rel="stylesheet">
        <link href="CSS/Catalogo/EstiloLateralB.css" rel="stylesheet" type="text/css"/>
        <link href="CSS/Catalogo/EstiloBFilas.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css">
        <meta name="viewport" content="width=device-width, initial-scale=1" />
    </head>
    <body>
        <%!
            ClienteDAO cliDao = new ClienteDAO();
        %>
        <header>
            <input type="checkbox" id="check"> 
            <div class="logo">
                <a href="index.jsp"><img src="Imagenes/IconoLogoGif.gif" alt=""/></a>
            </div>                     
            <div class="info-header">
                <nav>
                    <a href="index.jsp">Tienda</a>
                    <a href="InicioS.jsp">Iniciar Sesión</a>
                </nav>
             </div>
        </header>
        
        <main>
            <div class="contenedor-cliente">
                <div class="login-box">
                    <h2>Registro Cliente</h2>
                    <form action="RgtrCliente" method="POST">
                      <div class="user-box">
                        <input type="text" name="nom_cli" required="">
                        <label>Nombre</label>
                      </div>
                      <div class="user-box">
                        <input type="text" name="ape_cli" required="">
                        <label>Apellido</label>
                      </div>
                      <label>Distrito</label>  
                      <div class="contenedor-select">
                          <select class="elegir-box" name="distrito_cli">
                                    <option value="0">...</option>  
                                    <% 
                                        List<Cliente> listDis= cliDao.mostrarDatosDistrito();
                                        for(Cliente elem: listDis){
                                    %>
                                    <option value="<%= elem.getId_dist()%>"> <%= elem.getNom_dist() %> </option>
                                    <% 
                                        }
                                    %>
                          </select>
                          <div class="icon-contenedor">
                              <i class="fa-solid fa-caret-down"></i>
                          </div>
                      </div><br>  
                       <div class="user-box">
                        <input type="text" name="correo" required="">
                        <label>Correo</label>
                      </div> 
                      <div class="user-box">
                        <input type="password" name="contra" required="">
                        <label>Contraseña</label>
                      </div>
                      <div class="user-box">
                        <input type="text" name="edad" required="">
                        <label>Edad</label>
                      </div> 
                      <div class="user-box">
                        <input type="text" name="cell_cli" required="">
                        <label>Numero</label>
                      </div>                          
                      <div class="boton-box">
                          <input type="submit" name="enviar" value="Registrar cliente" id="enviar">
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

