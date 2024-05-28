package com.aluracursos.screenmatch.principal;

import com.aluracursos.screenmatch.model.*;
import com.aluracursos.screenmatch.repository.SerieRepository;
import com.aluracursos.screenmatch.service.ConsumoAPI;
import com.aluracursos.screenmatch.service.ConvierteDatos;

import java.util.*;
import java.util.stream.Collectors;

public class Principal {
    private Scanner teclado = new Scanner(System.in);
    private ConsumoAPI consumoApi = new ConsumoAPI();
    private final String URL_BASE = "https://www.omdbapi.com/?t=";
    private final String API_KEY = "&apikey=c131c757";
    private ConvierteDatos conversor = new ConvierteDatos();
    private  List<DatosSerie> datosSeries = new ArrayList<>();
    private SerieRepository repository;
    private List<Serie> series;
    private Optional<Serie> serieBuscada;


    public  Principal(SerieRepository repository){
        this.repository = repository;
    }

    public void muestraElMenu() {
        var opcion = -1;
        while (opcion != 0) {
            var menu = """
                    1 - Buscar series 
                    2 - Buscar episodios
                    3 - Mostrar series buscadas
                    4 - Buscar series por titulo
                    5 - Top de 5 mejores series
                    6 - Buscar series por categoria
                    7 - Buscar series filtrando por número de temporadas y evaluación
                    8 - Buscar episodios por nombre
                    9 - Buscar top 5 de episodios por serie
                                  
                    0 - Salir
                    
                    """;
            System.out.println(menu);
            opcion = teclado.nextInt();
            teclado.nextLine();

            switch (opcion) {
                case 1:
                    buscarSerieWeb();
                    break;
                case 2:
                    buscarEpisodioPorSerie();
                    break;
                case 3:
                    mostarSeriesBuscadas();
                    break;
                case 4:
                    buscarSeriesPorTitulo();
                case 5:
                    top5MejoresSeries();
                    break;
                case 6:
                    buscarSeriesPorCategoria();
                    break;
                case 7:
                    buscarSeriePorNumTemporadasAndEvaludacion();
                    break;
                case 8:
                    buscarEpisodiosPorTitulo();
                case 9:
                    buscarTop5Episodios();
                case 0:
                    System.out.println("Cerrando la aplicación...");
                    break;
                default:
                    System.out.println("Opción inválida");
            }
        }

    }

    private DatosSerie getDatosSerie() {
        System.out.println("Escribe el nombre de la serie que deseas buscar");
        var nombreSerie = teclado.nextLine();
        var json = consumoApi.obtenerDatos(URL_BASE + nombreSerie.replace(" ", "+") + API_KEY);
        System.out.println(json);
        DatosSerie datos = conversor.obtenerDatos(json, DatosSerie.class);
        return datos;
    }
    private void buscarEpisodioPorSerie() {
        //DatosSerie datosSerie = getDatosSerie();
        //List<DatosTemporadas> temporadas = new ArrayList<>();

//        for (int i = 1; i <= datosSerie.totalTemporadas(); i++) {
//            var json = consumoApi.obtenerDatos(URL_BASE + datosSerie.titulo().replace(" ", "+") + "&season=" + i + API_KEY);
//            DatosTemporadas datosTemporada = conversor.obtenerDatos(json, DatosTemporadas.class);
//            temporadas.add(datosTemporada);
//        }
//        temporadas.forEach(System.out::println);

        mostarSeriesBuscadas();
        System.out.println("Escribe el nombre de la serie para obtener la lista de sus episodios");
        var nombreSerie = teclado.nextLine();

        Optional<Serie> serie = this.series.stream()
                .filter(s -> s.getTitulo().toLowerCase().contains(nombreSerie.toLowerCase()))
                .findFirst();

        if (serie.isPresent()) {
            var serieEncontrada = serie.get();
            List<DatosTemporadas> temporadas = new ArrayList<>();

            for (int i = 1; i <= serieEncontrada.getTotalTemporadas(); i++) {
                var json = consumoApi.obtenerDatos(URL_BASE + serieEncontrada.getTitulo().replace(" ", "+") + "&season=" + i + API_KEY);
                DatosTemporadas datosTemporada = conversor.obtenerDatos(json, DatosTemporadas.class);
                temporadas.add(datosTemporada);
            }
            temporadas.forEach(System.out::println);

            List<Episodio> episodios = temporadas.stream()
                    .flatMap(d -> d.episodios().stream()
                            .map(e -> new Episodio(d.numero(), e)))
                    .collect(Collectors.toList());

            serieEncontrada.setEpisodios(episodios);

            this.repository.save(serieEncontrada);
        }


    }
    private void buscarSerieWeb() {
        DatosSerie datos = getDatosSerie();
        //datosSeries.add(datos);
        Serie serie = new Serie(datos);
        repository.save(serie);
        System.out.println(datos);
    }

