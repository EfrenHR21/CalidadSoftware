
package Modelo;

public class Cliente {
    private String ID_cli, COD_admin, nom_cli, ape_cli, correo, contra, distritos, Id_dist, nom_dist, color_dist;
    private int edad, cell_cli, contarDistrito, contarEdad;

    public Cliente() {
    }

    public Cliente(String ID_cli, String nom_cli, String correo, String contra, String distritos, int cell_cli) {
        this.ID_cli = ID_cli;
        this.nom_cli = nom_cli;
        this.correo = correo;
        this.contra = contra;
        this.distritos = distritos;
        this.cell_cli = cell_cli;
    }

    
    public Cliente(String ID_cli, String nom_cli, String ape_cli, String correo, String contra, String distritos, int edad, int cell_cli) {
        this.ID_cli = ID_cli;
        this.nom_cli = nom_cli;
        this.ape_cli = ape_cli;
        this.correo = correo;
        this.contra = contra;
        this.distritos = distritos;
        this.edad = edad;
        this.cell_cli = cell_cli;
    }

    

    public Cliente(String nom_cli, String ape_cli, String correo, String contra, String distritos, int edad, int cell_cli) {
        this.nom_cli = nom_cli;
        this.ape_cli = ape_cli;
        this.correo = correo;
        this.contra = contra;
        this.distritos = distritos;
        this.edad = edad;
        this.cell_cli = cell_cli;
    }

    public String getID_cli() {
        return ID_cli;
    }

    public void setID_cli(String ID_cli) {
        this.ID_cli = ID_cli;
    }

    public String getCOD_admin() {
        return COD_admin;
    }

    public void setCOD_admin(String COD_admin) {
        this.COD_admin = COD_admin;
    }

    public String getNom_cli() {
        return nom_cli;
    }

    public void setNom_cli(String nom_cli) {
        this.nom_cli = nom_cli;
    }

    public String getApe_cli() {
        return ape_cli;
    }

    public void setApe_cli(String ape_cli) {
        this.ape_cli = ape_cli;
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

    public String getDistritos() {
        return distritos;
    }

    public void setDistritos(String distritos) {
        this.distritos = distritos;
    }

    public String getNom_dist() {
        return nom_dist;
    }

    public void setNom_dist(String nom_dist) {
        this.nom_dist = nom_dist;
    }

    public int getEdad() {
        return edad;
    }

    public void setEdad(int edad) {
        this.edad = edad;
    }

    public int getCell_cli() {
        return cell_cli;
    }

    public void setCell_cli(int cell_cli) {
        this.cell_cli = cell_cli;
    }

    public String getId_dist() {
        return Id_dist;
    }

    public void setId_dist(String Id_dist) {
        this.Id_dist = Id_dist;
    }

    public int getContarDistrito() {
        return contarDistrito;
    }

    public void setContarDistrito(int contarDistrito) {
        this.contarDistrito = contarDistrito;
    }

    public String getColor_dist() {
        return color_dist;
    }

    public void setColor_dist(String color_dist) {
        this.color_dist = color_dist;
    }

    public int getContarEdad() {
        return contarEdad;
    }

    public void setContarEdad(int contarEdad) {
        this.contarEdad = contarEdad;
    }
    
}
