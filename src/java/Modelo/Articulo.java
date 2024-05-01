
package Modelo;

public class Articulo {
    private String ID_Articulo, COD_admin, nom_articulo, cantidad, Encargado, precioA, Proveedor, Cproducto, ID_cat, nombre_cat, color;
    private double sumaCosto;
    private int vecesCompra,contarCateg;

    public Articulo() {
    }
    
    public Articulo(String ID_Articulo, String nom_articulo, String cantidad, String Encargado, String precioA, String Proveedor, String Cproducto) {
        this.ID_Articulo = ID_Articulo;
        this.nom_articulo = nom_articulo;
        this.cantidad = cantidad;
        this.Encargado = Encargado;
        this.precioA = precioA;
        this.Proveedor = Proveedor;
        this.Cproducto = Cproducto;
    }
    
    public Articulo(String nom_articulo, String cantidad, String Encargado, String precioA, String Proveedor, String Cproducto) {
        this.nom_articulo = nom_articulo;
        this.cantidad = cantidad;
        this.Encargado = Encargado;
        this.precioA = precioA;
        this.Proveedor = Proveedor;
        this.Cproducto = Cproducto;
    }
    
    public String getID_Articulo() {
        return ID_Articulo;
    }

    public void setID_Articulo(String ID_Articulo) {
        this.ID_Articulo = ID_Articulo;
    }

    public String getCOD_admin() {
        return COD_admin;
    }

    public void setCOD_admin(String COD_admin) {
        this.COD_admin = COD_admin;
    }

    public String getNom_articulo() {
        return nom_articulo;
    }

    public void setNom_articulo(String nom_articulo) {
        this.nom_articulo = nom_articulo;
    }

    public String getCantidad() {
        return cantidad;
    }

    public void setCantidad(String cantidad) {
        this.cantidad = cantidad;
    }

    public String getEncargado() {
        return Encargado;
    }

    public void setEncargado(String Encargado) {
        this.Encargado = Encargado;
    }

    public String getPrecioA() {
        return precioA;
    }

    public void setPrecioA(String precioA) {
        this.precioA = precioA;
    }

    public String getProveedor() {
        return Proveedor;
    }

    public void setProveedor(String Proveedor) {
        this.Proveedor = Proveedor;
    }

    public String getCproducto() {
        return Cproducto;
    }

    public void setCproducto(String Cproducto) {
        this.Cproducto = Cproducto;
    }

    public String getID_cat() {
        return ID_cat;
    }

    public void setID_cat(String ID_cat) {
        this.ID_cat = ID_cat;
    }

    public String getNombre_cat() {
        return nombre_cat;
    }

    public void setNombre_cat(String nombre_cat) {
        this.nombre_cat = nombre_cat;
    }

    public double getSumaCosto() {
        return sumaCosto;
    }

    public void setSumaCosto(double sumaCosto) {
        this.sumaCosto = sumaCosto;
    }

    public int getVecesCompra() {
        return vecesCompra;
    }

    public void setVecesCompra(int vecesCompra) {
        this.vecesCompra = vecesCompra;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public int getContarCateg() {
        return contarCateg;
    }

    public void setContarCateg(int contarCateg) {
        this.contarCateg = contarCateg;
    }

}
