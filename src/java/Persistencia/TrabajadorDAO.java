package Persistencia;

import Negocio.Trabajador;
import config.ConexionBD;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class TrabajadorDAO {
    ConexionBD cn = new ConexionBD();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    int rspta=0;


//Encriptación de contraseña    
    public String getMD5(String input){
        if (input!=null){
        try{
            MessageDigest md = MessageDigest.getInstance("MD5");
            byte[] encBytes = md.digest(input.getBytes("utf-8"));
            BigInteger numero = new BigInteger(1, encBytes);
            String encString = numero.toString(16);
            while (encString.length()<32){
                encString = "0" + encString;
            }
            return encString;
        }catch (Exception e){
            throw new RuntimeException(e);
        }
        }else{
            return "nothing";
        }
    }
    
    public Trabajador loginTrabajador(String correo, String contra){
        Trabajador tra = new Trabajador();
        String encpass = getMD5(contra);
        String sql="select * from trabajadores inner join cargo on trabajadores.cargo_trab = cargo.ID_cargo where correo=? and contra=?";
        try{
            con= ConexionBD.conectar();
            ps=con.prepareStatement(sql);
            ps.setString(1, correo);
            ps.setString(2, encpass);
            rs=ps.executeQuery();
            while(rs.next()){
                tra.setNom_trab(rs.getString("nom_trab"));
                tra.setCorreo(rs.getString("correo"));
                tra.setContra(contra);
                tra.setNombre_cargo(rs.getString("nombre_cargo"));
                tra.setCargo_trab(rs.getString("cargo_trab"));
             }
        } catch (SQLException e){
            System.out.println(e);
        }
        return tra;
    }
        
    public List mostrarDatosCargo(){
        ArrayList<Trabajador> list = new ArrayList();
        String sqlv2="select * from cargo";
        try{
            con= ConexionBD.conectar();
            ps=con.prepareStatement(sqlv2);
            rs=ps.executeQuery();
            while(rs.next()){
                 Trabajador tra4 = new Trabajador();
                 tra4.setID_cargo(rs.getString("ID_cargo"));
                 tra4.setNombre_cargo(rs.getString("nombre_cargo"));
                 list.add(tra4);
             }
        } catch(SQLException e){    
            System.out.println(e);
        }
        return list;
    }
    
    public List contarDatosCargo(){
        ArrayList<Trabajador> list = new ArrayList();
        String sqlv2="SELECT nombre_cargo, COUNT(*) AS Total FROM trabajadores inner join cargo on trabajadores.cargo_trab = cargo.ID_cargo GROUP BY nombre_cargo HAVING COUNT(*) > 1"; 
        try{
            con= ConexionBD.conectar();
            ps=con.prepareStatement(sqlv2);
            rs=ps.executeQuery();
            while(rs.next()){
                 Trabajador tra4 = new Trabajador();
                 tra4.setNombre_cargo(rs.getString("nombre_cargo"));
                 tra4.setContarCargo(rs.getInt("Total"));
                 list.add(tra4);
             }
        } catch(SQLException e){    
            System.out.println(e);
        }
        return list;
    }
    
    public List mostrarDatosEmp(){
        ArrayList<Trabajador> list = new ArrayList();
        String sqlv2="select * from trabajadores inner join cargo on trabajadores.cargo_trab = cargo.ID_cargo";
        try{
            con= ConexionBD.conectar();
            ps=con.prepareStatement(sqlv2);
            rs=ps.executeQuery();
            while(rs.next()){
                 Trabajador tra2 = new Trabajador();
                 tra2.setID_trab(rs.getString("ID_trab"));
                 tra2.setNom_trab(rs.getString("nom_trab"));
                 tra2.setApe_trab(rs.getString("ape_trab"));
                 tra2.setCorreo(rs.getString("correo"));
                 tra2.setContra(rs.getString("contra"));
                 tra2.setDni_trab(rs.getInt("dni_trab"));
                 tra2.setNumero_trab(rs.getInt("numero_trab"));
                 tra2.setCargo_trab(rs.getString("cargo_trab"));
                 tra2.setID_cargo(rs.getString("ID_cargo"));
                 tra2.setNombre_cargo(rs.getString("nombre_cargo"));
                 list.add(tra2);
             }
        } catch(SQLException e){    
            System.out.println(e);
        }
        return list;
    }
    
    public List mostrarUltimosDatosEmp(){
        ArrayList<Trabajador> list = new ArrayList();
        String sqlv3="select * from trabajadores inner join cargo on trabajadores.cargo_trab = cargo.ID_cargo order by ID_trab desc limit 10;";
        try{
            con= ConexionBD.conectar();
            ps=con.prepareStatement(sqlv3);
            rs=ps.executeQuery();
            while(rs.next()){
                 Trabajador tra2 = new Trabajador();
                 tra2.setID_trab(rs.getString("ID_trab"));
                 tra2.setNom_trab(rs.getString("nom_trab"));
                 tra2.setApe_trab(rs.getString("ape_trab"));
                 tra2.setCorreo(rs.getString("correo"));
                 tra2.setContra(rs.getString("contra"));
                 tra2.setDni_trab(rs.getInt("dni_trab"));
                 tra2.setNumero_trab(rs.getInt("numero_trab"));
                 tra2.setCargo_trab(rs.getString("cargo_trab"));
                 tra2.setNombre_cargo(rs.getString("nombre_cargo"));
                 list.add(tra2);
             }
        } catch(SQLException e){    
            System.out.println(e);
        }
        return list;
    }
    
    public int ContarDatosEmp(){
        String sqlvE="select COUNT(ID_trab) as cantidad from trabajadores";
        try{
            con= ConexionBD.conectar();
            ps=con.prepareStatement(sqlvE);
            rs=ps.executeQuery();
            while(rs.next()){
                rspta=rs.getInt("cantidad");
            }
        } catch(SQLException e){
            System.out.println(e);
        }
        return rspta;
    }
    
    public int insertarTrabajador(Trabajador trab){
        int res = 0;
        String sqlIE="INSERT INTO trabajadores(nom_trab,ape_trab,correo,contra,dni_trab,numero_trab,cargo_trab) VALUES (?,?,?,?,?,?,?)";
        try{
            String encpass = getMD5(trab.getContra());
            con= ConexionBD.conectar();
            ps=con.prepareStatement(sqlIE);
            ps.setString(1, trab.getNom_trab());
            ps.setString(2, trab.getApe_trab());
            ps.setString(3, trab.getCorreo());
            ps.setString(4, encpass);
            ps.setInt(5, trab.getDni_trab());
            ps.setInt(6, trab.getNumero_trab());
            ps.setString(7, trab.getCargo_trab());
            res = ps.executeUpdate();
            
        } catch (SQLException e){
            System.out.println(e);
        }
        return res;
    }
    
    public List editarTrabajador(String id){
        ArrayList<Trabajador> list = new ArrayList();
        String sqlEt="select * from trabajadores inner join cargo on trabajadores.cargo_trab = cargo.ID_cargo where ID_trab=?";
        try{
            con= ConexionBD.conectar();
            ps=con.prepareStatement(sqlEt);
            ps.setString(1, id);
            rs=ps.executeQuery();
            while(rs.next()){
                 Trabajador tra2 = new Trabajador();
                 tra2.setID_trab(rs.getString("ID_trab"));
                 tra2.setNom_trab(rs.getString("nom_trab"));
                 tra2.setApe_trab(rs.getString("ape_trab"));
                 tra2.setCorreo(rs.getString("correo"));
                 tra2.setContra(rs.getString("contra"));
                 tra2.setDni_trab(rs.getInt("dni_trab"));
                 tra2.setNumero_trab(rs.getInt("numero_trab"));
                 tra2.setCargo_trab(rs.getString("cargo_trab"));
                 tra2.setID_cargo(rs.getString("ID_cargo"));
                 tra2.setNombre_cargo(rs.getString("nombre_cargo"));
                 list.add(tra2);
             }
        } catch(SQLException e){    
            System.out.println(e);
        }
        return list;
    }
    
    public int actualizarTrabajador(Trabajador trab){
        int res = 0;
        String sqlAt="UPDATE trabajadores set nom_trab=?, ape_trab=?, correo=?, contra=?, dni_trab=?, numero_trab=?, cargo_trab=? WHERE ID_trab=?";
        try{
            con= ConexionBD.conectar();
            String encpass = getMD5(trab.getContra());
            ps=con.prepareStatement(sqlAt);
            ps.setString(1, trab.getNom_trab());
            ps.setString(2, trab.getApe_trab());
            ps.setString(3, trab.getCorreo());
            ps.setString(4, encpass);
            ps.setInt(5, trab.getDni_trab());
            ps.setInt(6, trab.getNumero_trab());
            ps.setString(7, trab.getCargo_trab());
            ps.setString(8, trab.getID_trab());
            res = ps.executeUpdate();
            
        } catch (SQLException e){
            System.out.println(e);
        }
        return res;
    }
    public int eliminarTrabajador(Trabajador trab){
        int res = 0;
        String sqlElt="DELETE FROM trabajadores WHERE ID_trab=?";
        try{
            con= ConexionBD.conectar();
            ps=con.prepareStatement(sqlElt);
            ps.setString(1, trab.getID_trab());
            res = ps.executeUpdate();
            
        } catch (SQLException e){
            System.out.println(e);
        }
        return res;
    }
    
}

