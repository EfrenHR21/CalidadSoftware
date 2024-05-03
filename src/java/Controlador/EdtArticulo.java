
package Controlador;

import DAO.ArticuloDAO;
import Modelo.*;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "EdtArticulo", urlPatterns = {"/EdtArticulo"})
public class EdtArticulo extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String id = request.getParameter("id");
            String nom_articulo = request.getParameter("nom_articuloA");
            String cantidad = request.getParameter("cantidadA");
            String Encargado = request.getParameter("EncargadoA");
            String precioA = request.getParameter("precioAA");
            String Proveedor = request.getParameter("ProveedorA");
            String Cproducto = request.getParameter("CproductoA");
            String mensaje = "";
            int res;
            
            Articulo trab = new Articulo(id, nom_articulo, cantidad, Encargado, precioA, Proveedor, Cproducto);
            ArticuloDAO artDAO = new ArticuloDAO();
            
            if(request.getParameter("enviar") != null){
                res = artDAO.actualizarArticulo(trab);
                if(res != 0){
                    mensaje = "Actualización Completada";
                }
            }
            request.setAttribute("message", mensaje);
            request.getRequestDispatcher("/EArticulos.jsp").forward(request, response);
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
