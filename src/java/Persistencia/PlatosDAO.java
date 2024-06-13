
package Persistencia;

import Negocio.Platos;
import config.ConexionBD;
import java.io.*;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletResponse;

public class PlatosDAO {
    ConexionBD cn = new ConexionBD();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    int rspta=0;
     
    public List mostrarDatosPla(){
        List<Platos> list = new ArrayList();
        String sqlv8="select * from productos";
        try{
            con= ConexionBD.conectar();
            ps=con.prepareStatement(sqlv8);
            rs=ps.executeQuery();
            while(rs.next()){
                 Platos pla = new Platos();
                 pla.setId(rs.getInt("CodigoProducto"));
                 pla.setNombre(rs.getString("nombre"));
                 pla.setPrecio(rs.getDouble("precio"));
                 pla.setDescripcion(rs.getString("descripcion"));
                 pla.setImagen(rs.getBinaryStream("imagen"));
                 list.add(pla);
             }
        } catch(SQLException e){    
            System.out.println(e);
        }
        return list;
    }
    
    //codigo de productos
    public void mostrarImg(int id, HttpServletResponse response) throws IOException{
        String sqlmI = "select * from productos where CodigoProducto="+id;
        InputStream inputStream=null;
        OutputStream outputStream=null;
        BufferedInputStream bufferedInputStream=null;
        BufferedOutputStream bufferedOutputStream=null;
        response.setContentType("/image/*");
        try {
            outputStream=response.getOutputStream();
            con= ConexionBD.conectar();
            ps=con.prepareStatement(sqlmI);
            rs=ps.executeQuery();
            if(rs.next()){
                inputStream=rs.getBinaryStream("imagen"); 
            }
            bufferedInputStream=new BufferedInputStream(inputStream);
            bufferedOutputStream=new BufferedOutputStream(outputStream);
            
            int i=0;
            while((i=bufferedInputStream.read())!=-1){
                bufferedOutputStream.write(i);
                outputStream = response.getOutputStream();             
            }
            bufferedInputStream.close();
            bufferedOutputStream.close();
            inputStream.close();
            outputStream.close();
        } catch (SQLException e) {
        }
    }
    
    //cantidad de productos registrados
    public int ContarDatosPla(){
        String sqlvP="select COUNT(CodigoProducto) as cantidad from productos";
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
    
    //ingresar nuevo producto
    public int insertarPlatos(Platos pla){
        int res = 0;
        String sqlIE="INSERT INTO productos(nombre,precio,descripcion,imagen) VALUES (?,?,?,?)";
        try{
            con= ConexionBD.conectar();
            ps=con.prepareStatement(sqlIE);
            ps.setString(1, pla.getNombre());
            ps.setDouble(2, pla.getPrecio());
            ps.setString(3, pla.getDescripcion());
            ps.setBlob(4, pla.getImagen());
            res = ps.executeUpdate();
            
        } catch (SQLException e){
            System.out.println(e);
        }
        return res;
    }
   
    public List editarPlatos(String id){
        ArrayList<Platos> list = new ArrayList();
        String sqlEp="select * from productos where CodigoProducto=?";
        try{
            con= ConexionBD.conectar();
            ps=con.prepareStatement(sqlEp);
            ps.setString(1, id);
            rs=ps.executeQuery();
            while(rs.next()){
                 Platos pla = new Platos();
                 pla.setId(rs.getInt("CodigoProducto"));
                 pla.setNombre(rs.getString("nombre"));
                 pla.setPrecio(rs.getDouble("precio"));
                 pla.setDescripcion(rs.getString("descripcion"));
                 pla.setImagen(rs.getBinaryStream("imagen"));
                 list.add(pla);
             }
        } catch(SQLException e){    
            System.out.println(e);
        }
        return list;
    }
    
    public int actualizarPlato(Platos pla){
        int res = 0;
        String sqlAp="UPDATE productos set nombre=?, precio=?, descripcion=?, imagen=? WHERE CodigoProducto=?";
        try{
            con= ConexionBD.conectar();
            ps=con.prepareStatement(sqlAp);
            ps.setString(1, pla.getNombre());
            ps.setDouble(2, pla.getPrecio());
            ps.setString(3, pla.getDescripcion());
            ps.setBlob(4, pla.getImagen());
            ps.setInt(5, pla.getId());
            res = ps.executeUpdate();
            
        } catch (SQLException e){
            System.out.println(e);
        }
        return res;
    }
    
    public int eliminarPlato(String id){
        int res = 0;
        String sqlElp="DELETE FROM productos WHERE CodigoProducto=?";
        try{
            con= ConexionBD.conectar();
            ps=con.prepareStatement(sqlElp);
            ps.setString(1, id);
            res = ps.executeUpdate();
            
        } catch (SQLException e){
            System.out.println(e);
        }
        return res;
    }
    
    public ArrayList<Platos> obtenerProducto(){
        ArrayList<Platos> lista = new ArrayList<Platos>();
        String sql = "select p.codigoProducto,p.nombre,p.precio, p.descripcion ,p.imagen FROM productos p ORDER BY p.nombre";
        try {
            con = ConexionBD.conectar();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
//          CallableStatement cl = ConexionBD.conectar().prepareCall("{call listarProductos}");
            while(rs.next()){
                Platos p = new Platos(rs.getInt(1), rs.getString(2), rs.getDouble(3), rs.getString(4), rs.getBinaryStream(5));
                lista.add(p);
            }
        } catch (SQLException e) {}
        return lista;
    }
    
    public Platos obtenerProducto(int codigo){
        Platos p = null;
        String sql = "select p.CodigoProducto, p.nombre, p.precio, p.descripcion, p.imagen FROM productos p WHERE p.CodigoProducto = ? ORDER BY p.nombre";
        try {
            con = ConexionBD.conectar();
            ps = con.prepareStatement(sql);
            ps.setInt(1, codigo);
            rs = ps.executeQuery();
//          CallableStatement cl = ConexionBD.conectar().prepareCall("{call sp_ProductoCod(?)}");
            while(rs.next()){
                p = new Platos(rs.getInt(1), rs.getString(2), rs.getDouble(3), rs.getString(4), rs.getBinaryStream(5));
            }
        } catch (SQLException e) {}
        return p;
    }
}
