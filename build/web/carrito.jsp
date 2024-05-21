<%@page import="java.text.DecimalFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>
<%@page import="config.ConexionBD" %>
<%@page import="Controlador.*" %>
<%@page import="Modelo.*" %>
<%@page import="DAO.*" %>

<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    Cliente cli = (Cliente) session.getAttribute("loginCliente");
    if (cli == null || cli.getID_cli() == null || cli.getNom_cli() == null || cli.getApe_cli() == null) {
        response.sendRedirect("InicioS.jsp");
    }
%>
<html>
    <head>        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <link rel="icon" type="image/png" href="Imagenes/IProductos/Inicio/LOGO.jpg">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css">
        <title>Restaurant Pihuicho</title>

        <link href="CSS/Catalogo/EstiloLateralB.css" rel="stylesheet" type="text/css"/>
        <link href="CSS/Catalogo/EstiloBFilas.css" rel="stylesheet" type="text/css"/>
        <link href="CSS-Main-Principal/EstiloMPrincipal.css" rel="stylesheet">
        <link href="CSS-Main-Principal/EstiloMVendido.css" rel="stylesheet">
        <link href="CSS/whatsapp.css" rel="stylesheet" type="text/css"/>
        <link href="CSS-Footer/EstiloFooterPag.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css" >
        <link href="CSS-Header/EstiloHeade.css" rel="stylesheet">

        <style>
            .disabled-link {
                pointer-events: none;
                cursor: default;
                opacity: 0.6;
            }

        </style>
    </head>
    <body>

        <a href= "https://api.whatsapp.com/send?phone=958407045&text=¿Tiene alguna duda? ¡Escribenos!"
           target="_blank" class="whatsapp-btn"><i class="bi bi-whatsapp"></i>
            <div class="joinchat__tooltip"><i class="bi bi-person-circle"></i>
                <div class="text">Podemos ayudarte</div>
            </div>
        </a>

        <header>
            <div class="logo">
                <a href="index.jsp"><img src="Imagenes/IconoLogoGif.gif" alt=""/></a>
            </div>
            <div class="info-header2">
                <nav>
                    <a href="MCarrito.jsp"><i class="fa-solid fa-arrows-rotate fa-spin"></i>&nbsp;Seguir comprando</a>
                    <a href="Intranet_cliente.jsp"><i class="fa-solid fa-hand-sparkles fa-bounce"></i>&nbsp;Bienvenid@ ${loginCliente.getNom_cli()}</a>
                </nav>
                <form action="Sesion" method="POST">
                    <button name="cerrar" class="button type1" class="icon-a"><i class="fa-solid fa-right-from-bracket icons"></i>&nbsp;Cerrar Sesión</button>
                </form>
            </div>
        </header>

        <%
            DecimalFormat df = new DecimalFormat("#.00");
            double totalPagar = (double) request.getAttribute("totalPagar");
        %>
        <main>
            <div style="background: #a8a8a8; padding: 1px 0px 25px 0px;">     
                <div class="container mt-4" style="background: #67da8d">
                    <h3>Carrito</h3>
                    <div class="row" style="justify-content: center">
                        <div class="col-sm-8" style="margin-bottom: 10px">
                            <%
                                List lis = (List) request.getAttribute("carrito");
                            %>
                            <div class="table-responsive">
                                <table class="table table-hover">
                                    <thead>
                                        <tr>
                                            <th>ITEM</th>
                                            <th>NOMBRES</th>
                                            <th>DESCRIPCION</th>
                                            <th>PRECIO</th>
                                            <th>CANTIDAD</th>
                                            <th>SUBTOTAL</th>
                                            <th>ACCION</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <%
                                            Iterator<Carrito> iter = lis.iterator();
                                            Carrito car = null;
                                            while (iter.hasNext()) {
                                                car = iter.next();
                                        %>   
                                        <tr>
                                            <td><%= car.getItem()%></td>
                                            <td><%= car.getNombres()%></td>
                                            <td><%= car.getDescripcion()%><br>
                                                <img src="RgtrPlatos?id=<%=car.getIdProducto()%>" width="100" height="100">
                                            </td>
                                            <td><%= car.getPrecioCompra()%></td>
                                            <td>
                                                <input type="hidden" id="idpro" value="<%= car.getIdProducto()%>">
                                                <input type="number" id="Cantidad" value="<%= car.getCantidad()%>" class="form-control text-center" min="1">
                                            </td>
                                            <td><%= df.format(car.getSubTotal())%></td>
                                            <td class="text-center">
                                                <input type="hidden" id="idp" value="<%= car.getIdProducto()%>">
                                                <a href="#" id="btnDelete"><i class="fa-solid fa-trash-can"></i></a>
                                            </td>
                                        </tr>
                                        <% }%>
                                    </tbody>
                                </table>
                            </div>    
                        </div>


                        <div class="col-sm-4" style="display: flex; align-items: center; justify-content: center; padding-bottom: 15px;">
                            <div class="card" style="width: 100%">
                                <form id="compraForm" action="ControladorCarrito?accion=GenerarCompra&id=<%= cli.getID_cli()%>" method="post" enctype="multipart/form-data">
                                    <div class="card-header">
                                        <h3>Generar Compra</h3>
                                    </div>
                                    <div class="card-body">
                                        <label>Subtotal:</label>
                                        <input type="text" value="S/. <%= df.format(totalPagar)%>" readonly="" class="form-control">
                                        <label>Descuento:</label>
                                        <input type="text" value="S/. 0.00" readonly="" class="form-control">
                                        <label>Total Pagar:</label>
                                        <input type="text" value="S/. <%= df.format(totalPagar)%>" readonly="" class="form-control">
                                        <label>Metodo de pago:</label>
                                        <input type="text" id="paymentMethod" value="+51 963 852 741" readonly class="form-control-plaintext">
                                        <div class="form-group d-flex justify-content-between">
                                            <img src="Imagenes/info/yape.jpg" alt="Yape" class="img-fluid" style="max-width: 100px;">
                                            <img src="Imagenes/info/qr_yape.png" alt="QR Yape" class="img-fluid" style="max-width: 100px;">
                                        </div>
                                        <div class="form-group">
                                            <label for="fileUpload">Subir imagen de comprobante:</label>
                                            <input type="file" class="form-control-file" name="fileUpload" id="fileUpload">
                                        </div>
                                    </div>
                                    <div class="card-footer">
                                        <button type="submit" class="btn btn-danger btn-block disabled-link" id="generarCompraBtn" disabled>Generar Compra</button>
                                    </div>
                                </form>
                            </div>
                        </div>

                        <script>
                            document.getElementById('fileUpload').addEventListener('change', function () {
                                var generarCompraBtn = document.getElementById('generarCompraBtn');
                                if (this.files && this.files.length > 0) {
                                    generarCompraBtn.classList.remove('disabled-link');
                                    generarCompraBtn.disabled = false;
                                } else {
                                    generarCompraBtn.classList.add('disabled-link');
                                    generarCompraBtn.disabled = true;
                                }
                            });
                        </script>

                    </div>
                </div>

            </div>                
        </main>                 

        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>                
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>          
        <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
        <script src="js/funciones.js" type="text/javascript"></script>
    </body>
</html>
