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
        <meta charset="UTF-8">
        <link rel="icon" type="image/png" href="Imagenes/IProductos/Inicio/LOGO.jpg">
        <title>Restaurante Pihuicho</title>
        <link href="CSS/whatsapp.css" rel="stylesheet" type="text/css"/><link href="CSS/Catalogo/EstiloBFilas.css" rel="stylesheet" type="text/css"/>
        <link href="CSS-Main-Principal/EstiloMPrincipal.css" rel="stylesheet">
        <link href="CSS-Main-Principal/EstiloMVendido.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css" >
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <link href="CSS/Testimonio.css" rel="stylesheet" type="text/css"/>
        <link href="CSS-Header/EstiloHeade.css" rel="stylesheet">
        <link  rel="stylesheet"
     href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css"/>
        
        
    </head>
    <body>
        <a href= "https://api.whatsapp.com/send?phone=958407045&text=¿Tiene alguna duda? ¡Escribenos!"
           target="_blank" class="whatsapp-btn"><i class="bi bi-whatsapp"></i>
            <div class="joinchat__tooltip"><i class="bi bi-person-circle"></i>
                <div class="text">Podemos ayudarte</div>
            </div>
        </a>
        <%
            ContadorDAO conDao = new ContadorDAO();
            Integer hit = conDao.getVisita();
            if (hit == null || hit == 0) {
                hit = 1;
            } else {
                hit += 1;
            }
            application.setAttribute("hitCounter", hit);
            conDao.insertarVisita(hit);
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

        <div class="Principal-Main">
            <div class="banner">
                <div class="capa"></div>
                <div class="Info">
                    <h1>Bienvenidos a Restaurant Pihuichos</h1>
                    <p>La mejor opción en platos turísticos y comida marina.</p>
                    <a href="MCarrito.jsp"> Ver nuestros platos</a>
                </div>
            </div>

            <h1 class="title">Nuestros platos más vendidos</h1>
            <div class="container-platos">
                <div class="card">
                    <img src="Imagenes/Fideos.jpg">
                    <h4>Fetuccini con lomo saltado</h4>
                    <p>Deliciosos fettuccinis a la huancaina acompañados con un jugoso lomo saltado</p>
                    <a href="MCarrito.jsp">Ver más</a>
                </div>
                <div class="card">
                    <img src="Imagenes/RondaMarina.jpg">
                    <h4>Ronda marina</h4>
                    <p>Deléitate con nuestro plato estrella. Este delicioso plato es para compartirlo en familia</p>
                    <a href="MCarrito.jsp">Ver más</a>
                </div>
                <div class="card">
                    <img src="Imagenes/Chifa.jpg">
                    <h4>Arroz chaufa de mariscos</h4>
                    <p>Platillo muy popular y delicioso que combina el arroz chaufa y el arroz con mariscos.</p>
                    <a href="MCarrito.jsp">Ver más</a>
                </div>
            </div>
        </div> 

        <section class="testimonials">

            <div class="container">
                <div class="section-header">
                    <h2 class="title">Que dicen los clientes</h2>
                </div>
                <div class="testimonials-content">
                    <div class="swiper testimonials-slider js-testimonials-slider">
                        <div class="swiper-wrapper">
                            <div class="swiper-slide testimonials-item">
                                <div class="info">
                                    <img src="Imagenes/User-Avatar.png" alt=""/>
                                    <div class="text-box">
                                        <h3 class="name">Diego Alberto Alvis Alves</h3>
                                        <span class="job">2024-06-06 12:17:00</span>
                                    </div>
                                </div>
                                <p>Una buena experiencia, buen sabor, buena atencion, volvere pronto!</p>
                                <div class="rating">
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                </div>
                            </div>

                            <div class=" swiper-slide testimonials-item">
                                <div class="info">
                                    <img src="Imagenes/User-Avatar.png" alt=""/>
                                    <div class="text-box">
                                        <h3 class="name">Carlos Diego Martinez Gonzales </h3>
                                        <span class="job">2024-06-06 12:18:36</span>
                                    </div>
                                </div>
                                <p>Todo muy rico, la musica muy buena, sobre todo el plato de arroz 
                                    chaufa charapa.</p>
                                <div class="rating">
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                </div>
                            </div>

                            <div class="swiper-slide testimonials-item">
                                <div class="info">
                                    <img src="Imagenes/User-Avatar.png" alt=""/>
                                    <div class="text-box">
                                        <h3 class="name">Gerald Gil </h3>
                                        <span class="job">2024-06-06 12:20:42</span>
                                    </div>
                                </div>
                                <p>Un amigo me recomendo este lugar y realmente no decepciono,
                                    todo muy rico, las bebidas de la zona muy buenas</p>
                                <div class="rating">
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                </div>
                            </div>

                            <div class="swiper-slide testimonials-item">
                                <div class="info">
                                    <img src="Imagenes/User-Avatar.png" alt=""/>
                                    <div class="text-box">
                                        <h3 class="name">Susana Soria </h3>
                                        <span class="job">2024-06-06 12:21:57</span>
                                    </div>
                                </div>
                                <p>No soy de la zona, pero me gusto probar sus platos 
                                    tipicos, gans de volver a ir!</p>
                                <div class="rating">
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="swiper-pagination js-testimonials-pagination"></div>
                </div>
            </div>
        </section>
            <!-- script slide comentarios -->
            <script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>   
            <script>
                    const swiper = new Swiper('.js-testimonials-slider', {
                        grabCursor:true,
                        spaceBetween:30,
                        pagination:{
                            el: '.js-testimonials-pagination',
                            clickable: true
                        },
                        breakpoints:{
                            767:{
                                slidesPerView: 2
                            }
                        }
                    });
            </script>      
            
        <footer class="footer">
            <jsp:include page="Footer.jsp" flush="true" />
        </footer> 
    </body>
</html>
