package ubp.pdc.pdcpracticos.agendador;

import java.io.Serializable;

public class EventoBean implements Serializable {

    // Datos del formulario
    private String fecha;
    private String prioridad;
    private String descripcion;
    private String notificar;
    private String email;

    // Estado interno para la lógica visual de la tabla
    private boolean descartado;

    public EventoBean() {
        // Por defecto, un evento nuevo nunca nace descartado
        this.descartado = false;
    }

    // --- Getters y Setters obligatorios para EL (${evento.propiedad}) ---

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public String getPrioridad() {
        return prioridad;
    }

    public void setPrioridad(String prioridad) {
        this.prioridad = prioridad;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public String getNotificar() {
        return notificar;
    }

    public void setNotificar(String notificar) {
        this.notificar = notificar;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public boolean isDescartado() {
        return descartado;
    }

    public void setDescartado(boolean descartado) {
        this.descartado = descartado;
    }
}