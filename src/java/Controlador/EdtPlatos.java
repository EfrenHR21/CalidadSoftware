package Controlador;

import DAO.PlatosDAO;
import Modelo.*;
import java.io.IOException;
import java.io.*;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@MultipartConfig
@WebServlet(name = "EdtPlatos", urlPatterns = {"/EdtPlatos"})
public class EdtPlatos extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
            int id = Integer.parseInt(request.getParameter("id"));
            String nombre = request.getParameter("nombreP");
            String descripcion = request.getParameter("descripcionP");
            double precio = Double.parseDouble(request.getParameter("precioP"));
            Part part=request.getPart("fileImagen");
            InputStream inputStream=part.getInputStream();
            String mensaje = "";
            int res;
            
            Platos pla = new Platos(id, nombre, precio, descripcion, inputStream); 
            PlatosDAO plaDao = new PlatosDAO();
            
            if(request.getParameter("enviar") != null){
                res = plaDao.actualizarPlato(pla);
                if(res != 0){
                    mensaje = "Actualización Completada";
                }
            }
            request.setAttribute("message", mensaje);
            request.getRequestDispatcher("/EPlatos.jsp").forward(request, response);
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
