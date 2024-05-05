<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <link rel="icon" type="image/png" href="Imagenes/IProductos/Inicio/LOGO.jpg">
        <title>Restaurante Pihuicho</title>
        <link href="CSS/whatsapp.css" rel="stylesheet" type="text/css"/>
        <link href="CSS/Catalogo/EstiloLateralB.css" rel="stylesheet" type="text/css"/>
        <link href="CSS/Catalogo/EstiloBFilas.css" rel="stylesheet" type="text/css"/>
        <link href="CSS-Main-Principal/EstiloMPrincipal.css" rel="stylesheet">
        <link href="CSS-Main-Principal/EstiloMVendido.css" rel="stylesheet" type="text/css"/>
        <link href="CSS-Header/EstiloHeadeR.css" rel="stylesheet" type="text/css"/>
        <link href="CSS/EstiloPreguntas.css" rel="stylesheet" type="text/css"/>
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
            <div class="fondoMain">
            <div class="contenedor-acordeon">
                <h2>Preguntas frecuentes</h2>
                <div class="acordeon">
                    <input  type="radio" name="acordeon" id="btn-acordeon1" class="btn-acordeon">
                    <label for="btn-acordeon1">
                        ¿En qué horario se puede ir a comer o cenar en el restaurante?
                    </label>
                    <div class="contenido-acordeon">
                        <p><b>Servicio del restaurante Pihuichos</b></p>
                        <p><b>Mediodía:</b> todos los días de 12:00 p.m. a 16:00 p.m.</p>
                        <p><b>Noche:</b> de martes a sábado de 19:30 p.m. a 22:30 p.m.</p>
                    </div>
                </div>
                <div class="acordeon">
                    <input  type="radio" name="acordeon" id="btn-acordeon2" class="btn-acordeon">
                    <label for="btn-acordeon2">
                        ¿En que días y horarios puedo hacer pedidos para delivery?
                    </label>
                    <div class="contenido-acordeon">
                        <p>Los pedidos se reciben de todos los días de 12:00 p.m. a 15:30 p.m. y en las noches de 19:30 p.m. a 22:00 p.m. Las entregas se realizan cuando es pagado el pedido.</p>
                    </div>
                </div>
                <div class="acordeon">
                    <input  type="radio" name="acordeon" id="btn-acordeon3" class="btn-acordeon">
                    <label for="btn-acordeon3">
                        ¿Cúando entregan mi pedido por delivery?
                    </label>
                    <div class="contenido-acordeon">
                        <p>El tiempo mínimo de entrega es de 40 minutos a un máximo de 1 hora despues de haber recibido el pedido por delivery.</p>
                    </div>
                </div>
                <div class="acordeon">
                    <input  type="radio" name="acordeon" id="btn-acordeon4" class="btn-acordeon">
                    <label for="btn-acordeon4">
                        ¿Podemos venir sin alguna reservación?
                    </label>
                    <div class="contenido-acordeon">
                        <p>Si, el restaurante está disponible para ingresar ya sea con reservaciones o no.</p>
                    </div>
                </div>
                <div class="acordeon">
                    <input  type="radio" name="acordeon" id="btn-acordeon5" class="btn-acordeon">
                    <label for="btn-acordeon5">
                        ¿Admiten mascotas en el restaurante?
                    </label>
                    <div class="contenido-acordeon">
                        <p>No, por razones de higiene, nuestros amigos de cuatro patas no pueden entrar al restaurante.</p>
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

