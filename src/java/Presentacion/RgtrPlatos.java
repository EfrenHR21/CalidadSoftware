
package Presentacion;

import Negocio.Platos;
import Persistencia.PlatosDAO;
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
@WebServlet(name = "RgtrPlatos", urlPatterns = {"/RgtrPlatos"})
public class RgtrPlatos extends HttpServlet {
    
    PlatosDAO plaDao = new PlatosDAO();
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            response.setContentType("text/html;charset=UTF-8");
            
            String nombre = request.getParameter("nombrep");
            String descripcion = request.getParameter("descripcionp");
            double precio = Double.parseDouble(request.getParameter("preciop"));
            Part part=request.getPart("fileImagen");
            InputStream inputStream=part.getInputStream();
            String mensaje = "";
            int res;
            
            Platos pla = new Platos(nombre, descripcion, inputStream, precio);
            
            if(request.getParameter("enviar") != null){
                res = plaDao.insertarPlatos(pla);
                if(res != 0){
                    mensaje = "Registro Completado";
                }
            }
            request.setAttribute("message", mensaje);
            request.getRequestDispatcher("/RPlatos.jsp").forward(request, response);  
                    
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id=Integer.parseInt(request.getParameter("id"));
        plaDao.mostrarImg(id, response);
    }

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
