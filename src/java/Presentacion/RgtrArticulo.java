package Presentacion;

import Negocio.Articulo;
import Persistencia.ArticuloDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "RgtrArticulo", urlPatterns = {"/RgtrArticulo"})
public class RgtrArticulo extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String nom_articulo = request.getParameter("nom_articulo");
            String cantidad = request.getParameter("cantidad");
            String Encargado = request.getParameter("Encargado");
            String precioA = request.getParameter("precioA");
            String Proveedor = request.getParameter("Proveedor");
            String Cproducto = request.getParameter("Cproducto");
            String mensaje = "";
            int res;
            
            Articulo trab = new Articulo(nom_articulo, cantidad, Encargado, precioA, Proveedor, Cproducto);
            ArticuloDAO artDAO = new ArticuloDAO();
            
            if( request.getParameter("enviar") != null && request.getParameter("Cproducto").equals("0") || request.getParameter("Encargado").equals("0") || request.getParameter("Proveedor").equals("0") ){
                mensaje = "Error: Registro Incompleto";
            }else if(request.getParameter("enviar") != null){
                res = artDAO.insertarArticulo(trab);
                if(res != 0){
                    mensaje = "Registro Completado";
                }
            }
            request.setAttribute("message", mensaje);
            request.getRequestDispatcher("/RArticulos.jsp").forward(request, response);
        } catch(Exception e){
            System.out.println(e);
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
