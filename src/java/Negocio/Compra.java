package Negocio;

import java.io.InputStream;
import java.util.List;

public class Compra {

    private int id;
    private Cliente cliente;
    private String fecha;
    private Double monto;
    private String estado;
    private InputStream imagen;
    private List<Carrito> detallecompras;

    // Constructor por defecto
    public Compra() {
    }

    // Constructor con parámetros sin imagen
    public Compra(Cliente cliente, String fecha, Double monto, String estado, List<Carrito> detallecompras) {
        this.cliente = cliente;
        this.fecha = fecha;
        this.monto = monto;
        this.estado = estado;
        this.detallecompras = detallecompras;
    }

    // Constructor con todos los parámetros, incluyendo la imagen
    public Compra(Cliente cliente, String fecha, Double monto, String estado, List<Carrito> detallecompras, InputStream imagen) {
        this.cliente = cliente;
        this.fecha = fecha;
        this.monto = monto;
        this.estado = estado;
        this.detallecompras = detallecompras;
        this.imagen = imagen;
    }

    // Getters y setters...
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Cliente getCliente() {
        return cliente;
    }

    public void setCliente(Cliente cliente) {
        this.cliente = cliente;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public Double getMonto() {
        return monto;
    }

    public void setMonto(Double monto) {
        this.monto = monto;
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

    public List<Carrito> getDetallecompras() {
        return detallecompras;
    }

    public void setDetallecompras(List<Carrito> detallecompras) {
        this.detallecompras = detallecompras;
    }
}
