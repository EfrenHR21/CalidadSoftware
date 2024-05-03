<html>
    <head>
        <meta charset="UTF-8">
        <link rel="icon" type="image/png" href="Imagenes/IProductos/Inicio/LOGO.jpg">
        <title>Restaurante Pihuicho</title>
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <link href="CSS/whatsapp.css" rel="stylesheet" type="text/css"/>
        <link href="CSS-Header/EstiloBotonSearch.css" rel="stylesheet" type="text/css"/>
        <link href="CSS/Catalogo/EstiloRegistr.css" rel="stylesheet" type="text/css"/>
        <link href="CSS/Catalogo/EstiloLateralB.css" rel="stylesheet" type="text/css"/>
        <link href="CSS-Header/EstiloHeadeR.css" rel="stylesheet" type="text/css"/>
        <script src="https://kit.fontawesome.com/a076d05399.js"></script>  
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css">
        <link href="CSS-Footer/EstiloFooterPag.css" rel="stylesheet" type="text/css"/>
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
                <a href="MPrincipal.jsp"><img src="Imagenes/IconoLogoGif.gif" alt=""/></a>
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

    <main class="formregister">    
        <!--    <font size="5" face="Arial Black" >RESERVACIONES</font><br><br>
            <form name="formm" > 
                <input class="controls"  type="text" placeholder="Ingrese su Nombre">
                <input class="controls" type="text"  placeholder="Ingrese su Apellido">
                <input class="controls" type="email"  placeholder="Ingrese su Numero">
                <input class="controls" type="text"  placeholder="Numero de Personas">
                <input class="controls" type="text"  placeholder="Hora de Reserva">
                <form  class="date" action="" method="" > 
                <input class="controls" type="date">  
                <input class="controls" type="button" name="botonRegistrar" value="Reservar">

            <p><a href="InicioC.php">¿Ya tengo Cuenta?</a></p>
            </form> -->
        <h1>MUY PRONTO!</h1>
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
