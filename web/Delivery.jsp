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
            <jsp:include page="Header.jsp" flush="true" />
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
            <jsp:include page="Footer.jsp" flush="true" />
        </footer>
    </body>
</html>
