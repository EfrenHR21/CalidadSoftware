
package Controlador;

import Negocio.Proveedor;
import Persistencia.ProveedorDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "EdtProveedor", urlPatterns = {"/EdtProveedor"})
public class EdtProveedor extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String id = request.getParameter("id");
            String nombreProvP = request.getParameter("nombreProvP");
            String correoP = request.getParameter("correoP");
            String RUCP = request.getParameter("RUCP");
            String telefonoP = request.getParameter("telefonoP");
            String direccionP = request.getParameter("direccionP");
            String mensaje = "";
            int res;
           
            Proveedor prov = new Proveedor(id, nombreProvP, correoP, RUCP, telefonoP, direccionP);
            ProveedorDAO provDAO = new ProveedorDAO();
            
            if(request.getParameter("enviar") != null){
                res = provDAO.actualizarProveedor(prov);
                if(res != 0){
                    mensaje = "Actualización Completada";
                }
            }
            request.setAttribute("message", mensaje);
            request.getRequestDispatcher("/EProveedor.jsp").forward(request, response);
            
        }catch(Exception e){
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
