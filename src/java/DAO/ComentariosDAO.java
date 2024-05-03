
package DAO;
import Modelo.*;
import config.ConexionBD;
import java.sql.*;
import java.util.*;

public class ComentariosDAO {
    ConexionBD cn = new ConexionBD();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    int r=0;
    
    public int RegistrarComentario(Comentario com){
        int res =0;
        String sql="INSERT INTO comentarios(nombre, comentario) VALUES (?,?)";
        try{
            con=ConexionBD.conectar();
            ps=con.prepareStatement(sql);
            ps.setString(1,com.getNombre());
            ps.setString(2,com.getComentario());
            res = ps.executeUpdate();
            
        } catch (SQLException e){
            System.out.println(e);
        }
        return res;
    }
    
    public List MostarComentarios(){
        ArrayList<Comentario> list = new ArrayList();
        String sql = "select nombre, comentario, fechaC from comentarios";
        try {
            con= ConexionBD.conectar();
            ps=con.prepareStatement(sql);
            rs=ps.executeQuery();
            while(rs.next()){
                Comentario com = new Comentario();
                com.setNombre(rs.getString("nombre"));
                com.setComentario(rs.getString("comentario"));
                com.setFecha(rs.getString("fechaC"));
                list.add(com);
            }
              
        } catch (Exception e) {
            System.out.println(e);
        } return list;
   }
    
    
    
    
}
