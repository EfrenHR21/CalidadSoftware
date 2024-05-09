package Controlador;

import DAO.ClienteDAO;
import DAO.TrabajadorDAO;
import Modelo.Cliente;
import Modelo.Trabajador;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "Sesion", urlPatterns = {"/Sesion"})
public class Sesion extends HttpServlet {
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
        cli = cliDAO.loginCliente(correo, contra);
        tra = traDAO.loginTrabajador(correo, contra);
        HttpSession session = request.getSession();
        if(request.getParameter("cerrar")!=null){
            session.removeAttribute("loginTrabajador");
            session.removeAttribute("loginCliente");
            session.invalidate();
            response.sendRedirect("index.jsp");
        }else{ 
        if(tra.getCorreo()!=null && tra.getContra()!=null && tra.getCargo_trab().equals("TR001")){
            session.setAttribute("loginTrabajador", tra);
            response.sendRedirect("Intranet_trabajador.jsp");  
        }else{
        if(tra.getCorreo()!=null && tra.getContra()!=null){
            session.setAttribute("loginTrabajador", tra);
            response.sendRedirect("Intranet_trabajador_2.jsp");
//      request.getRequestDispatcher("Intranet_trabajador.jsp").forward(request, response);
        }else{
        if( cli.getCorreo()!=null && cli.getContra()!=null){
            session.setAttribute("loginCliente", cli);
            response.sendRedirect("Intranet_cliente.jsp");
//      request.getRequestDispatcher("/Intranet_cliente.jsp").forward(request, response);
        }else{    
            mensaje = "Datos ingresados son incorrectos";
            request.setAttribute("mensajito", mensaje);
            request.getRequestDispatcher("InicioS.jsp").forward(request, response);
        }}}}
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
