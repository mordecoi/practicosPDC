package ubp.pdc.pdcpracticos.abmvideos;

import java.util.HashMap;
import java.util.LinkedList;

public class GestorVideosBean {

    LinkedList<VideoBean> listaVideos;
    HashMap<Integer, String> categorias = new HashMap<Integer, String>();
    categorias.put(1, "BLUE");
    categorias.put(2, "CLÁSICA");
    categorias.put(3, "COUNTRY");
    categorias.put(4, "FUNK");
    categorias.put(5, "HIP HOP");
    categorias.put(6, "JAZZ");
    categorias.put(7, "POP");
    categorias.put(8, "ROCK");
    categorias.put(9, "REGGAETON y TRAP");
    categorias.put(10, "ROCK ALTERNATIVO");
}
