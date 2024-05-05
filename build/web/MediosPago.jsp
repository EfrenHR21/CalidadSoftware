<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <link rel="icon" type="image/png" href="Imagenes/IProductos/Inicio/LOGO.jpg">
        <title>Restaurante Pihuicho</title>
        <link href="CSS/whatsapp.css" rel="stylesheet" type="text/css"/>
        <link href="CSS/Catalogo/EstiloBFilas.css" rel="stylesheet" type="text/css"/>
        <link href="CSS/Catalogo/EstiloCardc.css" rel="stylesheet" type="text/css"/>
        <link href="CSS/Catalogo/EstiloLateralB.css" rel="stylesheet" type="text/css"/>
        <link href="CSS-Header/EstiloHeadeR.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css" >
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css">
        <script src="https://kit.fontawesome.com/a076d05399.js"></script>  
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
            <div class="fondoMain">  
                <div class="container">
                    <div class="card2">
                        <figure>
                            <img src="Imagenes/info/efec.jpg" alt=""/>
                        </figure>
                        <div class="contenido">
                            <h3>EFECTIVO</h3>
                        </div>
                    </div>
                    <div class="card2">
                        <figure>
                            <img src="Imagenes/info/plin.jpg" alt=""/>
                        </figure>
                        <div class="contenido">
                            <h3>PLIN</h3>
                        </div>
                    </div>
                    <div class="card2">
                        <figure>
                            <img src="Imagenes/info/yape.jpg" alt=""/>
                        </figure>
                        <div class="contenido">
                            <h3>YAPE</h3>
                        </div>
                    </div>
                </div>
            </div>    
      </main>      
      <footer class="footer">
            <jsp:include page="Footer.jsp" flush="true" />
        </footer>        
    </body>
</html>
