<%@page import="DAO.*" %>
<%@page import="Modelo.*" %>
<%@page import="Controlador.*" %>
<%@page import="java.util.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<% 
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    Cliente cli = (Cliente) session.getAttribute("loginCliente");
    if(cli==null || cli.getID_cli()==null || cli.getNom_cli()==null || cli.getApe_cli()==null){
        response.sendRedirect("InicioS.jsp");
    }
%>
<html>
    <head>
        <meta charset="UTF-8">
        <link rel="icon" type="image/png" href="Imagenes/IProductos/Inicio/LOGO.jpg">
        <title>Restaurante Pihuicho</title>    
        <link href="CSS/whatsapp.css" rel="stylesheet" type="text/css"/>
        <link href="cssCarro/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="CSS/StyleAdProduct.css" rel="stylesheet" type="text/css"/>
        <link href="CSS-Intranet/EstiloDash.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
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
        <%!
            CompraDAO compDao = new CompraDAO();
        %>
        <div id="mySidenav" class="sidenav">
            <p class="logo"><span>R</span>-Pihuicho</p>
            <a href="#" data-target="#Principal" class="icon-a"><i class="fa fa-dashboard icons"></i>&nbsp;&nbsp;Principal</a>
            <a href="#" data-target="#Compras" class="icon-a"><i class="fa-solid fa-truck-fast icons"></i>&nbsp;&nbsp;Mis pedidos</a>
            <a href="#" data-target="#DetallePedidos" class="icon-a"><i class="fa-solid fa-truck-ramp-box"></i>&nbsp;&nbsp;Detalle</a>
            <a href="#" data-target="#Clientes" class="icon-a"><i class="fa fa-user icons"></i>&nbsp;&nbsp;Mis datos</a>
            <form action="Sesion" method="POST">
                <button name="cerrar" class="button type1" class="icon-a"><i class="fa-solid fa-right-from-bracket icons"></i><span class="btn-txt">&nbsp;&nbsp;Cerrar Sesión</span></button>
            </form>
        </div>
        <header>   
        <div id="main">
            <div class="head">
                <div class="col-div-6">
                    <span style="font-size: 30px; cursor: pointer;color: white;" class="nav">
                    &#9776;</span>
                    <span style="font-size: 30px; cursor: pointer;color: white;" class="nav2">
                     &#9776;</span>
                </div>
                
                <div class="col-div-6">
                    <div class="profile">
                        <img src="Imagenes/User-Avatar.png" class="pro-img">    
                        <p>${loginCliente.getNom_cli()}<span>${loginCliente.getApe_cli()}</span></p>
                    </div>
                 </div>
                <div class="clearfix"></div>
            </div>
        </div>    
        </header>    
        <main>  
            <div data-content id="principal" class="active">    
            
            <div class="col-div-10">
                <div class="box-8">
                    <div class="content-box">
                        <p class="p1">¡Bienvenido a Restaurant Pihuichos!</p>
                        <a href="MCarrito.jsp" target="blank"><img src="Imagenes/info/loguito.gif" alt=""/></a>
                        <p class="p2">La mejor opción en platos turísticos y comida marina.</p>
                    </div>
                </div>
                </div><br>     
                <div class="clearfix"></div>  
            </div>
                        
            <div data-content id="COMPRAS">
                <div class="col-div-12">
                    <div class="box-8">
                        <div class="content-box">
                            <p>Mis pedidos</p>
                            <table class="table table-dark table-striped table-hover table_id" id="tblClientes">
                                <thead>
                                    <tr>
                                        <th class="colorCabecera">ID</th>
                                        <th class="colorCabecera">FECHA COMPRA</th>
                                        <th class="colorCabecera">MONTO</th>
                                        <th class="colorCabecera">ESTADO</th> 
                                        <th class="colorCabecera">PAGO</th>
                                    </tr>
                                </thead>  
                                <%   
                                if(cli!=null){    
                                String id=cli.getID_cli();    
                                List<Compra> listacompr = compDao.mostrarCompraCliente(id);
                                Iterator<Compra> iter = listacompr.iterator();
                                Compra comp=null;
                                while(iter.hasNext()){
                                    comp=iter.next();
                                %>
                                <tr>
                                    <td > <%= comp.getId() %> </td>
                                    <td > <%= comp.getFecha() %> </td>
                                    <td > <%= comp.getMonto() %> </td>
                                    <td > <%= comp.getEstado() %> </td>
                                    <td ><img <%= comp.getImagen() %>" height="50px" width="80px"> </td>
                                </tr>
                                <% 
                                    } }
                                %>
                            </table>
                        </div>
                    </div>
                </div>            
                <div class="clearfix"></div>
                <br> 
            </div>
            
            <div data-content id="DetallePedidos">                                
                <div class="col-div-12">
                <div class="box-8">
                    <div class="content-box">
                        <p>Detalle de Pedido</p>
                        <div class="table-responsive"">
                        <table class="table table-dark table-striped table-hover table_id" id="tblClientes">
                                <thead>
                                    <tr>
                                        <th class="colorCabecera">ID COMPRA</th>
                                        <th class="colorCabecera">ID PLATO</th>
                                        <th class="colorCabecera">NOMBRE</th>
                                        <th class="colorCabecera">CANTIDAD</th>
                                        <th class="colorCabecera">PRECIO</th> 
                                        <th class="colorCabecera">ESTADO</th> 
                                        <th class="colorCabecera">IMAGEN</th> 
                                    </tr>
                                </thead>  
                                <% 
                                if(cli!=null){    
                                String id2=cli.getID_cli();    
                                List<Detalle_CompraA> listdt = compDao.mostrarDetalleCliente(id2);
                                Iterator<Detalle_CompraA> iter7 = listdt.iterator(); 
                                Detalle_CompraA dtcmp=null;
                                while(iter7.hasNext()){
                                    dtcmp=iter7.next();
                                %>
                                <tr>
                                    <td><%= dtcmp.getIdCompras() %></td>
                                    <td><%= dtcmp.getIdPlato() %></td>
                                    <td><%= dtcmp.getNombrePlato() %></td>
                                    <td><%= dtcmp.getCantidad() %></td>
                                    <td><%= dtcmp.getPrecioCompra() %></td>
                                    <td><%= dtcmp.getEstado() %></td>
                                    <td ><img src="RgtrPlatos?id=<%= dtcmp.getIdPlato()%>" height="50px" width="80px"> </td>
                                </tr>
                                <% 
                                    } }
                                %>
                                
                            </table>
                        </div>
                     </div>
                </div>
                </div>          
                <div class="clearfix"></div>
                <br>
                <% 
                    if(request.getAttribute("message2")!=null){
                %>
                <script>alert('<%= request.getAttribute("message2") %>') </script>
                <% 
                    }else{}
                %>
            </div>                
            
            <div data-content id="clientes">
                <div class="col-div-10">
                    <div class="box-8">
                        <div class="content-box">
                            <p class="p1"> Mis datos de usuario </p>
                                <div class="contenedor-datoscliente">
                                    <p class="p3">Nombre: <p class="p4"> ${loginCliente.getNom_cli()} </p><br>
                                    <p class="p3"> Apellido: <p class="p4"> ${loginCliente.getApe_cli()} </p><br>
                                    <p class="p3"> Edad: <p class="p4"> ${loginCliente.getEdad()} </p><br>
                                    <p class="p3"> Correo: <p class="p4"> ${loginCliente.getCorreo()} </p><br>
                                    <p class="p3"> Contraseña: <p class="p4"> ${loginCliente.getContra()} </p><br>
                                    <p class="p3"> Celular: <p class="p4"> ${loginCliente.getCell_cli()}  </p><br>
                                    <p class="p3"> Distrito: <p class="p4"> ${loginCliente.getNom_dist()}  </p><br>
                                </div>                         
                        </div>
                    </div>
                </div><br>
            </div>
            
        </main>
        <script src="js/RegAdPlato.js" type="text/javascript"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
        <script type="text/javascript">
            $("main").css('margin-left','300px');
            $("main").css('transition','0.5s');
            $(".nav").click(function(){
               $("#mySidenav").css('width','70px');
               $("#main").css('margin-left','70px');
               $(".logo").css('visibility','hidden');
               $(".logo span").css('visibility','visible');
               $(".logo span").css('margin-left','-10px');
               $(".icon-a").css('visibility','hidden');
               $(".icons").css('visibility','visible');
               $(".icons").css('margin-left','-8px');
               $(".nav").css('display','none');
               $(".nav2").css('display','block');
               $("main").css('margin-left','70px');
               
            });
            $(".nav2").click(function(){
               $("#mySidenav").css('width','300px');
               $("#main").css('margin-left','300px');
               $(".logo").css('visibility','visible');
               $(".logo span").css('visibility','visible');
               $(".icon-a").css('visibility','visible');
               $(".icons").css('visibility','visible');
               $(".nav").css('display','block');
               $(".nav2").css('display','none');
               $("main").css('margin-left','300px');
            });
        </script>
        
        <script defer> 
            const targets = document.querySelectorAll('[data-target]')
            const content = document.querySelectorAll('[data-content]')
            targets.forEach(target => {
                target.addEventListener('click', () => {
                        content.forEach(c => {
                        c.classList.remove('active')
                    })
                    const t = document.querySelector(target.dataset.target)
                    t.classList.add('active')
                })
            })
        </script>
        
    </body>
</html>