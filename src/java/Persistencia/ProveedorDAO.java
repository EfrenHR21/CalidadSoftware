
package Persistencia;

import Negocio.Proveedor;
import config.ConexionBD;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ProveedorDAO {
    ConexionBD cn = new ConexionBD();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    int rspta=0;
    
    public List mostrarDatosProv(){
        ArrayList<Proveedor> list2 = new ArrayList();
        String sqlv4="select * from proveedores";
        try{
            con= ConexionBD.conectar();
            ps=con.prepareStatement(sqlv4);
            rs=ps.executeQuery();
            while(rs.next()){
                 Proveedor prov = new Proveedor();
                 prov.setIdProv(rs.getString("idProv"));
                 prov.setNombreProv(rs.getString("nombreProv"));
                 prov.setCorreo(rs.getString("correo"));
                 prov.setRUC(rs.getString("RUC"));
                 prov.setTelefono(rs.getString("telefono"));
                 prov.setDireccion(rs.getString("direccion"));
                 prov.setCOD_admin(rs.getString("COD_admin"));
                 list2.add(prov);
             }
        } catch(SQLException e){    
            System.out.println(e);
        }
        return list2;
    }
    
    public int ContarDatosProv(){
        String sqlvP="select COUNT(idProv) as cantidad from proveedores";
        try{
            con= ConexionBD.conectar();
            ps=con.prepareStatement(sqlvP);
            rs=ps.executeQuery();
            while(rs.next()){
                rspta=rs.getInt("cantidad");
            }
        } catch(SQLException e){
            System.out.println(e);
        }
        return rspta;
    }
    
    public int insertarProveedor(Proveedor prov){
        int res = 0;
        String sqlIE="INSERT INTO proveedores(nombreProv,correo,RUC,telefono,direccion) VALUES (?,?,?,?,?)";
        try{
            con= ConexionBD.conectar();
            ps=con.prepareStatement(sqlIE);
            ps.setString(1, prov.getNombreProv());
            ps.setString(2, prov.getCorreo());
            ps.setString(3, prov.getRUC());
            ps.setString(4, prov.getTelefono());
            ps.setString(5, prov.getDireccion());
            res = ps.executeUpdate();
            
        } catch (SQLException e){
            System.out.println(e);
        }
        return res;
    }
    
    public List editarProveedor(String id){
        ArrayList<Proveedor> list = new ArrayList();
        String sqlPv="select * from proveedores where idProv=?";
        try{
            con= ConexionBD.conectar();
            ps=con.prepareStatement(sqlPv);
            ps.setString(1, id);
            rs=ps.executeQuery();
            while(rs.next()){
                 Proveedor prov = new Proveedor();
                 prov.setIdProv(rs.getString("idProv"));
                 prov.setNombreProv(rs.getString("nombreProv"));
                 prov.setCorreo(rs.getString("correo"));
                 prov.setRUC(rs.getString("RUC"));
                 prov.setTelefono(rs.getString("telefono"));
                 prov.setDireccion(rs.getString("direccion"));
                 prov.setCOD_admin(rs.getString("COD_admin"));
                 list.add(prov);
             }
        } catch(SQLException e){    
            System.out.println(e);
        }
        return list;
    }
    
    public int actualizarProveedor(Proveedor prov){
        int res = 0;
        String sqlAt="UPDATE proveedores set nombreProv=?, correo=?, RUC=?, telefono=?, direccion=? WHERE idProv=?";
        try{
            con= ConexionBD.conectar();
            ps=con.prepareStatement(sqlAt);
            ps.setString(1, prov.getNombreProv());
            ps.setString(2, prov.getCorreo());
            ps.setString(3, prov.getRUC());
            ps.setString(4, prov.getTelefono());
            ps.setString(5, prov.getDireccion());
            ps.setString(6, prov.getIdProv());
            res = ps.executeUpdate();
            
        } catch (SQLException e){
            System.out.println(e);
        }
        return res;
    }
    public int eliminarTrabajador(String id){
        int res = 0;
        String sqlElt="DELETE FROM proveedores WHERE idProv=?";
        try{
            con= ConexionBD.conectar();
            ps=con.prepareStatement(sqlElt);
            ps.setString(1, id);
            res = ps.executeUpdate();
            
        } catch (SQLException e){
            System.out.println(e);
        }
        return res;
    }
}
