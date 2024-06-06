
package Persistencia;

import Negocio.Cliente;
import config.ConexionBD;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ClienteDAO {
    ConexionBD cn = new ConexionBD();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    int rspta=0;
    
    public Cliente loginCliente(String correo, String contra){
        Cliente cli = new Cliente();
        String sql="select * from clientes inner join distrito on clientes.distritos = distrito.IdDistrito where correo=? and contra=?";
        try{
             con= ConexionBD.conectar();
             ps=con.prepareStatement(sql);
             ps.setString(1, correo);
             ps.setString(2, contra);
             rs=ps.executeQuery();
             while(rs.next()){
                 cli.setID_cli(rs.getString("ID_cli"));
                 cli.setNom_cli(rs.getString("nom_cli"));
                 cli.setApe_cli(rs.getString("ape_cli"));
                 cli.setCorreo(rs.getString("correo"));
                 cli.setContra(rs.getString("contra"));
                 cli.setEdad(rs.getInt("edad"));
                 cli.setCell_cli(rs.getInt("cell_cli"));
                 cli.setNom_dist(rs.getString("Distrito"));
             }
        } catch (SQLException e){
            System.out.println(e);
        }
        return cli;
    }
    
    public List mostrarDatosCli(){
        ArrayList<Cliente> list = new ArrayList();
        String sqlv6="select * from clientes inner join distrito on clientes.distritos = distrito.IdDistrito";
        try{
            con= ConexionBD.conectar();
            ps=con.prepareStatement(sqlv6);
            rs=ps.executeQuery();
            while(rs.next()){
                 Cliente cli = new Cliente();
                 cli.setID_cli(rs.getString("ID_cli"));
                 cli.setCOD_admin(rs.getString("COD_admin"));
                 cli.setNom_cli(rs.getString("nom_cli"));
                 cli.setApe_cli(rs.getString("ape_cli"));
                 cli.setCorreo(rs.getString("correo"));
                 cli.setContra(rs.getString("contra"));
                 cli.setEdad(rs.getInt("edad"));
                 cli.setCell_cli(rs.getInt("cell_cli"));
                 cli.setDistritos(rs.getString("distritos"));
                 cli.setId_dist(rs.getString("IdDistrito"));
                 cli.setNom_dist(rs.getString("Distrito"));
                 list.add(cli);
             }
        } catch(SQLException e){    
            System.out.println(e);
        }
        return list;
    }
    
    public List mostrarUltimosDatosCli(){
        ArrayList<Cliente> list = new ArrayList();
        String sqlv7="select * from clientes inner join distrito on clientes.distritos = distrito.IdDistrito order by ID_cli desc limit 10";
        try{
            con= ConexionBD.conectar();
            ps=con.prepareStatement(sqlv7);
            rs=ps.executeQuery();
            while(rs.next()){
                 Cliente cli2 = new Cliente();
                 cli2.setID_cli(rs.getString("ID_cli"));
                 cli2.setCOD_admin(rs.getString("COD_admin"));
                 cli2.setNom_cli(rs.getString("nom_cli"));
                 cli2.setApe_cli(rs.getString("ape_cli"));
                 cli2.setCorreo(rs.getString("correo"));
                 cli2.setContra(rs.getString("contra"));
                 cli2.setEdad(rs.getInt("edad"));
                 cli2.setCell_cli(rs.getInt("cell_cli"));
                 cli2.setDistritos(rs.getString("distritos"));
                 cli2.setId_dist(rs.getString("IdDistrito"));
                 cli2.setNom_dist(rs.getString("Distrito"));
                 list.add(cli2);
             }
        } catch(SQLException e){    
            System.out.println(e);
        }
        return list;
    }
    
    public int ContarDatosCli(){
        String sqlCc="select COUNT(ID_cli) as cantidad from clientes";
        try{
            con= ConexionBD.conectar();
            ps=con.prepareStatement(sqlCc);
            rs=ps.executeQuery();
            while(rs.next()){
                rspta=rs.getInt("cantidad");
            }
        } catch(SQLException e){
            System.out.println(e);
        }
        return rspta;
    }

    public List contarEdad(){
        ArrayList<Cliente> list = new ArrayList();
        String sqlv2="SELECT Color, edad, COUNT(*) AS Total FROM clientes inner join distrito on clientes.distritos = distrito.IdDistrito GROUP BY edad HAVING COUNT(*) > 0"; 
        try{
            con= ConexionBD.conectar();
            ps=con.prepareStatement(sqlv2);
            rs=ps.executeQuery();
            while(rs.next()){
                 Cliente cli4 = new Cliente();
                 cli4.setColor_dist(rs.getString("Color"));
                 cli4.setEdad(rs.getInt("edad"));
                 cli4.setContarEdad(rs.getInt("Total"));
                 list.add(cli4);
             }
        } catch(SQLException e){    
            System.out.println(e);
        }
        return list;
    }
    
    public List mostrarDatosDistrito(){
        ArrayList<Cliente> list = new ArrayList();
        String sqlvCt="select * from distrito";
        try{
            con= ConexionBD.conectar();
            ps=con.prepareStatement(sqlvCt);
            rs=ps.executeQuery();
            while(rs.next()){
                 Cliente cli = new Cliente();
                 cli.setId_dist(rs.getString("IdDistrito"));
                 cli.setNom_dist(rs.getString("Distrito"));
                 list.add(cli);
             }
        } catch(SQLException e){    
            System.out.println(e);
        }
        return list;
    }
    
    public List contarDatosDistrito(){
        ArrayList<Cliente> list = new ArrayList();
        String sqlv2="SELECT Color, Distrito, COUNT(*) AS Total FROM clientes inner join distrito on clientes.distritos = distrito.IdDistrito GROUP BY Distrito HAVING COUNT(*) > 0"; 
        try{
            con= ConexionBD.conectar();
            ps=con.prepareStatement(sqlv2);
            rs=ps.executeQuery();
            while(rs.next()){
                 Cliente cli3 = new Cliente();
                 cli3.setColor_dist(rs.getString("Color"));
                 cli3.setNom_dist(rs.getString("Distrito"));
                 cli3.setContarDistrito(rs.getInt("Total"));
                 list.add(cli3);
             }
        } catch(SQLException e){    
            System.out.println(e);
        }
        return list;
    }
    
    public int insertarCliente(Cliente cli){
        int res = 0;
        String sqlIE="INSERT INTO clientes(nom_cli,ape_cli,correo,contra,edad,cell_cli,distritos) VALUES (?,?,?,?,?,?,?)";
        try{
            con= ConexionBD.conectar();
            ps=con.prepareStatement(sqlIE);
            ps.setString(1, cli.getNom_cli() );
            ps.setString(2, cli.getApe_cli());
            ps.setString(3, cli.getCorreo());
            ps.setString(4, cli.getContra());
            ps.setInt(5, cli.getEdad());
            ps.setInt(6, cli.getCell_cli());
            ps.setString(7, cli.getDistritos());
            res = ps.executeUpdate();
            
        } catch (SQLException e){
            System.out.println(e);
        }
        return res;
    }
    
    public List editarCliente(String id){
        ArrayList<Cliente> list = new ArrayList();
        String sqlEc="select * from clientes inner join distrito on clientes.distritos = distrito.IdDistrito where ID_cli=?";
        try{
            con= ConexionBD.conectar();
            ps=con.prepareStatement(sqlEc);
            ps.setString(1, id);
            rs=ps.executeQuery();
            while(rs.next()){
                 Cliente cli2 = new Cliente();
                 cli2.setID_cli(rs.getString("ID_cli"));
                 cli2.setCOD_admin(rs.getString("COD_admin"));
                 cli2.setNom_cli(rs.getString("nom_cli"));
                 cli2.setApe_cli(rs.getString("ape_cli"));
                 cli2.setCorreo(rs.getString("correo"));
                 cli2.setContra(rs.getString("contra"));
                 cli2.setEdad(rs.getInt("edad"));
                 cli2.setCell_cli(rs.getInt("cell_cli"));
                 cli2.setDistritos(rs.getString("distritos"));
                 cli2.setId_dist(rs.getString("IdDistrito"));
                 cli2.setNom_dist(rs.getString("Distrito"));
                 list.add(cli2);
             }
        } catch(SQLException e){    
            System.out.println(e);
        }
        return list;
    }
    
    public int actualizarCliente(Cliente cli){
        int res = 0;
        String sqlAC="UPDATE clientes set nom_cli=?, ape_cli=?, correo=?, contra=?, edad=?, cell_cli=?, distritos=? WHERE ID_cli=?";
        try{
            con= ConexionBD.conectar();
            ps=con.prepareStatement(sqlAC);
            ps.setString(1, cli.getNom_cli());
            ps.setString(2, cli.getApe_cli());
            ps.setString(3, cli.getCorreo());
            ps.setString(4, cli.getContra());
            ps.setInt(5, cli.getEdad());
            ps.setInt(6, cli.getCell_cli());
            ps.setString(7, cli.getDistritos());
            ps.setString(8, cli.getID_cli());
            res = ps.executeUpdate();
            
        } catch (SQLException e){
            System.out.println(e);
        }
        return res;
    }
    
    public int eliminarArticulo(String id){
        int res = 0;
        String sqlEla="DELETE FROM clientes WHERE ID_cli=?";
        try{
            con= ConexionBD.conectar();
            ps=con.prepareStatement(sqlEla);
            ps.setString(1, id);
            res = ps.executeUpdate();
            
        } catch (SQLException e){
            System.out.println(e);
        }
        return res;
    }
    
}
