package Persistencia;

import Negocio.Compra;
import Negocio.Carrito;
import Negocio.Detalle_CompraA;
import config.ConexionBD;
import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.*;
import java.util.*;
import javax.servlet.http.HttpServletResponse;

public class CompraDAO {

    ConexionBD cn = new ConexionBD();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    int r = 0;

    public int GenerarCompra(Compra compra, InputStream fileContent) {
        int idcompras = 0;
        String sql = "INSERT INTO compras(idCliente, FechaCompras, Monto, Estado, Imagen) VALUES (?, ?, ?, ?, ?)";
        try {
            con = ConexionBD.conectar();
            ps = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            ps.setString(1, compra.getCliente().getID_cli());
            ps.setString(2, compra.getFecha());
            ps.setDouble(3, compra.getMonto());
            ps.setString(4, compra.getEstado());
            ps.setBlob(5, compra.getImagen());
            ps.executeUpdate();

            rs = ps.getGeneratedKeys();
            if (rs.next()) {
                idcompras = rs.getInt(1);
            }
            rs.close();

            for (Carrito detalle : compra.getDetallecompras()) {
                sql = "INSERT INTO detalle_compras(idProducto, idCompras, Cantidad, PrecioCompra) VALUES (?, ?, ?, ?)";
                ps = con.prepareStatement(sql);
                ps.setInt(1, detalle.getIdProducto());
                ps.setInt(2, idcompras);
                ps.setInt(3, detalle.getCantidad());
                ps.setDouble(4, detalle.getPrecioCompra());
                ps.executeUpdate();
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (ps != null) {
                    ps.close();
                }
                if (con != null) {
                    con.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return idcompras;
    }

    public List mostrarCompraCliente(String id) {
        ArrayList<Compra> list = new ArrayList();
        String sql = "SELECT * FROM compras WHERE idCliente=?";
        try {
            con = ConexionBD.conectar();
            ps = con.prepareStatement(sql);
            ps.setString(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                Compra com = new Compra();
                com.setId(rs.getInt("idCompras"));
                com.setFecha(rs.getString("FechaCompras"));
                com.setMonto(rs.getDouble("Monto"));
                com.setEstado(rs.getString("Estado"));
                com.setImagen(rs.getBinaryStream("imagen"));
                list.add(com);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List mostrarDetalleCliente(String id) {
        ArrayList<Detalle_CompraA> list = new ArrayList();
        String sql = "SELECT c.idCompras, c.idCliente, p.CodigoProducto, p.nombre, dt.Cantidad, dt.PrecioCompra, c.Estado, p.imagen "
                + "FROM detalle_compras dt "
                + "inner join compras c on dt.idCompras = c.idCompras "
                + "inner join productos p on dt.idProducto = p.CodigoProducto where c.idCliente=?";
        try {
            con = ConexionBD.conectar();
            ps = con.prepareStatement(sql);
            ps.setString(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
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
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List mostrarCompraTodo() {
        ArrayList<Detalle_CompraA> list = new ArrayList();
        String sql = "SELECT c.idCompras, c.idCliente, p.CodigoProducto, p.nombre, dt.Cantidad, dt.PrecioCompra, c.Estado, p.imagen, v.FechaCompras "
                + "                 FROM detalle_compras dt "
                + "                 inner join compras c on dt.idCompras = c.idCompras "
                + "                 inner join productos p on dt.idProducto = p.CodigoProducto"
                + "                 inner join compras v on v.fechaCompras = v.FechaCompras";
        try {
            con = ConexionBD.conectar();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Detalle_CompraA dt = new Detalle_CompraA();
                dt.setIdCompras(rs.getInt("idCompras"));
                dt.setIdCliente(rs.getString("idCliente"));
                dt.setIdPlato(rs.getInt("CodigoProducto"));
                dt.setNombrePlato(rs.getString("nombre"));
                dt.setCantidad(rs.getInt("Cantidad"));
                dt.setPrecioCompra(rs.getDouble("PrecioCompra"));
                dt.setEstado(rs.getString("Estado"));
                dt.setImagen(rs.getBinaryStream("imagen"));
                dt.setFecha(rs.getString("fechaCompras"));
                list.add(dt);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }
}
