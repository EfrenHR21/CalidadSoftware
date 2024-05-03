<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <link rel="icon" type="image/png" href="Imagenes/IProductos/Inicio/LOGO.jpg">
        <title>Restaurante Pihuicho</title>
        <link href="CSS/whatsapp.css" rel="stylesheet" type="text/css"/>
        <link href="CSS/Catalogo/EstiloLateralB.css" rel="stylesheet" type="text/css"/>
        <link href="CSS-Header/EstiloHeadeR.css" rel="stylesheet">
        <link href="CSS-Footer/EstiloFooterPag.css" rel="stylesheet">
        <link href="CSS/EstiloTiendaNuestra.css" rel="stylesheet">
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
                    <a href="index.jsp">Tienda</a>
                    <a href="RClientes.jsp">Registrarse</a>
                    <a href="InicioS.jsp">Iniciar Sesión</a>
                </nav>
             </div>
        </header> 
        
        <main>
            <div class="fondoMain">
            <div><h1 class="textoP">Nuestra ubicación actual</h1></div>
            <div><h4 class="textoS">Pje. José Gálvez 281 25000 Pucalpa, Peru</h4></div>
            <div class="link_mapa">
                <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d493.42469277925585!2d-74.57052429576463!3d-8.36249616956683!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x91a3bd480f27950f%3A0x7cdd0c4b694a014d!2sRestaurant%20Pihuichos%20PERU!5e0!3m2!1ses!2spe!4v1682043174443!5m2!1ses!2spe" width="100%" height="350" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
            </div>
            <div><h1 class="textoP">¡Proximamente en más sitios!</h1></div>
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