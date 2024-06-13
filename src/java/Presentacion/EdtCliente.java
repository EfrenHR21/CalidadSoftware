package Presentacion;

import Negocio.Cliente;
import Persistencia.ClienteDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "EdtCliente", urlPatterns = {"/EdtCliente"})
public class EdtCliente extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
            String id = request.getParameter("id");
            String nom_cliC = request.getParameter("nom_cliC");
            String ape_cliC = request.getParameter("ape_cliC");
            String correoC = request.getParameter("correoC");
            String contraC = request.getParameter("contraC");
            int edadC = Integer.parseInt(request.getParameter("edadC"));
            int cell_cliC = Integer.parseInt(request.getParameter("cell_cliC"));
            String distrito = request.getParameter("distrito_cliC");
            String mensaje = "";
            int res;
            
            Cliente cli = new Cliente(id, nom_cliC, ape_cliC, correoC, contraC, distrito, edadC, cell_cliC);
            ClienteDAO cliDAO = new ClienteDAO();
            
            if(request.getParameter("enviar") != null){
                res = cliDAO.actualizarCliente(cli);
                if(res != 0){
                    mensaje = "Actualización Completada";
                }
            }
            request.setAttribute("message", mensaje);
            request.getRequestDispatcher("/EClientes.jsp").forward(request, response);  
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
