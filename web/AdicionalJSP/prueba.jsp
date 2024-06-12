<%@page import="java.math.BigInteger"%>
<%@page import="java.security.MessageDigest"%>
<%@page import="Persistencia.*" %>
<%@page import="Negocio.*" %>
<%@page import="Presentacion.*" %>
<%@page import="java.util.*" %>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="CSS/estilosLR.css" rel="stylesheet" type="text/css"/>
        <link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap" rel="stylesheet">

    </head>
    <body>
         <header>
            <jsp:include page="Header.jsp" flush="true" />
        </header>
        <main>

            <div class="contenedor__todo">
                <div class="caja__trasera">
                    <div class="caja__trasera-login">
                        <h3>¿Ya tienes una cuenta?</h3>
                        <p>Inicia sesión para entrar en la página</p>
                        <button id="btn__iniciar-sesion">Iniciar Sesión</button>
                    </div>
                    <div class="caja__trasera-register">
                        <h3>¿Aún no tienes una cuenta?</h3>
                        <p>Regístrate para que puedas iniciar sesión</p>
                        <button id="btn__registrarse">Regístrarse</button>
                    </div>
                </div>

                <!--Formulario de Login y registro-->
                <div class="contenedor__login-register">
                    <!--Login-->
                    <form action="Sesion" method="POST" class="formulario__login"> 
                        <h2>Iniciar Sesión</h2>
                        <input type="email" name="correo" id="correo" placeholder="Correo Electronico">
                        <input type="text" name="contra" id="password" placeholder="Contraseña">
                        <button class="btn btn-warning form-control" type="button" id="btnMostrarClave" >Mostrar</button>
                        <input type="submit" name="accion" id="ingresar" value="ingresar">
                    </form>
                    
                <%! ClienteDAO cliDao = new ClienteDAO(); %>
                
                    <!--Register-->
                    <form action="RgtrCliente" class="formulario__register" method="post">
                        <h2>Regístrarse</h2>
                        <input type="text" name="nom_cli" placeholder="Nombres">
                        <input type="text" name="ape_cli" placeholder="Apellidos"><br>
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
                        <input type="email" name="correo" placeholder="Correo Electronico">
                        <input type="text" name="contra" id="password" placeholder="Contraseña">
                          <button class="btn btn-warning form-control" type="button" id="btnMostrarClave" >Mostrar</button>
                           <span id="mensaje" ></span>
                        <ul>
                            <li id="mayus">1 mayuscula</li> 
                           <li id="minus">1 minuscula</li> 
                           <li id="special">1 caracter especial</li> 
                           <li id="number">1 numero</li> 
                           <li id="len"> 6 caracteres</li> 
                        </ul>
                           
                        <input type="text" name="edad" pattern="[0-9]+" placeholder="Edad">
                        
                        <input type="text" name="cell_cli" id="num" pattern="[0-9]+" placeholder="Numero">
                           
                        <input type="submit" name="enviar" value="Registrar cliente" id="enviar">
                        
                    </form>
                </div>
            </div>

        </main>
        
        <script src="https://code.jquery.com/jquery-3.7.1.js"></script>
        <script src="js/scriptLR.js" type="text/javascript"></script>
        <script src="js/restricciones.js" type="text/javascript"></script>
        <script src="js/MostrarContra.js" type="text/javascript"></script>
</html>
