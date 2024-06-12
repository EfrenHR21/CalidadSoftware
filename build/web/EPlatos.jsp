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
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css">
        <link href="https://getbootstrap.com/docs/5.2/assets/css/docs.css" rel="stylesheet">
        <meta name="viewport" content="width=device-width, initial-scale=1" />
    </head>
    <body>
        <%!
            PlatosDAO plaDao = new PlatosDAO();
        %>
        <% 
            String id = request.getParameter("id");
            List<Platos> listaPla = plaDao.editarPlatos(id);
            Iterator<Platos> iter = listaPla.iterator();
            Platos pla=null;
            while(iter.hasNext()){
                pla=iter.next();
        %>
        
        <main>
            <div class="contenedor-cliente">
                <div class="login-box">
                    <h2>Editar Plato</h2>
                    <form action="${pageContext.servletContext.contextPath}/EdtPlatos?id=<%= pla.getId() %>" method="POST" enctype="multipart/form-data">
                      <div class="user-box">
                        <input type="text" REQUIRED name="nombreP" value="<%= pla.getNombre() %>" required="">
                        <label>Nombre</label>
                      </div>
                      <div class="user-box">
                        <input type="text" REQUIRED name="descripcionP" value="<%= pla.getDescripcion() %>" required="">
                        <label>Descripción</label>
                      </div>  
                      <div class="user-box">
                        <input type="text" REQUIRED name="precioP" value="<%= pla.getPrecio() %>" required="">
                        <label>Precio</label>
                      </div>   
                      <div class="box-upload">
                            <label for="subirImagen"><i class="fa-solid fa-upload"></i>Subir imagen</label>
                            <input type="file" id="subirImagen" name="fileImagen" value="<%= pla.getImagen() %>" required="">
                      </div>
                      
                      <div class="boton-box">
                          <input type="submit" name="enviar" value="Guardar plato" id="enviar">
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
