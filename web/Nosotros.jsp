<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <link rel="icon" type="image/png" href="Imagenes/IProductos/Inicio/LOGO.jpg">
        <title>Restaurante Pihuicho</title>
        <link href="CSS/whatsapp.css" rel="stylesheet" type="text/css"/>
        <link href="CSS/Catalogo/EstiloBFilas.css" rel="stylesheet" type="text/css"/>
        <link href="CSS-Footer/EstiloFooterPag.css" rel="stylesheet" type="text/css"/>
        <link href="CSS/Catalogo/EstiloCardc.css" rel="stylesheet" type="text/css"/>
        <link href="CSS/Catalogo/EstiloLateralB.css" rel="stylesheet" type="text/css"/>
        <link href="CSS-Header/EstiloHeadeR.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css" >
        <script src="https://kit.fontawesome.com/a076d05399.js"></script>  
    </head>
    <body>
        <a href= "https://api.whatsapp.com/send?phone=958407045&text=�Tiene alguna duda? �Escribenos!"
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
                    <a href="InicioS.jsp">Iniciar Sesi�n</a>
                </nav>
             </div>
        </header>
        <main>
        <div class="fondoMain">    
            <div class="container">
                <div class="card">
                    <figure>
                        <img src="Imagenes/mision.jpg" alt=""/>
                    </figure>
                    <div class="contenido">
                        <h3>MISION</h3>
                        <p>Nos dedicamos a satisfacer las necesidades gastron�micas de nuestros clientes,
                            preparando y ofreciendo alimentos y servicios de la calidad m�s alta y una atenci�n
                            personalizada que asegure su satisfacci�n</p><br>
                    </div>
                </div>
                <div class="card">
                    <figure>
                        <img src="Imagenes/vision.jpg" alt=""/>
                    </figure>
                    <div class="contenido">
                        <h3>VISION</h3>
                        <p>Deseamos ser uno de los restaurantes m�s conocidos a nivel local e internacional, ademas queremos contribuir a una comunidad 
                            m�s reconocida por nuestros diversos platos</p>
                    </div>
                </div>
                <div class="card">
                    <figure>
                        <img src="Imagenes/local.jpg" alt=""/>
                    </figure>
                    <div class="contenido">
                        <h3>LOCAL</h3>
                        <p>Estamos en el Pje. Jos� G�lvez 281 25000 <br> Pucalpa, Peru</p><br>
                        <a href="https://www.google.com/maps/@-8.3623569,-74.5704541,3a,60y,138.4h,91.96t/data=!3m6!1e1!3m4!1s5iAu0afHs2eJcM-03qqmQQ!2e0!7i13312!8i6656" target="blanck">
                            Encuentranos!</a>
                    </div>
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
                        <h4>S�guenos</h4>
                        <div class="social-link">
                            <a href="https://acortar.link/dxoBc1"><i class="fab fa-facebook-f"></i></a>
                        </div>
                    </div>
                </div>
            </div>
        </footer>
    </body>
</html>