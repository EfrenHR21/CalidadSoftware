<%@page import="java.math.BigInteger"%>
<%@page import="java.security.MessageDigest"%>
<%@page import="Persistencia.*" %>
<%@page import="Negocio.*" %>
<%@page import="Presentacion.*" %>
<%@page import="java.util.*" %>
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
        <script src="https://kit.fontawesome.com/5c16d42d2a.js" crossorigin="anonymous"></script>
        
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
                           <input type="email" name="correo" required="">
                        <label>Correo</label>
                      </div> 
                      <div class="user-box">
                          <input type="text" name="contra" id="password" required="">
                           <label>Contraseña</label>
                          <button class="btn btn-warning form-control" type="button" id="btnMostrarClave" >Mostrar!</button>
                           <span id="mensaje" ></span>
                        <ul>
                            <li id="mayus">1 mayuscula</li> 
                           <li id="minus">1 minuscula</li> 
                           <li id="special">1 caracter especial</li> 
                           <li id="number">1 numero</li> 
                           <li id="len"> 6 caracteres</li> 
                        </ul>
                      </div>
                      
                      <div class="user-box">
                        <input type="text" name="edad" pattern="[0-9]+" required="">
                        <label>Edad</label>
                      </div> 
                      <div class="user-box">
                          <input type="text" name="cell_cli" id="num" pattern="[0-9]+" required="">
                        <label>Numero</label>
                        <span id="mensaje" ></span>
                      </div>                          
                      <div class="boton-box">
                          <input type="submit" name="enviar" value="Registrar cliente" id="enviar">
                          <span id="mensaje" ></span>
                      </div>
                    </form>
                </div>
            </div>    
              <% 
            if(request.getAttribute("message")!=null){
        %>
        
        <script>alert('<%= request.getAttribute("message") %>') </script>
        
        <% 
            }
        %>              
        <script src="https://code.jquery.com/jquery-3.7.1.js"></script>
        <script src="js/restricciones.js" type="text/javascript"></script>
        <script src="js/script.js" type="text/javascript"></script>
        
    </body>
</html>
 

