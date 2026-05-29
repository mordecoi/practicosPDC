package ubp.pdc.pdcpracticos.practicaAJAXfragHTML; // Cámbialo por el paquete que estés usando

import java.util.LinkedHashMap;
import java.util.Map;

public class AlarmaBean {

    private Map<String, String> listaAlarmas;

    public AlarmaBean() {
        listaAlarmas = new LinkedHashMap<>();
        // Simulamos las alertas críticas del NOC
        listaAlarmas.put("Servidor de Base de Datos", "Uso de CPU al 99%");
        listaAlarmas.put("Gateway Principal", "Latencia crítica (> 500ms)");
        listaAlarmas.put("Servidor de Almacenamiento", "Espacio en disco al 98%");
        listaAlarmas.put("Nodo de Caché B", "Servicio fuera de línea");
    }

    public Map<String, String> getListaAlarmas() {
        return listaAlarmas;
    }
}