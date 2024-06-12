
package Presentacion;

import Negocio.Trabajador;
import Persistencia.TrabajadorDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet(name = "RgtrEmpleado", urlPatterns = {"/RgtrEmpleado"})
public class RgtrEmpleado extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String nom_trab = request.getParameter("nom_trab");
            String ape_trab = request.getParameter("ape_trab");
            String correo = request.getParameter("correo");
            String contra = request.getParameter("contra");
            int dni_trab = Integer.parseInt(request.getParameter("dni_trab"));
            int numero_trab = Integer.parseInt(request.getParameter("numero_trab"));
            String cargo_trab = request.getParameter("cargo_trab");
            String mensaje = "";
            int res;
            
            Trabajador trab = new Trabajador(nom_trab, ape_trab, correo, contra, cargo_trab, dni_trab, numero_trab);
            TrabajadorDAO trabDao = new TrabajadorDAO();
            
            if( request.getParameter("enviar") != null && request.getParameter("cargo_trab").equals("0") ){
                mensaje = "Error: Registro Incompleto";
            }else if(request.getParameter("enviar") != null){
                res = trabDao.insertarTrabajador(trab);
                if(res != 0){
                    mensaje = "Registro Completado";
                }
            }
            request.setAttribute("message", mensaje);
            request.getRequestDispatcher("/RTrabajador.jsp").forward(request, response);
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
