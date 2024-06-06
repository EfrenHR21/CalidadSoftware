
package Persistencia;

import config.ConexionBD;
import java.sql.*;

public class ContadorDAO {
    ConexionBD cn = new ConexionBD();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    int rspta=0;
    
    public void insertarVisita(int hit){
        String sqlIv="UPDATE visitacontador set counter=? WHERE ID_counter=1";
        try{
            con= ConexionBD.conectar();
            ps=con.prepareStatement(sqlIv);
            ps.setInt(1, hit);
            ps.executeUpdate();
            
        } catch (SQLException e){
            System.out.println(e);
        }
    }
    
    public int getVisita(){
        String sqlMv="SELECT counter FROM visitacontador WHERE ID_counter=1";
        try{
            con= ConexionBD.conectar();
            ps=con.prepareStatement(sqlMv);
            rs=ps.executeQuery();
            while(rs.next()){
                 rspta=rs.getInt("counter");
             }
        } catch(SQLException e){    
            System.out.println(e);
        }
        return rspta;
    }
 
}
