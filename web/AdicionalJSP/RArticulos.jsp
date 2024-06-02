<%@page import="DAO.*" %>
<%@page import="Modelo.*" %>
<%@page import="Controlador.*" %>
<%@page import="java.util.*" %>
<html>
    <head>
        <meta charset="UTF-8">
        <link rel="icon" type="image/png" href="Imagenes/IProductos/Inicio/LOGO.jpg">
        <title>Restaurante Pihuicho</title>
        <link href="CSS-Login/EstiloHLogin.css.css" rel="stylesheet">
        <link href="CSS-Header/EstiloHeade.css" rel="stylesheet" type="text/css"/>
        <link href="CSS-Login/EstiloLogin01.css" rel="stylesheet">
        <link href="CSS/Catalogo/EstiloLateralB.css" rel="stylesheet" type="text/css"/>
        <link href="CSS/Catalogo/EstiloBFilas.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css">
        <meta name="viewport" content="width=device-width, initial-scale=1" />
    </head>
    <body>
        <%!
            ArticuloDAO artDao = new ArticuloDAO();
            TrabajadorDAO traDao = new TrabajadorDAO();
            ProveedorDAO provDao = new ProveedorDAO(); 
        %>
        <main>
            <div class="contenedor-articulo">
                <div class="login-box">
                    <h2>Registro de Articulos</h2>
                    <form action="${pageContext.servletContext.contextPath}/RgtrArticulo" method="POST">
                      <div class="user-box">
                        <input type="text" name="nom_articulo" required="">
                        <label>Nombre Compra</label>
                      </div>
                      <div class="user-box">
                        <input type="text" name="cantidad" required="">
                        <label>Cantidad</label>
                      </div>
                      <label>Encargado</label>
                      <div class="contenedor-select">
                          <select class="elegir-box" name="Encargado">
                                    <option value="0">...</option>    
                                    <% 
                                    List<Trabajador> listaTra1 = traDao.mostrarDatosEmp();
                                    Iterator<Trabajador> iter = listaTra1.iterator();
                                    Trabajador trab1=null;
                                    while(iter.hasNext()){
                                        trab1=iter.next();
                                    %>
                                        <option value="<%= trab1.getNom_trab()%> "> <%= trab1.getNom_trab() %> </option>
                                    <% 
                                        }
                                    %>
                          </select>
                          <div class="icon-contenedor">
                              <i class="fa-solid fa-caret-down"></i>
                          </div>
                      </div><br>  
                      <label>Categoria de Producto</label>  
                      <div class="contenedor-select">
                          <select class="elegir-box" name="Cproducto">
                                    <option value="0">...</option>  
                                    <% 
                                        List<Articulo> listArt= artDao.mostrarDatosCatPro();
                                        for(Articulo elem: listArt){
                                    %>
                                    <option value="<%= elem.getNombre_cat()%>"> <%= elem.getNombre_cat() %> </option>
                                    <% 
                                        }
                                    %>
                          </select>
                          <div class="icon-contenedor">
                              <i class="fa-solid fa-caret-down"></i>
                          </div>
                      </div><br>
                      <label>Proveedor</label>
                      <div class="contenedor-select">
                          <select class="elegir-box" name="Proveedor">
                                    <option value="0">...</option>  
                                    <% 
                                    List<Proveedor> listaProv = provDao.mostrarDatosProv();
                                    Iterator<Proveedor> iter1 = listaProv.iterator();
                                    Proveedor prov1=null;
                                    while(iter1.hasNext()){
                                        prov1=iter1.next();
                                    %>
                                        <option value="<%= prov1.getNombreProv() %> "> <%= prov1.getNombreProv() %> </option>
                                    <% 
                                        }
                                    %>
                        </select>
                        <div class="icon-contenedor">
                              <i class="fa-solid fa-caret-down"></i>
                        </div>  
                      </div><br>
                      
                      <div class="user-box">
                        <input type="text" name="precioA" required="">
                        <label>Costo</label>
                      </div>
                      
                      <div class="boton-box">
                          <input type="submit" name="enviar" value="Registrar A." id="enviar"><br> 
                      </div>
                    </form>
                </div>
            </div>
        </main>
        <% 
            if(request.getAttribute("message")!=null){
        %>
        <script>alert('<%= request.getAttribute("message") %>') </script>
        <% 
            }
        %>
    </body>
</html>

