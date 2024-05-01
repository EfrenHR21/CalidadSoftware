
package DAO;

import Modelo.Articulo;
import config.ConexionBD;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ArticuloDAO {
    ConexionBD cn = new ConexionBD();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    int rspta=0;
    
    public List mostrarDatosArt(){
        ArrayList<Articulo> list = new ArrayList();
        String sqlv5="select * from articulo";
        try{
            con= ConexionBD.conectar();
            ps=con.prepareStatement(sqlv5);
            rs=ps.executeQuery();
            while(rs.next()){
                 Articulo art = new Articulo();
                 art.setID_Articulo(rs.getString("ID_Articulo"));
                 art.setCOD_admin(rs.getString("COD_admin"));
                 art.setNom_articulo(rs.getString("nom_articulo"));
                 art.setCantidad(rs.getString("cantidad"));
                 art.setEncargado(rs.getString("Encargado"));
                 art.setPrecioA(rs.getString("precioA"));
                 art.setProveedor(rs.getString("Proveedor"));
                 art.setCproducto(rs.getString("Cproducto"));
                 list.add(art);
             }
        } catch(SQLException e){    
            System.out.println(e);
        }
        return list;
    }
    
    public int ContarDatosArt(){
        String sqlvP="select COUNT(ID_Articulo) as cantidad from articulo";
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
    
    public List contarCompra(){
        ArrayList<Articulo> list = new ArrayList();
        String sqlv2="SELECT SUM(precioA) AS SumaCosto, Proveedor, COUNT(Proveedor) AS VecesCompra FROM articulo GROUP BY Proveedor HAVING COUNT(*) > 0"; 
        try{
            con= ConexionBD.conectar();
            ps=con.prepareStatement(sqlv2);
            rs=ps.executeQuery();
            while(rs.next()){
                 Articulo arti = new Articulo();
                 arti.setSumaCosto(rs.getDouble("SumaCosto"));
                 arti.setProveedor(rs.getString("Proveedor"));
                 arti.setVecesCompra(rs.getInt("VecesCompra"));
                 list.add(arti);
             }
        } catch(SQLException e){    
            System.out.println(e);
        }
        return list;
    }
    
    public List contarCategoria(){
        ArrayList<Articulo> list = new ArrayList();
        String sqlv2="SELECT Color, Cproducto, COUNT(*) AS Total FROM articulo inner join cproducto on articulo.Cproducto=cproducto.nombre_cat GROUP BY Cproducto HAVING COUNT(*) > 0"; 
        try{
            con= ConexionBD.conectar();
            ps=con.prepareStatement(sqlv2);
            rs=ps.executeQuery();
            while(rs.next()){
                 Articulo arti = new Articulo();
                 arti.setColor(rs.getString("Color"));
                 arti.setCproducto(rs.getString("Cproducto"));
                 arti.setContarCateg(rs.getInt("Total"));
                 list.add(arti);
             }
        } catch(SQLException e){    
            System.out.println(e);
        }
        return list;
    }
    
    public List mostrarDatosCatPro(){
        ArrayList<Articulo> list = new ArrayList();
        String sqlvCt="select * from cproducto";
        try{
            con= ConexionBD.conectar();
            ps=con.prepareStatement(sqlvCt);
            rs=ps.executeQuery();
            while(rs.next()){
                 Articulo art2 = new Articulo();
                 art2.setID_cat(rs.getString("ID_cat"));
                 art2.setNombre_cat(rs.getString("nombre_cat"));
                 list.add(art2);
             }
        } catch(SQLException e){    
            System.out.println(e);
        }
        return list;
    }
    
    public int insertarArticulo(Articulo art){
        int res = 0;
        String sqlIA="INSERT INTO articulo(nom_articulo,cantidad,Encargado,precioA,Proveedor,Cproducto) VALUES (?,?,?,?,?,?)";
        try{
            con= ConexionBD.conectar();
            ps=con.prepareStatement(sqlIA);
            ps.setString(1, art.getNom_articulo());
            ps.setString(2, art.getCantidad());
            ps.setString(3, art.getEncargado());
            ps.setString(4, art.getPrecioA());
            ps.setString(5, art.getProveedor());
            ps.setString(6, art.getCproducto());
            res = ps.executeUpdate();
            
        } catch (SQLException e){
            System.out.println(e);
        }
        return res;
    }
    
    public List editarArticulo(String id){
        ArrayList<Articulo> list = new ArrayList();
        String sqlEa="select * from articulo where ID_Articulo=?";
        try{
            con= ConexionBD.conectar();
            ps=con.prepareStatement(sqlEa);
            ps.setString(1, id);
            rs=ps.executeQuery();
            while(rs.next()){
                 Articulo art = new Articulo();
                 art.setID_Articulo(rs.getString("ID_Articulo"));
                 art.setCOD_admin(rs.getString("COD_admin"));
                 art.setNom_articulo(rs.getString("nom_articulo"));
                 art.setCantidad(rs.getString("cantidad"));
                 art.setEncargado(rs.getString("Encargado"));
                 art.setPrecioA(rs.getString("precioA"));
                 art.setProveedor(rs.getString("Proveedor"));
                 art.setCproducto(rs.getString("Cproducto"));
                 list.add(art);
             }
        } catch(SQLException e){    
            System.out.println(e);
        }
        return list;
    }
    
    public int actualizarArticulo(Articulo art){
        int res = 0;
        String sqlAa="UPDATE articulo set nom_articulo=?, cantidad=?, Encargado=?, precioA=?, Proveedor=?, Cproducto=? WHERE ID_Articulo=?";
        try{
            con= ConexionBD.conectar();
            ps=con.prepareStatement(sqlAa);
            ps.setString(1, art.getNom_articulo());
            ps.setString(2, art.getCantidad());
            ps.setString(3, art.getEncargado());
            ps.setString(4, art.getPrecioA());
            ps.setString(5, art.getProveedor());
            ps.setString(6, art.getCproducto());
            ps.setString(7, art.getID_Articulo());
            res = ps.executeUpdate();
            
        } catch (SQLException e){
            System.out.println(e);
        }
        return res;
    }
    
    public int eliminarArticulo(String id){
        int res = 0;
        String sqlElt="DELETE FROM articulo WHERE ID_Articulo=?";
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
