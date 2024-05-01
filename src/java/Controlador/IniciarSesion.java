package Controlador;

import Modelo.*;
import DAO.*;
import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class IniciarSesion extends HttpServlet {

    TrabajadorDAO traDAO = new TrabajadorDAO();
    Trabajador tra = new Trabajador();
    ClienteDAO cliDAO = new ClienteDAO();
    Cliente cli = new Cliente();
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        String mensaje = "";
        String correo = request.getParameter("correo");
        String contra = request.getParameter("contra");
        tra = traDAO.loginTrabajador(correo, contra);
        if(tra!=null && tra.getCorreo()!=null && tra.getContra()!=null && tra.getCargo_trab().equals("TR001")){
            HttpSession session = request.getSession();
            session.setAttribute("loginTrabajador", tra);
            response.sendRedirect("Intranet_trabajador.jsp");  
        }else
        if(tra!=null && tra.getCorreo()!=null && tra.getContra()!=null){
            HttpSession session = request.getSession();
            session.setAttribute("loginTrabajador", tra);
            response.sendRedirect("Intranet_trabajador_2.jsp");
//            request.getRequestDispatcher("Intranet_trabajador.jsp").forward(request, response);
        }else{
        cli = cliDAO.loginCliente(correo, contra);
            if(cli!=null && cli.getCorreo()!=null && cli.getContra()!=null){
                HttpSession session = request.getSession();
                session.setAttribute("loginCliente", cli);
                response.sendRedirect("Intranet_cliente.jsp");
//                request.getRequestDispatcher("/Intranet_cliente.jsp").forward(request, response);
            }else{
                 mensaje = "Datos ingresados son incorrectos";
                 request.setAttribute("mensajito", mensaje);
                 request.getRequestDispatcher("InicioS.jsp").forward(request, response);
            }
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
