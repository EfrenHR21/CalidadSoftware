package Controlador;

import DAO.ProveedorDAO;
import Modelo.*;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "RgtrProveedor", urlPatterns = {"/RgtrProveedor"})
public class RgtrProveedor extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String nombreProv = request.getParameter("nombreProv");
            String correo = request.getParameter("correo");
            String RUC = request.getParameter("RUC");
            String telefono = request.getParameter("telefono");
            String direccion = request.getParameter("direccion");
            String mensaje = "";
            int res;
            
            Proveedor prov = new Proveedor(nombreProv, correo, RUC, telefono, direccion);
            ProveedorDAO provDAO = new ProveedorDAO();
            
            if(request.getParameter("enviar") != null){
                res = provDAO.insertarProveedor(prov);
                if(res != 0){
                    mensaje = "Registro Completado";
                }
            }
            request.setAttribute("message", mensaje);
            request.getRequestDispatcher("/RProveedor.jsp").forward(request, response);
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
