<%@page import="Persistencia.*" %>
<%@page import="Negocio.*" %>
<%@page import="Presentacion.*" %>
<%@page import="java.util.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="icon" type="image/png" href="Imagenes/IProductos/Inicio/LOGO.jpg">
        <title>Restaurante Pihuicho</title>
        <link href="CSS-Login/EstiloLogin01.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css">
        <link href="https://getbootstrap.com/docs/5.2/assets/css/docs.css" rel="stylesheet">
        <meta name="viewport" content="width=device-width, initial-scale=1" />
    </head>
    <body>
        <%!
            ProveedorDAO provDao = new ProveedorDAO();
        %>
        <% 
            String id = request.getParameter("id");
            List<Proveedor> listaProv = provDao.editarProveedor(id);
            Iterator<Proveedor> iter = listaProv.iterator();
            Proveedor prov=null;
            while(iter.hasNext()){
                prov=iter.next();
        %>
        <main>
            <div class="contenedor-proveedor">
                <div class="login-box">
                    <h2>Editar Proveedor</h2>
                    <form action="${pageContext.servletContext.contextPath}/EdtProveedor?id=<%= prov.getIdProv() %>" method="POST">
                      <div class="user-box">
                        <input type="text" name="nombreProvP" value="<%=prov.getNombreProv() %>" required="">
                        <label>Nombre</label>
                      </div>
                       <div class="user-box">
                        <input type="text" name="correoP" value="<%=prov.getCorreo() %>" required="">
                        <label>Correo</label>
                      </div> 
                      <div class="user-box">
                        <input type="text" name="RUCP" value="<%=prov.getRUC() %>" required="">
                        <label>RUC</label>
                      </div> 
                      <div class="user-box">
                        <input type="text" name="telefonoP" value="<%=prov.getTelefono() %>" required="">
                        <label>Numero</label>
                      </div>
                      <div class="user-box">
                        <input type="text" name="direccionP" value="<%=prov.getDireccion() %>" required="">
                        <label>Direccion</label>
                      </div>
                      <div class="boton-box">
                          <input type="submit" name="enviar" value="Guardar P." id="enviar">
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
