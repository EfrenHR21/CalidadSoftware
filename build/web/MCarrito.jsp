<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>
<%@page import="config.ConexionBD" %>
<%@page import="Controlador.*" %>
<%@page import="Modelo.*" %>
<%@page import="DAO.*" %>

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
        
        <link href="CSS-Header/EstiloHeadeR.css" rel="stylesheet">
        
        <link href="CSS/Catalogo/EstiloLateralB.css" rel="stylesheet" type="text/css"/>
        <link href="CSS/Catalogo/EstiloBFilas.css" rel="stylesheet" type="text/css"/>
        <link href="CSS-Main-Principal/EstiloMPrincipal.css" rel="stylesheet">
        <link href="CSS-Main-Principal/EstiloMVendido.css" rel="stylesheet">
        <link href="CSS/whatsapp.css" rel="stylesheet" type="text/css"/>
        <link href="CSS-Footer/EstiloFooterPag.css" rel="stylesheet">
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
            PlatosDAO plaDao = new PlatosDAO();
        %>
        <header>
            <input type="checkbox" id="check"> 
            <div class="logo">
                <a href="index.jsp"><img src="Imagenes/IconoLogoGif.gif" alt=""/></a>
            </div>
            
            
            <li class="nav-item" style="font-weight: bold">
                <a class="nav-link" href="ControladorCarrito?accion=Carrito"><i class="fa-solid fa-cart-arrow-down fa-fade">&nbsp;(<label style="color:#0500c8"> ${contador} </label>)</i>&nbsp;Carrito</a>
            </li>
            <div class="info-header2">
                <nav>
                    <a href="Intranet_cliente.jsp"><i class="fa-solid fa-hand-sparkles fa-bounce"></i>&nbsp;Bienvenid@ ${loginCliente.getNom_cli()}</a>
                    <a href="Comentario.jsp"><i class="fa-solid fa-hand-sparkles fa-bounce"></i>&nbsp;Comentarios</a>
                    <a href="CerrarSesion" name="cerrar" class="icon-a"><i class="fa-solid fa-right-from-bracket fa-beat"></i>&nbsp;Cerrar sesión</a>
                </nav>
             </div>
        </header> 
  
        <div style="background: #a8a8a8; padding: 1px;">      
            <div class="container mt-2 table_id">
                <div class="row"> 
                    <% 
                    List<Platos> listPla = plaDao.obtenerProducto();
                    Iterator<Platos> iter = listPla.iterator();
                    Platos pla=null;
                    while(iter.hasNext()){
                        pla=iter.next();
                    %>
                    <div class="col-sm-4">
                        <div class="card " >
                            <div class="card-header text-center">
                                <h6><%= pla.getNombre() %></h6>
                            </div>
                            <div class="card-body text-center">
                                <i>S/. <%= pla.getPrecio() %></i><br><br>
                                <img class="imgcar" src="RgtrPlatos?id=<%= pla.getId() %>" width="200" height="180">
                            </div>
                            <div class="card-footer text-center">
                                <label><%= pla.getDescripcion() %></label>
                                <div>
                                    <a href="ControladorCarrito?accion=AgregarCarrito&id=<%= pla.getId() %>" class="btn btn-outline-info">Agregar Carrito</a>
                                    <a href="ControladorCarrito?accion=Comprar&id=<%= pla.getId() %>" class="btn btn-danger">Comprar</a>
                                </div>
                            </div>         
                        </div><br> 
                    </div>
                    <% 
                        }
                    %>
                    
                </div>               
            </div>
        </div>    
            
        <footer class="footer">
            <div class="container-f">
                <div class="footer-row">
                    <div class="footer-links">
                        <h4>Restaurant</h4>
                        <ul>
                            <li><a href="Nosotros.jsp">Nosotros</a></li>
                            <li><a href="NuestraTienda.jsp">Nuestra tienda</a></li>
                        </ul>
                    </div>
                    <div class="footer-links">
                        <h4>Ayuda</h4>
                        <ul>
                            <li><a href="MediosPago.jsp">Medios de pagos</a></li>
                            <li><a href="PreguntasFrecuentes.jsp">Preguntas frecuentes</a></li>
                        </ul>
                    </div>
                    <div class="footer-links">
                        <h4>Servicios</h4>
                        <ul>
                            <li><a href="Proveedores.jsp">Proveedores</a></li>
                            <li><a href="Delivery.jsp">Delivery</a></li>
                            <li><a href="Reservas.jsp">Reservaciones</a></li>
                            
                        </ul>
                    </div>
                    <div class="footer-links">
                        <h4>Síguenos</h4>
                        <div class="social-link">
                            <a href="https://acortar.link/dxoBc1"><i class="fab fa-facebook-f"></i></a>
                        </div>
                    </div>
                </div>
            </div>
        </footer> 
           
        
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
        <script src="js/buscador.js" type="text/javascript"></script>
    </body>
</html>
