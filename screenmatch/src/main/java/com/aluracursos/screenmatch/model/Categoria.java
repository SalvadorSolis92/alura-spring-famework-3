package com.aluracursos.screenmatch.model;

public enum Categoria {
    ACCION("Action", "Acción"),
    ROMANCE("Romance", "Romance"),
    COMEDIA("Comedy", "Comedia"),
    DRAMA("Drama", "Drama"),
    CRIMEN("Crime", "Crimen");

    private String categoriaOmdb;
    private String categoriaEspaniol;

    Categoria (String categorioaOmbd, String categoriaEspaniol){
        this.categoriaOmdb = categorioaOmbd;
        this.categoriaEspaniol = categoriaEspaniol;
    }

    public static Categoria fromString(String text){
        for(Categoria categoria: Categoria.values()){
            if (categoria.categoriaOmdb.equals(text)){
                return categoria;
            }
        }
        throw new IllegalArgumentException("Ninguna categoria encontrada " + text);
    }

    public static Categoria fromEspaniol(String text){
        for(Categoria categoria: Categoria.values()){
            if (categoria.categoriaEspaniol.equals(text)){
                return categoria;
            }
        }
        throw new IllegalArgumentException("Ninguna categoria encontrada " + text);
    }
}
