package Modelo;

import java.io.InputStream;

public class Detalle_CompraA {
    private int idCompras;
    private String idCliente;
    private int idPlato; 
    private String nombrePlato;
    private int cantidad;
    private double precioCompra;
    private String estado;
    private InputStream imagen;

    public Detalle_CompraA() {
    }

    public Detalle_CompraA(int idCompras, String idCliente, int idPlato, String nombrePlato, int cantidad, double precioCompra, String estado, InputStream imagen) {
        this.idCompras = idCompras;
        this.idCliente = idCliente;
        this.idPlato = idPlato;
        this.nombrePlato = nombrePlato;
        this.cantidad = cantidad;
        this.precioCompra = precioCompra;
        this.estado = estado;
        this.imagen = imagen;
    }

    public int getIdCompras() {
        return idCompras;
    }

    public void setIdCompras(int idCompras) {
        this.idCompras = idCompras;
    }

    public String getIdCliente() {
        return idCliente;
    }

    public void setIdCliente(String idCliente) {
        this.idCliente = idCliente;
    }

    public int getIdPlato() {
        return idPlato;
    }

    public void setIdPlato(int idPlato) {
        this.idPlato = idPlato;
    }

    public String getNombrePlato() {
        return nombrePlato;
    }

    public void setNombrePlato(String nombrePlato) {
        this.nombrePlato = nombrePlato;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

    public double getPrecioCompra() {
        return precioCompra;
    }

    public void setPrecioCompra(double precioCompra) {
        this.precioCompra = precioCompra;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public InputStream getImagen() {
        return imagen;
    }

    public void setImagen(InputStream imagen) {
        this.imagen = imagen;
    }
    
}
