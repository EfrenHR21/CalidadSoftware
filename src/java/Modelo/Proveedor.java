
package Modelo;

public class Proveedor {
    private String idProv, nombreProv, correo, RUC, telefono, direccion, COD_admin;

    public Proveedor() {
    }

    public Proveedor(String idProv, String nombreProv, String correo, String RUC, String telefono, String direccion) {
        this.idProv = idProv;
        this.nombreProv = nombreProv;
        this.correo = correo;
        this.RUC = RUC;
        this.telefono = telefono;
        this.direccion = direccion;
    }

    public Proveedor(String nombreProv, String correo, String RUC, String telefono, String direccion) {
        this.nombreProv = nombreProv;
        this.correo = correo;
        this.RUC = RUC;
        this.telefono = telefono;
        this.direccion = direccion;
    }
    

    public String getIdProv() {
        return idProv;
    }

    public void setIdProv(String idProv) {
        this.idProv = idProv;
    }

    public String getNombreProv() {
        return nombreProv;
    }

    public void setNombreProv(String nombreProv) {
        this.nombreProv = nombreProv;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public String getRUC() {
        return RUC;
    }

    public void setRUC(String RUC) {
        this.RUC = RUC;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public String getCOD_admin() {
        return COD_admin;
    }

    public void setCOD_admin(String COD_admin) {
        this.COD_admin = COD_admin;
    }
    
}
