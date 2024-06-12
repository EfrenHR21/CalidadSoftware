<%@page import="Persistencia.*" %>
<%@page import="Negocio.*" %>
<%@page import="Presentacion.*" %>
<%@page import="java.util.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<% 
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    Trabajador tra = (Trabajador) session.getAttribute("loginTrabajador");
    if(tra==null || tra.getNom_trab()==null || tra.getNombre_cargo()==null){
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
        <link href="CSS-Intranet/EstiloBuscarRegi.css" rel="stylesheet" type="text/css"/>
        <link href="CSS/StyleAdProduct.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css" >
        <link href="CSS-Intranet/EstiloDash.css" rel="stylesheet" type="text/css"/>
        <meta name="viewport" content="width=device-width, initial-scale=1"/>
    </head>
    <body>
        <a href= "https://api.whatsapp.com/send?phone=958407045&text=¿Tiene alguna duda? ¡Escribenos!"
           target="_blank" class="whatsapp-btn"><i class="bi bi-whatsapp"></i>
            <div class="joinchat__tooltip"><i class="bi bi-person-circle"></i>
                <div class="text">Podemos ayudarte</div>
            </div>
        </a>
        <%!
            TrabajadorDAO traDao = new TrabajadorDAO();
            ProveedorDAO provDao = new ProveedorDAO();
            ArticuloDAO artDao = new ArticuloDAO();
            ClienteDAO cliDao = new ClienteDAO();
            PlatosDAO plaDao = new PlatosDAO();
            ContadorDAO conDao = new ContadorDAO();
            CompraDAO comDao = new CompraDAO();
        %>
        <div id="mySidenav" class="sidenav">
            <p class="logo"><span>R</span>-Pihuicho</p>
            <a href="#" data-target="#Principal" class="icon-a"><i class="fa fa-dashboard icons"></i>&nbsp;&nbsp;Principal</a>
            <a href="#" data-target="#Empleados" class="icon-a"><i class="fa fa-users icons"></i>&nbsp;&nbsp;Empleados</a>
            <a href="#" data-target="#Proveedores" class="icon-a"><i class="fa-solid fa-truck-fast icons"></i>&nbsp;&nbsp;Proveedores</a>
            <a href="#" data-target="#Articulos" class="icon-a"><i class="fa fa-tasks icons"></i>&nbsp;&nbsp;Articulos</a>
            <a href="#" data-target="#Clientes" class="icon-a"><i class="fa fa-user icons"></i>&nbsp;&nbsp;Clientes</a>
            <a href="#" data-target='#Rplatos'class="icon-a"><i class="fa fa-shopping-bag icons"></i>&nbsp;&nbsp;Registro Platos</a>
            <a href="#" data-target='#Rpedidos'class="icon-a"><i class="fa fa-shopping-bag icons"></i>&nbsp;&nbsp;Pedidos</a>
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
                         <p> ${loginTrabajador.nom_trab}<span> ${loginTrabajador.nombre_cargo}</span></p>
                    </div>
                 </div>
                <div class="clearfix"></div>
            </div>
        </div>    
        </header>    
        <main>  
            
         <div data-content id="principal" class="active">
             
            <div class="contenedor-col3"> 
                <div class="col-div-3">
                    <div class="box">
                        <% 
                            int rspta=traDao.ContarDatosEmp();
                        %>
                        <p><%= rspta %><br/><span>Empleados</span></p>
                        <i class="fa-solid fa-users fa-beat"></i>  
                    </div>
                </div>

                <div class="col-div-3">
                    <div class="box">
                        <% 
                            int rspta1=provDao.ContarDatosProv();
                        %>
                        <p><%= rspta1 %><br/><span>Proveedores</span></p>
                        <i class="fa-solid fa-truck-fast fa-flip"></i>
                    </div>
                </div>

                <div class="col-div-3">
                    <div class="box">
                        <% 
                            int rspta2=artDao.ContarDatosArt();
                        %>
                        <p><%= rspta2 %><br/><span>Articulos</span></p>
                        <i class="fa-solid fa-list-check fa-fade"></i>
                    </div>
                </div>
                
                <div class="col-div-3">
                    <div class="box">
                        <% 
                            int rspta3=plaDao.ContarDatosPla();
                        %>
                        <p><%= rspta3 %><br/><span>Platos</span></p>
                        <i class="fa-solid fa-bag-shopping fa-shake"></i>
                    </div>
                </div>
                <br> <br> <p>  </p>
                <div class="col-div-3">
                    <div class="box">
                        <% 
                            int rspta4=cliDao.ContarDatosCli();
                        %>
                        <p><%= rspta4 %><br/><span>Clientes</span></p>
                        <i class="fa fa-solid fa-user fa-beat"></i>
                    </div>
                </div>
                
                <% 
                   Integer count = (Integer) application.getAttribute("hitCounter");
                %>        
                <div class="col-div-3">
                    <div class="box">
                        <p><%= count %><br/><span>Visitas</span></p>
                        <i class="fa fa-solid fa-eye fa-bounce"></i>
                    </div>
                </div>        
            </div>    
                <div class="clearfix"></div>
                <br/><br/>
                
                <div class="Circlegraphic">
                    <div id="piechart" style="width: 900px; height: 500px;"></div>
                    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
                    <script type="text/javascript">
                      google.charts.load('current', {'packages':['corechart']});
                      google.charts.setOnLoadCallback(drawChart);

                      function drawChart() {
                        
                        
                        var data = google.visualization.arrayToDataTable([
                          ['Task', 'Hours per Day'],
                        <% 
                        List<Trabajador> listaTraC = traDao.contarDatosCargo();
                        Iterator<Trabajador> iterC = listaTraC.iterator();
                        Trabajador trabC=null;
                        while(iterC.hasNext()){
                            trabC=iterC.next();
                        %>                                
                          ['<%=trabC.getNombre_cargo()%>', <%=trabC.getContarCargo()%>],
                        <% 
                            }
                        %>
                          
                        ]);

                        var options ={
                            "title":"Categoria de Empleados",
                            "backgroundColor":{"fill":"#758d7c"},
                            "titleTextStyle": {
                                    color: '#25396f',
                                    fontSize: 20,
                                    bold: true
                                    },
                            "is3D":true,
                            "pieHole":0.01964436917866215,
                            "fontSize":15,
                            "pieSliceTextStyle":{"color":"#ffffff"},
                            "sliceVisibilityThreshold":false,
                            "legend":{"position":"bottom","textStyle":{"color":"#000000","fontSize":15}},
                            "tooltip":{"textStyle":{"color":"#000000"},
                            "showColorCode":false},
                            "colors":["#3366CC","#DC3912","#FF9900","#109618","#990099"]};
                            

                        var chart = new google.visualization.PieChart(document.getElementById('piechart'));

                        chart.draw(data, options);
                      }
                    </script>
                </div>
                
                <div class='Barra2graphic'>
                    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
                    <script type="text/javascript">
                      google.charts.load("current", {packages:['corechart']});
                      google.charts.setOnLoadCallback(drawChart);
                      function drawChart() {
                        var data = google.visualization.arrayToDataTable([
                          ['Proveedor', 'Costo Total S/.', 'Veces Comprado'],
                          <% 
                            List<Articulo> listaArtC= artDao.contarCompra();
                            Iterator<Articulo> iterAc = listaArtC.iterator();
                            Articulo artC=null;
                            while(iterAc.hasNext()){
                                artC=iterAc.next();
                            %>                                
                              ['<%= artC.getProveedor()%>', <%= artC.getSumaCosto()%>, <%= artC.getVecesCompra()%>],
                           <% 
                                }
                           %>
                        ]);

                        var view = new google.visualization.DataView(data);
                        view.setColumns([0, 1,
                                         { calc: "stringify",
                                           sourceColumn: 1,
                                           type: "string",
                                           role: "annotation" },
                                         2,
                                         { calc: "stringify",
                                           sourceColumn: 2,
                                           type: "string",
                                           role: "annotation" }
                                        ]);

                        var options = {
                          title: "Articulos Comprados",
                          width: 900,
                          height: 400,
                          bar: {groupWidth: "80%"},
                          legend: { position: "none" },
                          "backgroundColor":{"fill":"#758d7c"},
                          "fontSize":15,
                          "colors":["#3366CC","#DC3912"],
                          "titleTextStyle": {
                                    color: '#25396f',
                                    fontSize: 20,
                                    bold: true
                                    }
                        };
                        var chart = new google.visualization.ColumnChart(document.getElementById("columnchart_values2"));
                        chart.draw(view, options);
                    }
                    </script>
                  <div id="columnchart_values2"></div>
                </div> 
                        
                <div class='BarraL2graphic'>
                    <script type="text/javascript">
                        google.charts.load("current", {packages:["corechart"]});
                        google.charts.setOnLoadCallback(drawChart);
                        function drawChart() {
                          var data = google.visualization.arrayToDataTable([
                            ["Categoria Producto", "Cantidad", { role: "style" } ],
                            <% 
                            List<Articulo> listaAcc= artDao.contarCategoria();
                            Iterator<Articulo> iterEc = listaAcc.iterator();
                            Articulo artCc=null;
                            while(iterEc.hasNext()){
                                artCc=iterEc.next();
                            %>                                
                              ['<%= artCc.getCproducto()%>', <%= artCc.getContarCateg()%>, '<%= artCc.getColor()%>'],
                            <% 
                                }
                            %>
                          ]);

                          var view = new google.visualization.DataView(data);
                          view.setColumns([0, 1,
                                           { calc: "stringify",
                                             sourceColumn: 1,
                                             type: "string",
                                             role: "annotation" },
                                           2]);

                          var options = {
                            title: "Categoria Articulos",
                            width: 900,
                            height: 400,
                            bar: {groupWidth: "95%"},
                            legend: { position: "none" },
                            "backgroundColor":{"fill":"#758d7c"},
                            "fontSize":15,
                            "titleTextStyle": {
                                    color: '#25396f',
                                    fontSize: 20,
                                    bold: true
                                    }
                          };
                          var chart = new google.visualization.BarChart(document.getElementById("barchart_values2"));
                          chart.draw(view, options);
                      }
                      </script>
                    <div id="barchart_values2"></div>        
                </div>        
                        
                <div class="Barragraphic">
                    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
                    <script type="text/javascript">
                      google.charts.load("current", {packages:['corechart']});
                      google.charts.setOnLoadCallback(drawChart);
                      function drawChart() {
                        var data = google.visualization.arrayToDataTable([
                          ["Distrito", "Cantidad", { role: "style" } ],
                          <% 
                            List<Cliente> listaCliC= cliDao.contarDatosDistrito();
                            Iterator<Cliente> iterDistr = listaCliC.iterator();
                            Cliente clidistr=null;
                            while(iterDistr.hasNext()){
                                clidistr=iterDistr.next();
                            %>                                
                              ['<%= clidistr.getNom_dist()%>', <%= clidistr.getContarDistrito()%>, '<%= clidistr.getColor_dist()%>'],
                           <% 
                                }
                           %>
                        ]);

                        var view = new google.visualization.DataView(data);
                        view.setColumns([0, 1,
                                         { calc: "stringify",
                                           sourceColumn: 1,
                                           type: "string",
                                           role: "annotation" },
                                         2]);

                        var options = {
                          title: "Cantidad de Clientes por Distrito",
                          width: 900,
                          height: 400,
                          bar: {groupWidth: "95%"},
                          legend: { position: "none" },
                          "backgroundColor":{"fill":"#758d7c"},
                          "fontSize":15,
                          "titleTextStyle": {
                                    color: '#25396f',
                                    fontSize: 20,
                                    bold: true
                                    }
                        };
                        var chart = new google.visualization.ColumnChart(document.getElementById("columnchart_values"));
                        chart.draw(view, options);
                    }
                    </script>
                    <div id="columnchart_values"></div>
                </div>
                
                <div class="BarraLgraphic">
                    <script type="text/javascript">
                        google.charts.load("current", {packages:["corechart"]});
                        google.charts.setOnLoadCallback(drawChart);
                        function drawChart() {
                          var data = google.visualization.arrayToDataTable([
                            ["Edad", "Cantidad", { role: "style" } ],
                            <% 
                            List<Cliente> listaCliE= cliDao.contarEdad();
                            Iterator<Cliente> iterEd = listaCliE.iterator();
                            Cliente clied=null;
                            while(iterEd.hasNext()){
                                clied=iterEd.next();
                            %>                                
                              [<%= clied.getEdad()%>, <%= clied.getContarEdad() %>, '<%= clied.getColor_dist()%>'],
                            <% 
                                }
                            %>
                          ]);

                          var view = new google.visualization.DataView(data);
                          view.setColumns([0, 1,
                                           { calc: "stringify",
                                             sourceColumn: 1,
                                             type: "string",
                                             role: "annotation" },
                                           2]);

                          var options = {
                            title: "Edad de Clientes",
                            width: 900,
                            height: 400,
                            bar: {groupWidth: "95%"},
                            legend: { position: "none" },
                            "backgroundColor":{"fill":"#758d7c"},
                            "fontSize":15,
                            "titleTextStyle": {
                                    color: '#25396f',
                                    fontSize: 20,
                                    bold: true
                                    }
                          };
                          var chart = new google.visualization.BarChart(document.getElementById("barchart_values"));
                          chart.draw(view, options);
                      }
                      </script>
                    <div id="barchart_values"></div>
                </div>        

                <div class="col-div-10">
                    <div class="box-8">
                        <div class="content-box">
                            <p>Últimos empleados registrados <span><a data-target="#Empleados">Ver todo</a></span></p><br>
                            <br/>
                            <div class="table-responsive">
                                <table class="table table-dark table-striped table-hover table_id">
                                    <tr>
                                        <th class="colorCabecera">ID</th>
                                        <th class="colorCabecera">NOMBRE</th>
                                        <th class="colorCabecera">APELLIDO</th>
                                        <th class="colorCabecera">CORREO</th> 
                                        <th class="colorCabecera">CONTRASEÑA</th> 
                                        <th class="colorCabecera">DNI</th> 
                                        <th class="colorCabecera">NUMERO</th> 
                                        <th class="colorCabecera">CARGO</th>
                                    </tr>
                                    <% 
                                    List<Trabajador> listaTra1 = traDao.mostrarUltimosDatosEmp();
                                    Iterator<Trabajador> iter1 = listaTra1.iterator();
                                    Trabajador trab1=null;
                                    while(iter1.hasNext()){
                                        trab1=iter1.next();
                                    %>
                                    <tr>
                                        <td > <%= trab1.getID_trab() %> </td>
                                        <td > <%= trab1.getNom_trab() %> </td>
                                        <td > <%= trab1.getApe_trab() %> </td>
                                        <td > <%= trab1.getCorreo() %> </td>
                                        <td > <%= trab1.getContra() %> </td>
                                        <td > <%= trab1.getDni_trab() %> </td>
                                        <td > <%= trab1.getNumero_trab() %> </td>
                                        <td > <%= trab1.getNombre_cargo() %> </td>
                                    </tr>
                                    <% 
                                        }
                                    %>
                                </table>
                            </div>
                        </div>
                    </div>
                </div><br>
                <div class="col-div-10">
                    <div class="box-8">
                        <div class="content-box">
                            <p>Últimos clientes registrados <span><a data-target="#Clientes">Ver todo</a></span></p><br>
                            <br/>
                            <div class="table-responsive">
                                <table class="table table-dark table-striped table-hover table_id">
                                    <thead>
                                        <tr>
                                            <th class="colorCabecera">ID</th>
                                            <th class="colorCabecera">NOMBRE</th>
                                            <th class="colorCabecera">APELLIDO</th>
                                            <th class="colorCabecera">CORREO</th> 
                                            <th class="colorCabecera">CONTRASEÑA</th> 
                                            <th class="colorCabecera">EDAD</th> 
                                            <th class="colorCabecera">NUMERO</th> 
                                            <th class="colorCabecera">DISTRITO</th> 
                                        </tr>
                                    </thead>
                                    <% 
                                    List<Cliente> listaCli2 = cliDao.mostrarUltimosDatosCli();
                                    Iterator<Cliente> iter5 = listaCli2.iterator();
                                    Cliente cli1=null;
                                    while(iter5.hasNext()){
                                        cli1=iter5.next();
                                    %>
                                    <tr>
                                        <td > <%= cli1.getID_cli() %> </td>
                                        <td > <%= cli1.getNom_cli() %> </td>
                                        <td > <%= cli1.getApe_cli() %> </td>
                                        <td > <%= cli1.getCorreo() %> </td>
                                        <td > <%= cli1.getContra() %> </td>
                                        <td > <%= cli1.getEdad() %> </td>
                                        <td > <%= cli1.getCell_cli() %> </td>
                                        <td > <%= cli1.getNom_dist() %> </td>
                                    </tr>    
                                    <% 
                                        }
                                    %>
                                </table>
                            </div>
                        </div>
                    </div>
                </div><br>                       
                <div class="clearfix"></div>
            </div>
                        
            <div data-content id="empleados">                
                <div class="contenedor-botones">
                    <form action="#" method="POST">
                        <div class="boton-box2">
                            <input  class="light-table-filter" data-table="table_id" placeholder="Buscando...">
                        </div>
                    </form>    
                    <div class="boton-box">
                        <a href="RTrabajador.jsp" target="blank">Registrar empleado</a>
                    </div>
                </div>
                
                <div class="col-div-12">
                <div class="box-8">
                    <div class="content-box">
                        <p>Empleados registrados</p>
                        <div class="table-responsive" style="overflow-x: scroll;">
                        <table class="table table-dark table-striped table-hover table_id" id="tblProductos">
                            <thead>
                                <tr>
                                    <th class="colorCabecera">ID</th>
                                    <th class="colorCabecera">NOMBRE</th>
                                    <th class="colorCabecera">APELLIDO</th>
                                    <th class="colorCabecera">CORREO</th> 
                                    <th class="colorCabecera">CONTRASEÑA</th> 
                                    <th class="colorCabecera">DNI</th> 
                                    <th class="colorCabecera">NUMERO</th> 
                                    <th class="colorCabecera">CARGO</th>
                                    <th class="colorCabecera"> </th>
                                </tr>
                            </thead>    
                            <tbody>
                                <% 
                                List<Trabajador> listaTra = traDao.mostrarDatosEmp();
                                Iterator<Trabajador> iter = listaTra.iterator();
                                Trabajador trab=null;
                                while(iter.hasNext()){
                                    trab=iter.next();
                                %>
                                <tr>
                                    <td > <%= trab.getID_trab() %> </td>
                                    <td > <%= trab.getNom_trab() %> </td>
                                    <td > <%= trab.getApe_trab() %> </td>
                                    <td > <%= trab.getCorreo() %> </td>
                                    <td > <%= trab.getContra() %> </td>
                                    <td > <%= trab.getDni_trab() %> </td>
                                    <td > <%= trab.getNumero_trab() %> </td>
                                    <td > <%= trab.getNombre_cargo() %> </td>
                                    <td> 
                                        <a href="ETrabajador.jsp?id=<%=trab.getID_trab()%>" class="btn btn-warning" target="blank">Editar</a>   
                                    </td>
                                    <td>
                                        <a href="DltEmpleado?id=<%=trab.getID_trab()%>" class="btn btn-danger">Eliminar</a>
                                    </td>
                                </tr>
                                <% 
                                    }
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
            
            <div data-content id="proveedores">                
                <div class="contenedor-botones">
                    <form action="#" method="POST">
                        <div class="boton-box2">
                            <input  class="light-table-filter" data-table="table_id" placeholder="Buscando...">
                        </div>
                    </form>    
                    <div class="boton-box">
                        <a href="RProveedor.jsp" target="blank">Registrar proveedor</a>
                    </div>
                </div>
                
                <div class="col-div-12">
                    <div class="box-8">
                        <div class="content-box">
                            <p>Proveedores registrados</p>
                            <div class="table-responsive">
                             <table class="table table-dark table-striped table-hover table_id" id="tblProveedores">
                                <thead>
                                    <tr>
                                        <th class="colorCabecera">ID</th>
                                        <th class="colorCabecera">NOMBRE</th>
                                        <th class="colorCabecera">CORREO</th>
                                        <th class="colorCabecera">RUC</th> 
                                        <th class="colorCabecera">NUMERO</th>
                                        <th class="colorCabecera">DIRECCION</th>
                                    </tr>
                                </thead>
                                <tbody>
                                <% 
                                List<Proveedor> listaProv = provDao.mostrarDatosProv();
                                Iterator<Proveedor> iter2 = listaProv.iterator();
                                Proveedor prov=null;
                                while(iter2.hasNext()){
                                    prov=iter2.next();
                                %>
                                <tr>
                                    <td > <%= prov.getIdProv() %> </td>
                                    <td > <%= prov.getNombreProv() %> </td>
                                    <td > <%= prov.getCorreo() %> </td>
                                    <td > <%= prov.getRUC() %> </td>
                                    <td > <%= prov.getTelefono() %> </td>
                                    <td > <%= prov.getDireccion() %> </td>
                                    <td> 
                                        <a href="EProveedor.jsp?id=<%=prov.getIdProv() %>" class="btn btn-warning" target="blank">Editar</a>   
                                    </td>
                                    <td>
                                        <a href="DltProveedor?id=<%=prov.getIdProv() %>" class="btn btn-danger">Eliminar</a>
                                    </td>
                                </tr>
                                <% 
                                    }
                                %>
                            </table>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="clearfix"></div>
                <br>
                <% 
                    if(request.getAttribute("message3")!=null){
                %>
                <script>alert('<%= request.getAttribute("message3") %>') </script>
                <% 
                    }else{}
                %>
            </div>
            
            <div data-content id="articulos">
                <div class="contenedor-botones">
                    <form action="#" method="POST">
                        <div class="boton-box2">
                            <input  class="light-table-filter" data-table="table_id" placeholder="Buscando...">
                        </div>
                    </form>   
                    <div class="boton-box">
                        <a href="RArticulos.jsp" target="blank">Registrar articulo</a>
                    </div>
                </div>
                <div class="col-div-12">
                    <div class="box-8">
                        <div class="content-box">
                            <p>Artículos registrados</p>
                            <div class="table-responsive">
                             <table class="table table-dark table-striped table-hover table_id" id="tblProveedores">
                                <thead>
                                    <tr>
                                        <th class="colorCabecera">ID</th>
                                        <th class="colorCabecera">NOMBRE</th>
                                        <th class="colorCabecera">CANTIDAD</th>
                                        <th class="colorCabecera">CATEGORIA DE P.</th>
                                        <th class="colorCabecera">ENCARGADO</th>
                                        <th class="colorCabecera">COSTO TOTAL (S/.)</th>
                                        <th class="colorCabecera">PROVEEDOR</th> 
                                    </tr>
                                </thead>
                                <tbody>
                                <% 
                                List<Articulo> listaArt = artDao.mostrarDatosArt();
                                Iterator<Articulo> iter3 = listaArt.iterator();
                                Articulo art=null;
                                while(iter3.hasNext()){
                                    art=iter3.next();
                                %>
                                <tr>
                                    <td > <%= art.getID_Articulo() %> </td>
                                    <td > <%= art.getNom_articulo() %> </td>
                                    <td > <%= art.getCantidad() %> </td>
                                    <td > <%= art.getCproducto() %> </td>
                                    <td > <%= art.getEncargado() %> </td>
                                    <td > <%= art.getPrecioA() %> </td>
                                    <td > <%= art.getProveedor() %> </td>
                                    <td> 
                                        <a href="EArticulos.jsp?id=<%=art.getID_Articulo() %>" class="btn btn-warning" target="blank">Editar</a>   
                                    </td>
                                    <td>
                                        <a href="DltArticulo?id=<%=art.getID_Articulo() %>" class="btn btn-danger">Eliminar</a>
                                    </td>
                                </tr>
                                <% 
                                    }
                                %>
                            </table>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="clearfix"></div>
                <br>
                <% 
                    if(request.getAttribute("message4")!=null){
                %>
                <script>alert('<%= request.getAttribute("message4") %>') </script>
                <% 
                    }else{}
                %>
            </div>
            
            <div data-content id="clientes">
                <div class="contenedor-botones">
                    <form action="#" method="POST">
                        <div class="boton-box2">
                            <input  class="light-table-filter" data-table="table_id" placeholder="Buscando...">
                        </div>
                    </form>   
                    <div class="boton-box">
                        <a href="RClientes.jsp" target="blank">Registrar cliente</a>
                    </div>
                </div>
                <div class="col-div-12">
                    <div class="box-8">
                        <div class="content-box">
                            <p>Clientes registrados</p>
                            <div class="table-responsive">
                            <table class="table table-dark table-striped table-hover table_id" id="tblClientes">
                                <thead>
                                    <tr>
                                        <th class="colorCabecera">ID</th>
                                        <th class="colorCabecera">NOMBRE</th>
                                        <th class="colorCabecera">APELLIDO</th>
                                        <th class="colorCabecera">CORREO</th> 
                                        <th class="colorCabecera">CONTRASEÑA</th> 
                                        <th class="colorCabecera">EDAD</th> 
                                        <th class="colorCabecera">NUMERO</th>
                                        <th class="colorCabecera">DISTRITO</th>
                                    </tr>
                                </thead>  
                                <% 
                                List<Cliente> listaCli = cliDao.mostrarDatosCli();
                                Iterator<Cliente> iter4 = listaCli.iterator();
                                Cliente cli=null;
                                while(iter4.hasNext()){
                                    cli=iter4.next();
                                %>
                                <tr>
                                    <td > <%= cli.getID_cli() %> </td>
                                    <td > <%= cli.getNom_cli() %> </td>
                                    <td > <%= cli.getApe_cli() %> </td>
                                    <td > <%= cli.getCorreo() %> </td>
                                    <td > <%= cli.getContra() %> </td>
                                    <td > <%= cli.getEdad() %> </td>
                                    <td > <%= cli.getCell_cli() %> </td> 
                                    <td > <%= cli.getNom_dist() %> </td>
                                    <td> 
                                        <a href="EUsuario.jsp?id=<%=cli.getID_cli() %>" class="btn btn-warning" target="blank">Editar</a>   
                                    </td>
                                    <td>
                                        <a href="DltCliente?id=<%=cli.getID_cli() %>" class="btn btn-danger">Eliminar</a>
                                    </td>
                                </tr>
                                <% 
                                    }
                                %>
                            </table>
                            </div>
                        </div>
                    </div>
                </div>            
                <div class="clearfix"></div>
                <br>
                <% 
                    if(request.getAttribute("message5")!=null){
                %>
                <script>alert('<%= request.getAttribute("message5") %>') </script>
                <% 
                    }else{}
                %>
            </div>
            
       <div data-content id="rplatos">
            <div class="contenedor-botones">
                    <form action="#" method="POST">
                        <div class="boton-box2">
                            <input  class="light-table-filter" data-table="table_id" placeholder="Buscando...">
                        </div>
                    </form>   
                    <div class="boton-box">
                        <a href="RPlatos.jsp" target="blank">Registrar plato</a>
                    </div>
                </div>
                <div class="col-div-12">
                    <div class="box-8">
                        <div class="content-box">
                            <p>Platos registrados</p>
                            <div class="table-responsive">
                            <table class="table table-dark table-striped table-hover table_id" id="tblClientes">
                                <thead>
                                    <tr>
                                        <th class="colorCabecera">ID</th>
                                        <th class="colorCabecera">NOMBRE</th>
                                        <th class="colorCabecera">DESCRIPCION</th>
                                        <th class="colorCabecera">PRECIO</th>
                                        <th class="colorCabecera">IMAGEN</th> 
                                    </tr>
                                </thead>  
                                
                                <% 
                                List<Platos> listaPla = plaDao.mostrarDatosPla();
                                Iterator<Platos> iter6 = listaPla.iterator();
                                Platos pla=null;
                                while(iter6.hasNext()){
                                    pla=iter6.next();
                                %>
                                <tr>
                                    <td > <%= pla.getId()%> </td>
                                    <td > <%= pla.getNombre() %> </td>
                                    <td > <%= pla.getDescripcion() %> </td>
                                    <td > <%= pla.getPrecio() %> </td>
                                    <td ><img src="RgtrPlatos?id=<%=pla.getId()%>" height="50px" width="80px"> </td>
                                    <td> 
                                        <a href="EPlatos.jsp?id=<%=pla.getId() %>" class="btn btn-warning" target="blank">Editar</a>   
                                    </td>
                                    <td>
                                        <a href="DltPlatos?id=<%=pla.getId() %>" class="btn btn-danger">Eliminar</a>
                                    </td>
                                </tr>
                                <% 
                                    }
                                %>
                                
                            </table>
                            </div>    
                        </div>
                    </div>
                </div>            
                <div class="clearfix"></div>
                <br>
                <% 
                    if(request.getAttribute("message6")!=null){
                %>
                <script>alert('<%= request.getAttribute("message6") %>') </script>
                <% 
                    }else{}
                %>
        </div>
        
        <div data-content id="rpedidos">
            <div class="contenedor-botones">
                    <form action="#" method="POST">
                        <div class="boton-box2">
                            <input  class="light-table-filter" data-table="table_id" placeholder="Buscando...">
                        </div>
                    </form>
            </div>
            <div class="col-div-12">
                <div class="box-8">
                    <div class="content-box">
                        <p>Pedidos Registrados</p>
                        <div class="table-responsive">
                            <table class="table table-dark table-striped table-hover table_id" id="tblClientes">
                                <thead>
                                    <tr>
                                        <th> ID-PEDIDO </th>
                                        <th> ID-CLIENTE </th>
                                        <th> ID-PRODUCTO  </th>
                                        <th> NOMBRE  </th>
                                        <th> CANTIDAD </th>
                                        <th> PRECIO </th>
                                        <th> ESTADO </th>
                                        <th> FECHA </th>
                                        <th> PAGO </th>
                                    </tr>
                                </thead> 
                                <%
                                List<Detalle_CompraA> listdt = comDao.mostrarCompraTodo();
                                Iterator<Detalle_CompraA> iter7 = listdt.iterator(); 
                                Detalle_CompraA det=null;
                                while(iter7.hasNext()){
                                    det=iter7.next();
                                %>
                                <tr>
                                    <td><%= det.getIdCompras() %></td>
                                    <td><%= det.getIdCliente()%></td>
                                    <td><%= det.getIdPlato()%></td>
                                    <td><%= det.getNombrePlato()%></td>
                                    <td><%= det.getCantidad() %></td>
                                    <td><%= det.getPrecioCompra() %></td>
                                    <td><%= det.getEstado() %></td>
                                    <td><%= det.getFecha()%></td>
                                    <td ><img src="ControladorCarrito?id=<%= det.getImagen()%>" height="50px" width="80px"> </td>
                                </tr>
                                
                                <% 
                                    } 
                                %>
                                
                            </table>
                        </div>
                    </div> 
                </div>
            </div>
                
        </div>        
        
            
        </main>
        <script src="js/RegAdPlato.js" type="text/javascript"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
        <script src="js/RegistroClientes.js" type="text/javascript"></script>
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
               
               const mediumBp = matchMedia('(max-width:300px)');
               const changeSize = mql =>{
                mql.matches
                   $("#mySidenav").css('width','70px');
                   $(".head").css('margin-left','0px');
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
            }
            mediumBp.addListener(changeSize);
            changeSize(mediumBp);
            
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
               
               const mediumBp = matchMedia('(max-width:300px)');
               const changeSize = mql =>{
                mql.matches
                    $("#mySidenav").css('width','300px');
                    $(".head").css('margin-left','300px');
                    $("#main").css('margin-left','0px');
                    $(".logo").css('visibility','visible');
                    $(".logo span").css('visibility','visible');
                    $(".icon-a").css('visibility','visible');
                    $(".icons").css('visibility','visible');
                    $(".nav").css('display','block');
                    $(".nav2").css('display','none');
                    $("main").css('margin-left','0px');
            }
            mediumBp.addListener(changeSize);
            changeSize(mediumBp);
               
            });
            
            const mediumBp = matchMedia('(max-width:300px)');
            const changeSize = mql =>{
                mql.matches
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
            }
            mediumBp.addListener(changeSize);
            changeSize(mediumBp);
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
        <script src="js/buscador.js" type="text/javascript"></script>
    </body>   
</html>
