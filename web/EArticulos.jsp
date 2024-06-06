<%@page import="Persistencia.*" %>
<%@page import="Negocio.*" %>
<%@page import="Controlador.*" %>
<%@page import="java.util.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="icon" type="image/png" href="Imagenes/IProductos/Inicio/LOGO.jpg">
        <title>Restaurante Pihuicho</title>
        <link href="CSS-Login/EstiloLogin01.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css">   
        <meta name="viewport" content="width=device-width, initial-scale=1" />
    </head>
    <body>
        <%!
            ArticuloDAO artDao = new ArticuloDAO();
            TrabajadorDAO traDao = new TrabajadorDAO();
            ProveedorDAO provDao = new ProveedorDAO(); 
        %>
        <% 
            String id = request.getParameter("id");
            List<Articulo> listaArt = artDao.editarArticulo(id);
            Iterator<Articulo> iter = listaArt.iterator();
            Articulo art=null;
            while(iter.hasNext()){
                art=iter.next();
        %>
        <main>
            <div class="contenedor-articulo">
                <div class="login-box">
                    <h2>Editar Articulos</h2>
                    <form action="${pageContext.servletContext.contextPath}/EdtArticulo?id=<%= art.getID_Articulo() %>" method="POST">
                      <div class="user-box">
                        <input type="text" name="nom_articuloA" value="<%= art.getNom_articulo() %>" required="">
                        <label>Nombre Compra</label>
                      </div>
                      <div class="user-box">
                        <input type="text" name="cantidadA" value="<%= art.getCantidad() %>" required="">
                        <label>Cantidad</label>
                      </div>
                      <label>Encargado</label>
                      <div class="contenedor-select">
                          <select class="elegir-box" name="EncargadoA">
                                    <option value="<%= art.getEncargado() %>"><%= art.getEncargado() %></option>    
                                    <% 
                                    List<Trabajador> listaTra1 = traDao.mostrarDatosEmp();
                                    Iterator<Trabajador> itera = listaTra1.iterator();
                                    Trabajador trab1=null;
                                    while(iter.hasNext()){
                                        trab1=itera.next();
                                    %>
                                        <option value="<%= trab1.getNom_trab()%> "> <%= trab1.getNom_trab() %> </option>
                                    <% 
                                        }
                                    %><% 
                                    List<Trabajador> listaTra2 = traDao.mostrarDatosEmp();
                                    Iterator<Trabajador> itera1 = listaTra2.iterator(); 
                                    Trabajador trab2=null;
                                    while(itera1.hasNext()){
                                        trab2=itera1.next();
                                    %>
                                        <option value="<%= trab2.getNom_trab()%> "> <%= trab2.getNom_trab() %> </option>
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
                          <select class="elegir-box" name="CproductoA">
                                    <option value="<%= art.getCproducto() %>"><%= art.getCproducto() %> </option>  
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
                          <select class="elegir-box" name="ProveedorA">
                                    <option value="<%= art.getProveedor() %>"><%= art.getProveedor() %></option>  
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
                      </div><br><br>
                      <div class="user-box">
                        <input type="text" name="precioAA" value="<%= art.getPrecioA() %>" required="">
                        <label>Costo</label>
                      </div>      
                      
                      <div class="boton-box">
                          <input type="submit" name="enviar" value="Guardar A." id="enviar"><br> 
                      </div>
                    </form>
                </div>
            </div>
        </main>
        <% 
            }
        %>
        <% 
            if(request.getAttribute("message")!=null){
        %>
        <script>alert('<%= request.getAttribute("message") %>') </script>
        <% 
            }
        %>                
    </body>
</html>
