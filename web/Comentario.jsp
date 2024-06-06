<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>
<%@page import="config.ConexionBD" %>
<%@page import="Controlador.*" %>
<%@page import="Persistencia.*" %>
<%@page import="Negocio.*" %>

<% 
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    Cliente cli = (Cliente) session.getAttribute("loginCliente");
    if(cli==null || cli.getID_cli()==null || cli.getNom_cli()==null || cli.getApe_cli()==null){
        response.sendRedirect("InicioS.jsp");
    }
%>
<html>
    <head>
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="icon" type="image/png" href="Imagenes/IProductos/Inicio/LOGO.jpg">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css">
        <title>Restaurant Pihuicho</title>
        <link href="CSS/Catalogo/MostrarComentario.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">

        <link  rel="stylesheet"
     href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css"/>
        <link href="CSS-Header/EstiloHeade.css" rel="stylesheet">
        <link href="CSS/Catalogo/Comentario.css" rel="stylesheet" type="text/css"/>
        <link href="CSS-Main-Principal/EstiloMPrincipal.css" rel="stylesheet">
        <link href="CSS-Main-Principal/EstiloMVendido.css" rel="stylesheet">
        <link href="CSS/whatsapp.css" rel="stylesheet" type="text/css"/>
        
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css" >
    </head>
    <body>
        <a href= "https://api.whatsapp.com/send?phone=958407045&text=¿Tiene alguna duda? ¡Escribenos!"
           target="_blank" class="whatsapp-btn"><i class="bi bi-whatsapp"></i>
            <div class="joinchat__tooltip"><i class="bi bi-person-circle"></i>
                <div class="text">Podemos ayudarte</div>
            </div>
        </a>
        <%!
            ComentariosDAO comDao = new ComentariosDAO();
        %>
        <header>
            <div class="logo">
                <a href="indexLog.jsp"><img src="Imagenes/IconoLogoGif.gif" alt=""/></a>
            </div>


            <li class="nav-item" style="font-weight: bold">
                <a class="nav-link" href="ControladorCarrito?accion=Carrito"><i class="fa-solid fa-cart-arrow-down fa-fade">&nbsp;(<label style="color:#0500c8"> ${contador} </label>)</i>&nbsp;Carrito</a>
            </li>
            <div class="info-header2">
                <nav>
                    <a href="Intranet_cliente.jsp"><i class="fa-solid fa-hand-sparkles fa-bounce"></i>&nbsp;Bienvenid@ ${loginCliente.getNom_cli()}</a>
                    <a href="Comentario.jsp"><i class="fa-solid fa-hand-sparkles fa-bounce"></i>&nbsp;Comentarios</a>
                </nav>
                <form action="Sesion" method="POST">
                    <button name="cerrar" class="button type1" class="icon-a"><i class="fa-solid fa-right-from-bracket icons"></i>&nbsp;Cerrar Sesión</button>
                </form>
            </div>
        </header> 

        <section>

            <form class="minimalista-formulario" method="post" action="RgtrComentarios">

                <fieldset>
                    <legend>DEJANOS TU COMENTARIO!</legend>

                    <div class="minimalista-contenedor-campos">
                        <div class="minimalista-campo">
                            <label>Nombre</label>
                            <input class="minimalista-input-text" type="text" name="nombre" readonly value='${loginCliente.getNom_cli()} ${loginCliente.getApe_cli()} '  required="">
                        </div>

                        <div class="minimalista-campo">
                            <label>Mensaje</label>
                            <textarea class="minimalista-input-text" type="text" name="comentario" required="" placeholder="¿Qué te parece nuestro servicio?"></textarea>
                        </div>
                    </div> <!-- .minimalista-contenedor-campos -->
                    <div class="minimalista-alinear-derecha flex">
                        <input class="minimalista-btn minimalista-btn-danger minimalista-boton" type="submit" name="enviar" value="Registrar" id="enviar">
                    </div>

                </fieldset>
            </form>
            <%
                List<Comentario> listaCom = comDao.MostarComentarios();
                Iterator<Comentario> iter = listaCom.iterator();
                Comentario com = null;
                while (iter.hasNext()) {
                    com = iter.next();
            %>
 
            <div class="listita-comment">

                <ul id="comments-list" class="comments-list">

                    <li>
                        <div class="comment-main-level">

                            <div class="comment-avatar">
                            <img src="Imagenes/User-Avatar.png" alt="10px"/></div> 
                            <!--  Contenedor del Comentario -->
                            <div class="comment-box">
                                <div class="comment-head">
                                    <h6 class="comment-name by-author"> <%= com.getNombre()%></a></h6>
                                    <%= com.getFecha()%>
                                    <i class="fa fa-reply"></i>
                                    <i class="fa fa-heart"></i>
                                </div>
                                <div class="comment-content">
                                    <%= com.getComentario()%>
                                </div>
                            </div>
                        </div>
                    </li>
                </ul>
            </div>


        </section>
        <%
            }
        %>
        <footer class="footer">
            <jsp:include page="Footer.jsp" flush="true" />
        </footer> 

    
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>

    </body>
</html>

