
package DAO;

import Modelo.Carrito;
import Modelo.Compra;
import Modelo.Detalle_CompraA;
import config.ConexionBD;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CompraDAO {
    
    ConexionBD cn = new ConexionBD();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    int r=0;
    
    public int GenerarCompra(Compra compra){
        int idcompras;
        String sql="insert into compras(idCliente,FechaCompras,Monto,Estado)values(?,?,?,?)";
        try {
            con= ConexionBD.conectar();
            ps=con.prepareStatement(sql);
            ps.setString(1, compra.getCliente().getID_cli());
            ps.setString(2, compra.getFecha());
            ps.setDouble(3, compra.getMonto());
            ps.setString(4, compra.getEstado());
            r=ps.executeUpdate();
            
            sql="Select @@IDENTITY AS idCompras";
            rs=ps.executeQuery(sql);
            rs.next();
            idcompras=rs.getInt("idCompras");
            rs.close();
            
            for(Carrito detalle : compra.getDetallecompras()){
                sql="insert into detalle_compras(idProducto,idCompras,Cantidad,PrecioCompra)values(?,?,?,?)";
                ps=con.prepareStatement(sql);
                ps.setInt(1, detalle.getIdProducto());
                ps.setInt(2, idcompras);
                ps.setInt(3, detalle.getCantidad());
                ps.setDouble(4, detalle.getPrecioCompra());
                r=ps.executeUpdate();
            }
            
        } catch (Exception e) {
        }
        return r;
    }
    
    public List mostrarCompraCliente(String id){
        ArrayList<Compra> list = new ArrayList();
        String sql="SELECT * FROM compras WHERE idCliente=?";
        try{
            con= ConexionBD.conectar();
            ps=con.prepareStatement(sql);
            ps.setString(1, id);
            rs=ps.executeQuery();
            while(rs.next()){
                 Compra com = new Compra();
                 com.setId(rs.getInt("idCompras"));
                 com.setFecha(rs.getString("FechaCompras"));
                 com.setMonto(rs.getDouble("Monto"));
                 com.setEstado(rs.getString("Estado"));
                 list.add(com);
             }
        } catch(SQLException e){    
            System.out.println(e);
        }
        return list;
    }
    
    public List mostrarDetalleCliente(String id){
        ArrayList<Detalle_CompraA> list = new ArrayList();
        String sql="SELECT c.idCompras, c.idCliente, p.CodigoProducto, p.nombre, dt.Cantidad, dt.PrecioCompra, c.Estado, p.imagen "
                + "FROM detalle_compras dt "
                + "inner join compras c on dt.idCompras = c.idCompras "
                + "inner join productos p on dt.idProducto = p.CodigoProducto where c.idCliente=?";
        try{
            con= ConexionBD.conectar();
            ps=con.prepareStatement(sql);
            ps.setString(1, id);
            rs=ps.executeQuery();
            while(rs.next()){
                Detalle_CompraA dt = new Detalle_CompraA();
                dt.setIdCompras(rs.getInt("idCompras"));
                dt.setIdCliente(rs.getString("idCliente"));
                dt.setIdPlato(rs.getInt("CodigoProducto"));
                dt.setNombrePlato(rs.getString("nombre"));
                dt.setCantidad(rs.getInt("Cantidad"));
                dt.setPrecioCompra(rs.getDouble("PrecioCompra"));
                dt.setEstado(rs.getString("Estado"));
                dt.setImagen(rs.getBinaryStream("imagen"));
                list.add(dt);
             }
        } catch(SQLException e){    
            System.out.println(e);
        }
        return list;
    }
    
    public List mostrarCompraTodo(){
        ArrayList<Detalle_CompraA> list = new ArrayList();
        String sql="SELECT c.idCompras, c.idCliente, p.CodigoProducto, p.nombre, dt.Cantidad, dt.PrecioCompra, c.Estado, p.imagen, v.Fecha " +
"                 FROM detalle_compras dt " +
"                 inner join compras c on dt.idCompras = c.idCompras " +
"                 inner join productos p on dt.idProducto = p.CodigoProducto" +
"                 inner join venta v on v.fecha = v.Fecha";
        try{
            con= ConexionBD.conectar();
            ps=con.prepareStatement(sql);
            rs=ps.executeQuery();
            while(rs.next()){
                Detalle_CompraA dt = new Detalle_CompraA();
                dt.setIdCompras(rs.getInt("idCompras"));
                dt.setIdCliente(rs.getString("idCliente"));
                dt.setIdPlato(rs.getInt("CodigoProducto"));
                dt.setNombrePlato(rs.getString("nombre"));
                dt.setCantidad(rs.getInt("Cantidad"));
                dt.setPrecioCompra(rs.getDouble("PrecioCompra"));
                dt.setEstado(rs.getString("Estado"));
                dt.setImagen(rs.getBinaryStream("imagen"));
                dt.setFecha(rs.getString("Fecha"));
                list.add(dt);
             }
        } catch(SQLException e){    
            System.out.println(e);
        }
        return list;
    }
}
