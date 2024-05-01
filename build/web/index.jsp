<%@page import="DAO.*" %>
<%@page import="Modelo.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <meta charset="UTF-8">
        <link rel="icon" type="image/png" href="Imagenes/IProductos/Inicio/LOGO.jpg">
        <title>Restaurante Pihuicho</title>
        <link href="CSS/whatsapp.css" rel="stylesheet" type="text/css"/>
        <link href="CSS/Catalogo/EstiloLateralB.css" rel="stylesheet" type="text/css"/>
        <link href="CSS/Catalogo/EstiloBFilas.css" rel="stylesheet" type="text/css"/>
        <link href="CSS-Main-Principal/EstiloMPrincipal.css" rel="stylesheet">
        <link href="CSS-Main-Principal/EstiloMVendido.css" rel="stylesheet">
        <link href="CSS-Header/EstiloHeadeR.css" rel="stylesheet">
        <link href="CSS-Footer/EstiloFooterPag.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css" >
        <meta name="viewport" content="width=device-width, initial-scale=1" />
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
            if(hit == null || hit ==0){
                hit = 1;
            }else{ hit += 1; }
            application.setAttribute("hitCounter", hit);
            conDao.insertarVisita(hit);
        %>
        <header>
            <input type="checkbox" id="check"> 
            <div class="logo">
                <a href="index.jsp"><img src="Imagenes/IconoLogoGif.gif" alt=""/></a>
            </div>
            <label for="check">
                <i class="fas fa-bars" id="btn"></i>
                <i class="fas fa-times" id="cancel"></i>
            </label>
            <div class="sidebar">
                <h2>CATEGORIAS</h2>
                <ul>
                    <li><a href="CCarta.jsp"><i class="fas fa-qrcode"></i>Carta</a></li>
                    <li><a href="CBebidas.jsp"><i class="fas fa-qrcode"></i>Bebidas</a></li>
                    <li><a href="CPlatosT.jsp"><i class="fas fa-qrcode"></i>Platos Tipicos</a></li>
                </ul>
            </div>                     
            <div class="info-header">
                <nav>
                    <a href="index.jsp">Tienda</a>
                    <a href="RClientes.jsp">Registrarse</a>
                    <a href="InicioS.jsp">Iniciar Sesión</a>
                </nav>
             </div>
        </header> 
        
        <main>
            <div class="Principal-Main">
                <div class="banner">
                    <div class="capa"></div>
                    <div class="Info">
                        <h1>Bienvenidos a Restaurant Pihuichos</h1>
                        <p>La mejor opción en platos turísticos y comida marina.</p>
                        <a href="MCarrito.jsp">Ver nuestros platos</a>
                    </div>
                </div>
            
            <div class="Barra-main">
                <nav>
                    <ul class="menu-horizontal">
                        <li><a href="index.jsp">Inicio</a></li>
                        <li><a href="Nosotros.jsp">Nosotros</a></li>
                        <li><a href="MCarrito.jsp">Productos</a></li>
                        <li><a href="PreguntasFrecuentes.jsp">Preguntas</a></li>
                    </ul>
                </nav> 
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
        </main>
        
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
    </body>
</html>
