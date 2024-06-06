package Controlador;

import Negocio.Cliente;
import Persistencia.ClienteDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "RgtrCliente", urlPatterns = {"/RgtrCliente"})
public class RgtrCliente extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String nom_cli = request.getParameter("nom_cli");
            String ape_cli = request.getParameter("ape_cli");
            String correo = request.getParameter("correo");
            String contra = request.getParameter("contra");
            int edad = Integer.parseInt(request.getParameter("edad"));
            int cell_cli = Integer.parseInt(request.getParameter("cell_cli"));
            String id_dist = request.getParameter("distrito_cli");
            String mensaje = "";
            int res;
            
            Cliente cli = new Cliente(nom_cli, ape_cli, correo, contra, id_dist, edad, cell_cli);
            ClienteDAO cliDao = new ClienteDAO();
            
            if(request.getParameter("enviar") != null && request.getParameter("distrito_cli").equals("0") ){
                mensaje = "Error: Registro Incompleto";
            }else if(request.getParameter("enviar") != null){
                res = cliDao.insertarCliente(cli);
                if(res != 0 ){
                    mensaje = "Registro Completado";
                }
            }
            request.setAttribute("message", mensaje);
            request.getRequestDispatcher("/RClientes.jsp").forward(request, response);
        } catch(Exception e){
            System.out.println(e);
        }
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
