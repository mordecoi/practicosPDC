package ubp.pdc.pdcpracticos.explorador;

import java.io.File;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class ExploradorProyectosBean implements Serializable {

    private String basePath; // La ruta física en el disco
    private List<Proyecto> proyectos;

    public ExploradorProyectosBean() {
        this.proyectos = new ArrayList<>();
    }

    // Cuando el JSP nos mande la ruta, disparamos el escaneo automáticamente
    public void setBasePath(String basePath) {
        this.basePath = basePath;
        this.escanearCarpetas();
    }

    public String getBasePath() {
        return basePath;
    }

    public List<Proyecto> getProyectos() {
        return proyectos;
    }

    // LÓGICA PRIVADA DE ESCANEO
    private void escanearCarpetas() {
        this.proyectos.clear(); // Limpiamos por si se llama dos veces

        if (this.basePath == null) return;

        File carpetaRaiz = new File(this.basePath);

        // Si la ruta existe y es una carpeta
        if (carpetaRaiz.exists() && carpetaRaiz.isDirectory()) {

            // Listamos lo que hay adentro
            File[] elementos = carpetaRaiz.listFiles();

            if (elementos != null) {
                for (File elemento : elementos) {

                    // Filtro 1: Solo nos interesan las carpetas
                    // Filtro 2: Ignoramos carpetas de sistema como WEB-INF, META-INF o css
                    if (elemento.isDirectory() &&
                            !elemento.getName().equals("WEB-INF") &&
                            !elemento.getName().equals("META-INF") &&
                            !elemento.getName().equals("css")) {

                        // Comprobamos si tiene un index.html o index.jsp adentro
                        File indexHtml = new File(elemento, "index.html");
                        File indexJsp = new File(elemento, "index.jsp");

                        if (indexHtml.exists() || indexJsp.exists()) {
                            Proyecto p = new Proyecto();
                            p.setNombre(elemento.getName());
                            p.setRutaRelativa(elemento.getName());
                            p.setFechaModificacion(new Date(elemento.lastModified()));

                            // DETECCIÓN DINÁMICA: Guardamos cuál de los dos archivos existe
                            if (indexHtml.exists()) {
                                p.setArchivoInicio("index.html");
                            } else {
                                p.setArchivoInicio("index.jsp");
                            }

                            this.proyectos.add(p);
                        }
                    }
                }
            }
        }
    }
}