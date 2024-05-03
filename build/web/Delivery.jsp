<html>
    <head>
        <meta charset="UTF-8">
        <link rel="icon" type="image/png" href="Imagenes/IProductos/Inicio/LOGO.jpg">
        <title>Restaurante Pihuicho</title>
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <link href="CSS/whatsapp.css" rel="stylesheet" type="text/css"/>
        <link href="CSS/Catalogo/EstiloLateralB.css" rel="stylesheet" type="text/css"/>
        <link href="CSS/Catalogo/EstiloBFilas.css" rel="stylesheet" type="text/css"/>
        <link href="CSS-Header/EstiloHeadeR.css" rel="stylesheet">
        <link href="CSS-Footer/EstiloFooterPag.css" rel="stylesheet">
        <link href="CSS/EstiloDeliverys.css" rel="stylesheet">
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
                    <a href="MenuPrincipal.jsp">Tienda</a>
                    <a href="RClientes.jsp">Registro sesión</a>
                    <a href="InicioS.jsp">Iniciar Sesión</a>
                </nav>
             </div>
        </header> 
        
        <main>
            <div class="fondoMainD">
                <div class="card">
                    <div class="content-delivery">
                        <h2>Servicio de delivery</h2>
                        <p>Dedicado a servirte</p>
                        <a href="CCarta.jsp">¡Pide ya!</a>
                    </div>
                    <img src="Imagenes/IconDelivery.png">
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
