<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <link rel="icon" type="image/png" href="Imagenes/IProductos/Inicio/LOGO.jpg">
        <title>Restaurante Pihuicho</title>
        <link href="CSS/whatsapp.css" rel="stylesheet" type="text/css"/>
        <link href="CSS/Catalogo/EstiloLateralB.css" rel="stylesheet" type="text/css"/>
        <link href="CSS/Catalogo/EstiloBFilas.css" rel="stylesheet" type="text/css"/>
        <link href="CSS-Header/EstiloHeadeR.css" rel="stylesheet">
        
        <link href="CSS/EstiloProvInfo.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css" >
        
    </head>
    <body>
        <a href= "https://api.whatsapp.com/send?phone=958407045&text=¿Tiene alguna duda?¡Escribenos!"
           target="_blank" class="whatsapp-btn"><i class="bi bi-whatsapp"></i>
            <div class="joinchat__tooltip"><i class="bi bi-person-circle"></i>
                <div class="text">Podemos ayudarte</div>
            </div>
        </a>
        <header>
            <jsp:include page="Header.jsp" flush="true" />
        </header> 
        
        <main>
            <div class="Principal-Main">
                <h1 class="titleP">Nuestros proveedores</h1>
                <div class="container-proveedor">
                    <div class="card">
                        <img src="Imagenes/MercadoV2.jpg">
                        <h4>Mercado Yarinacocha</h4>
                        <p>Estamos asociados a un mercado ubicado cerca a nuestra localidad, lo que nos facilita hacer la compra y transporte de los alimentos perecibles.</p>
                    </div>
                    <div class="card">
                        <img src="Imagenes/TiendaLimpieza.jpg">
                        <h4>Tienda de Limpieza</h4>
                        <p>Estamos asociados con "Distribuidora Patita Pucallpa SAC", la cual nos suministra productos de limpieza.</p>
                    </div>
                    <div class="card">
                        <img src="Imagenes/TiendaUtensilios.jpg">
                        <h4>Tienda de utensilios de cocina</h4>
                        <p>Estamos asociados con "Tienda Qallwa", la que nos proporciona los utensilios suficientes para la preparación de los platos.</p>
                    </div>
                </div>
            </div>    
        </main>
        <footer class="footer">
            <jsp:include page="Footer.jsp" flush="true" />
        </footer>        
    </body>
</html>

