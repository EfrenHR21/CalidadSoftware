<%@page import="Persistencia.*" %>
<%@page import="Negocio.*" %>
<%@page import="Controlador.*" %>
<%@page import="java.util.*" %>
<html>
    <head>
        <meta charset="UTF-8">
        <link rel="icon" type="image/png" href="Imagenes/IProductos/Inicio/LOGO.jpg">
        <title>Restaurante Pihuicho</title>
        <link href="CSS-Login/EstiloHLogin.css.css" rel="stylesheet">
        <link href="CSS-Header/EstiloHeade.css" rel="stylesheet" type="text/css"/>
        <link href="CSS/Catalogo/EstiloLateralB.css" rel="stylesheet" type="text/css"/>
        <link href="CSS-Login/EstiloLogin01.css" rel="stylesheet" type="text/css"/>
        <link href="CSS/Catalogo/EstiloBFilas.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css">
        <meta name="viewport" content="width=device-width, initial-scale=1" />
    </head>
    <body>
        <%!
            TrabajadorDAO traDao = new TrabajadorDAO();
        %>       
        <main>
            <div class="contenedor-empleado">
                <div class="login-box">
                    <h2>Registro Trabajador</h2>
                    <form action="${pageContext.servletContext.contextPath}/RgtrEmpleado" method="POST">
                      <div class="user-box">
                        <input type="text" name="nom_trab" required="">
                        <label>Nombre</label>
                      </div>
                      <div class="user-box">
                        <input type="text" name="ape_trab" required="">
                        <label>Apellido</label>
                      </div>  
                       <div class="user-box">
                        <input type="text" name="correo" required="">
                        <label>Correo</label>
                      </div> 
                      <div class="user-box">
                        <input type="password" name="contra" required="">
                        <label>Contraseña</label>
                      </div>
                      <label>Cargo</label>  
                      <div class="contenedor-select">
                          <select class="elegir-box" name="cargo_trab">
                                    <option value="0">...</option> 
                                    <% 
                                        List<Trabajador> listaTr = traDao.mostrarDatosCargo();
                                        for(Trabajador elem: listaTr){
                                    %>
                                    <option value="<%= elem.getID_cargo() %>"> <%= elem.getNombre_cargo() %> </option>
                                    <% 
                                        }
                                    %>
                          </select> 
                          <div class="icon-contenedor">
                              <i class="fa-solid fa-caret-down"></i>
                          </div>
                      </div><br>
                      <div class="user-box">
                        <input type="text" name="dni_trab" required="">
                        <label>DNI</label>
                      </div> 
                      <div class="user-box">
                        <input type="text" name="numero_trab" required="">
                        <label>Numero</label>
                      </div>
                      <div class="boton-box">
                          <input type="submit" name="enviar" value="Registrar T." id="enviar">
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