    private void mostarSeriesBuscadas(){
//        List<Serie> series = new ArrayList<>();
//
//        series = datosSeries.stream()
//                .map(d -> new Serie(d))
//                        .collect(Collectors.toList());
        this.series = this.repository.findAll();

        series.stream()
                .sorted(Comparator.comparing(Serie::getGenero))
                .forEach(System.out::println);


    }

    private void buscarSeriesPorTitulo(){
        System.out.println("Escribe el nombre de la serie que deseas buscar");
        var nombreSerie = teclado.nextLine();

        serieBuscada = repository.findByTituloContainsIgnoreCase(nombreSerie);

        if (serieBuscada.isPresent()){
            System.out.println("La serie buscada es: " + serieBuscada.get());
        }else{
            System.out.println("Serie no encontrada");
        }
    }

    private void top5MejoresSeries(){
        List<Serie> topSeries = repository.findTop5ByOrderByEvaluacionDesc();

        topSeries.forEach(s -> System.out.println("Serie: " + s.getTitulo() + "Evaluacion: " + s.getEvaluacion() ));
    }

    private void buscarSeriesPorCategoria(){
        System.out.println("Escriba el genero/categoria que desea buscar");
        var genero = teclado.nextLine();
        var categoria = Categoria.fromEspaniol(genero);

        List<Serie> seriesCategoria = repository.findByGenero(categoria);
        System.out.println("Las series de la categoria " + genero);

        seriesCategoria.forEach(System.out::println);

    }

    private void buscarSeriePorNumTemporadasAndEvaludacion(){
        System.out.println("Escriba el numero de temporadas");
        var numTemporadas = teclado.nextInt();

        System.out.println("Escriba la evaluacion");
        var evaluacion = teclado.nextDouble();


        //List<Serie> filtroSeries = repository.findByTotalTemporadasLessThanEqualAndEvaluacionGreaterThanEqual(numTemporadas, evaluacion);
        List<Serie> filtroSeries = repository.seriesPorTemporadaYEvaluacion(numTemporadas, evaluacion);
        System.out.println("*** Series filtradas ***");
        filtroSeries.forEach(s ->
                System.out.println(s.getTitulo() + "  - evaluacion: " + s.getEvaluacion()));


    }

    private  void buscarEpisodiosPorTitulo(){
        System.out.println("Escribe  el nombre del episodio que deseas buscar");
        var nombreEpisodio = teclado.nextLine();

        List<Episodio> episodios = repository.espisodiosPorNombre(nombreEpisodio);

        episodios.forEach( e ->
                System.out.printf("Serie %s Temporada: %s Episodio: %s Evaluación:  %s", e.getSerie(), e.getTemporada(), e.getNumeroEpisodio(), e.getEvaluacion()));
    }

    private void buscarTop5Episodios(){
        buscarEpisodiosPorTitulo();

        if (serieBuscada.isPresent()){
            Serie serie = serieBuscada.get();
            List<Episodio> topEpisodios = repository.top5Episodios(serie);

            topEpisodios.forEach(e ->
                    System.out.printf("Serie: %s - Temporada: %s - Episodio: %s - Evaluación:  %s", e.getSerie(), e.getTemporada(), e.getNumeroEpisodio(), e.getEvaluacion()));

        }
    }

}

