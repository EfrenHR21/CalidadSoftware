<%@page import="DAO.*" %>
<%@page import="Modelo.*" %>
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
        <link href="https://getbootstrap.com/docs/5.2/assets/css/docs.css" rel="stylesheet">
        <meta name="viewport" content="width=device-width, initial-scale=1" />
    </head>
    <body>
        <%!
            TrabajadorDAO traDao = new TrabajadorDAO();
        %>
        <% 
            String id = request.getParameter("id");
            List<Trabajador> listaTra = traDao.editarTrabajador(id);
            Iterator<Trabajador> iter = listaTra.iterator();
            Trabajador trab=null;
            while(iter.hasNext()){
                trab=iter.next();
        %>
        <main>
            <div class="contenedor-empleado">
                <div class="login-box">
                    <h2>Editar Trabajador</h2>
                    <form action="${pageContext.servletContext.contextPath}/EdtEmpleado?id=<%= trab.getID_trab() %>" method="POST">
                      <div class="user-box">
                        <input type="text" name="nom_trabE" value="<%= trab.getNom_trab() %>" required="">
                        <label>Nombre</label>
                      </div>
                      <div class="user-box">
                        <input type="text" name="ape_trabE" value="<%= trab.getApe_trab() %>" required="">
                        <label>Apellido</label>
                      </div>  
                       <div class="user-box">
                        <input type="text" name="correoE" value="<%= trab.getCorreo() %> " required="">
                        <label>Correo</label>
                      </div> 
                      <div class="user-box">
                          <input type="password" name="contraE" value="<%= trab.getContra() %>" required="">
                        <label>Contraseña</label>
                      </div>
                      <label>Cargo</label>  
                      <div class="contenedor-select">
                          <select class="elegir-box" name="cargo_trabE">
                                    <option value="<%=trab.getID_cargo() %>"><%=trab.getNombre_cargo() %></option> 
                                    <% 
                                        List<Trabajador> listaTr = traDao.mostrarDatosCargo();
                                        for(Trabajador elem: listaTr){
                                    %>
                                    <option value="<%= elem.getID_cargo()%>"> <%= elem.getNombre_cargo() %> </option>
                                    <% 
                                        }
                                    %>
                          </select> 
                          <div class="icon-contenedor">
                              <i class="fa-solid fa-caret-down"></i>
                          </div>
                      </div><br><br>  
                      <div class="user-box">
                        <input type="text" name="dni_trabE" value="<%= trab.getDni_trab() %>" required="">
                        <label>DNI</label>
                      </div> 
                      <div class="user-box">
                        <input type="text" name="numero_trabE" value="<%= trab.getNumero_trab() %>"  required="">
                        <label>Numero</label>
                      </div>
                      <div class="boton-box">
                          <input type="submit" name="enviar" value="Guardar T." id="enviar">
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
