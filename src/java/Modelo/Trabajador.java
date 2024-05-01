package Modelo;

public class Trabajador {
    private String ID_trab, COD_admin, nom_trab, ape_trab, correo, contra, cargo_trab, ID_cargo,nombre_cargo;
    private int dni_trab, numero_trab, contarCargo;

    public Trabajador() {
    }

    public Trabajador(String ID_trab) {
        this.ID_trab = ID_trab;
    }

    public Trabajador(String ID_trab, String nom_trab, String ape_trab, String correo, String contra, String cargo_trab, int dni_trab, int numero_trab) {
        this.ID_trab = ID_trab;
        this.nom_trab = nom_trab;
        this.ape_trab = ape_trab;
        this.correo = correo;
        this.contra = contra;
        this.cargo_trab = cargo_trab;
        this.dni_trab = dni_trab;
        this.numero_trab = numero_trab;
    }

    public Trabajador(String nom_trab, String ape_trab, String correo, String contra, String cargo_trab, int dni_trab, int numero_trab) {
        this.nom_trab = nom_trab;
        this.ape_trab = ape_trab;
        this.correo = correo;
        this.contra = contra;
        this.cargo_trab = cargo_trab;
        this.dni_trab = dni_trab;
        this.numero_trab = numero_trab;
    }
    
    public String getID_trab() {
        return ID_trab;
    }

    public void setID_trab(String ID_trab) {
        this.ID_trab = ID_trab;
    }

    public String getCOD_admin() {
        return COD_admin;
    }

    public void setCOD_admin(String COD_admin) {
        this.COD_admin = COD_admin;
    }

    public String getNom_trab() {
        return nom_trab;
    }

    public void setNom_trab(String nom_trab) {
        this.nom_trab = nom_trab;
    }

    public String getApe_trab() {
        return ape_trab;
    }

    public void setApe_trab(String ape_trab) {
        this.ape_trab = ape_trab;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public String getContra() {
        return contra;
    }

    public void setContra(String contra) {
        this.contra = contra;
    }

    public String getCargo_trab() {
        return cargo_trab;
    }

    public void setCargo_trab(String cargo_trab) {
        this.cargo_trab = cargo_trab;
    }

    public String getID_cargo() {
        return ID_cargo;
    }

    public void setID_cargo(String ID_cargo) {
        this.ID_cargo = ID_cargo;
    }

    public String getNombre_cargo() {
        return nombre_cargo;
    }

    public void setNombre_cargo(String nombre_cargo) {
        this.nombre_cargo = nombre_cargo;
    }

    public int getDni_trab() {
        return dni_trab;
    }

    public void setDni_trab(int dni_trab) {
        this.dni_trab = dni_trab;
    }

    public int getNumero_trab() {
        return numero_trab;
    }

    public void setNumero_trab(int numero_trab) {
        this.numero_trab = numero_trab;
    }

    public int getContarCargo() {
        return contarCargo;
    }

    public void setContarCargo(int contarCargo) {
        this.contarCargo = contarCargo;
    }

}
