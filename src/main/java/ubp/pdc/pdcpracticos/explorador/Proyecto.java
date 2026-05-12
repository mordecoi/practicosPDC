package ubp.pdc.pdcpracticos.explorador;

import java.util.Date;

public class Proyecto {
    private String nombre;
    private String rutaRelativa;
    private String archivoInicio;
    private Date fechaModificacion;

    // Constructores
    public Proyecto() {}

    public Proyecto(String nombre, String rutaRelativa, Date fechaModificacion) {
        this.nombre = nombre;
        this.rutaRelativa = rutaRelativa;
        this.fechaModificacion = fechaModificacion;
    }

    // Getters y Setters (Obligatorios para que funcione el ${} en el JSP)
    public String getNombre() { return nombre; }
    public void setNombre(String nombre) { this.nombre = nombre; }

    public String getRutaRelativa() { return rutaRelativa; }
    public void setRutaRelativa(String rutaRelativa) { this.rutaRelativa = rutaRelativa; }

    public Date getFechaModificacion() { return fechaModificacion; }
    public void setFechaModificacion(Date fechaModificacion) { this.fechaModificacion = fechaModificacion; }

    public String getArchivoInicio() {
        return archivoInicio;
    }

    public void setArchivoInicio(String archivoInicio) {
        this.archivoInicio = archivoInicio;
    }
}