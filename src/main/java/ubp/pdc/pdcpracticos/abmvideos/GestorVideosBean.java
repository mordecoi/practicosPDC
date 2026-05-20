package ubp.pdc.pdcpracticos.abmvideos;

import java.util.HashMap;
import java.util.LinkedList;

public class GestorVideosBean {

    private LinkedList<VideoBean> listaVideos;
    private HashMap<Integer, String> listaCategorias = new HashMap<Integer, String>();

    public GestorVideosBean() {
        listaCategorias.put(1, "BLUE");
        listaCategorias.put(2, "CLÁSICA");
        listaCategorias.put(3, "COUNTRY");
        listaCategorias.put(4, "FUNK");
        listaCategorias.put(5, "HIP HOP");
        listaCategorias.put(6, "JAZZ");
        listaCategorias.put(7, "POP");
        listaCategorias.put(8, "ROCK");
        listaCategorias.put(9, "REGGAETON y TRAP");
        listaCategorias.put(10, "ROCK ALTERNATIVO");
    }

    public LinkedList<VideoBean> getListaVideos() {
        return listaVideos;
    }

    public void setListaVideos(LinkedList<VideoBean> listaVideos) {
        this.listaVideos = listaVideos;
    }

    public HashMap<Integer, String> getListaCategorias() {
        return listaCategorias;
    }

    public void setListaCategorias(HashMap<Integer, String> listaCategorias) {
        this.listaCategorias = listaCategorias;
    }

    public void addVideo(VideoBean video){
        this.listaVideos.add(video);
    }

}
