package ubp.pdc.pdcpracticos.agendador;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

public class AgendadorBean implements Serializable {

    private List<EventoBean> lista;

    public AgendadorBean() {
        this.lista = new ArrayList<>();
    }

    public List<EventoBean> getLista() {
        return lista;
    }

    // Este es el "truco" para JSTL: un setter que en realidad agrega a la lista
    public void setNuevoEvento(EventoBean evento) {
        if (evento != null) {
            this.lista.add(evento);
        }
    }
}