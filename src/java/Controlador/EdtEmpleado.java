
package Controlador;

import Negocio.Trabajador;
import Persistencia.TrabajadorDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "EdtEmpleado", urlPatterns = {"/EdtEmpleado"})
public class EdtEmpleado extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String id = request.getParameter("id");
            String nom_trab = request.getParameter("nom_trabE");
            String ape_trab = request.getParameter("ape_trabE");
            String correo = request.getParameter("correoE");
            String contra = request.getParameter("contraE");
            int dni_trab = Integer.parseInt(request.getParameter("dni_trabE"));
            int numero_trab = Integer.parseInt(request.getParameter("numero_trabE"));
            String cargo_trab = request.getParameter("cargo_trabE");
            String mensaje = "";
            int res;
            
            Trabajador trab = new Trabajador(id, nom_trab, ape_trab, correo, contra, cargo_trab, dni_trab, numero_trab);
            TrabajadorDAO trabDao = new TrabajadorDAO();
            
            if(request.getParameter("enviar") != null){
                res = trabDao.actualizarTrabajador(trab);
                if(res != 0){
                    mensaje = "Actualización Completada";
                }
            }
            request.setAttribute("message", mensaje);
            request.getRequestDispatcher("/ETrabajador.jsp").forward(request, response);
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
