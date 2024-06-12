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
            ClienteDAO cliDao = new ClienteDAO();
        %>
        <% 
            String id = request.getParameter("id");
            List<Cliente> listaCli = cliDao.editarCliente(id);
            Iterator<Cliente> iter = listaCli.iterator();
            Cliente cli=null;
            while(iter.hasNext()){
                cli=iter.next();
        %>
        
        <main>
            <div class="contenedor-cliente">
                <div class="login-box">
                    <h2>Editar Cliente</h2>
                    <form action="${pageContext.servletContext.contextPath}/EdtCliente?id=<%= cli.getID_cli() %>" method="POST">
                      <div class="user-box">
                        <input type="text" name="nom_cliC" value="<%= cli.getNom_cli() %>" required="">
                        <label>Nombre</label>
                      </div>
                      <div class="user-box">
                        <input type="text" name="ape_cliC" value="<%= cli.getApe_cli() %>" required="">
                        <label>Apellido</label>
                      </div>  
                       <div class="user-box">
                           <input type="text" name="correoC" value="<%= cli.getCorreo() %>" required="">
                        <label>Correo</label>
                      </div> 
                      <div class="user-box">
                        <input type="password" name="contraC" value="<%= cli.getContra() %>" required="">
                        <label>Contraseña</label>
                      </div>
                      <div class="user-box">
                        <input type="text" name="edadC" value="<%= cli.getEdad() %>" required="">
                        <label>Edad</label>
                      </div> 
                      <div class="user-box">
                        <input type="text" name="cell_cliC" value="<%= cli.getCell_cli() %>" required="">
                        <label>Numero</label>
                      </div>
                      <label>Distrito</label>  
                      <div class="contenedor-select">
                          <select class="elegir-box" name="distrito_cliC">
                                    <option value="<%= cli.getId_dist() %>"><%= cli.getNom_dist() %> </option> 
                                    <% 
                                        List<Cliente> listDis= cliDao.mostrarDatosDistrito();
                                        for(Cliente elem: listDis){
                                    %>
                                    <option value="<%= elem.getId_dist()%>"> <%= elem.getNom_dist() %> </option>
                                    <% 
                                        }
                                    %>
                          </select>
                          <div class="icon-contenedor">
                              <i class="fa-solid fa-caret-down"></i>
                          </div>
                      </div><br>  

                      <div class="boton-box">
                          <input type="submit" name="enviar" value="Guardar Cliente" id="enviar">
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
