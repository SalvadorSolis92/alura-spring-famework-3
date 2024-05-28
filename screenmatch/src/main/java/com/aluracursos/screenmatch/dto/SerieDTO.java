package com.aluracursos.screenmatch.dto;

import com.aluracursos.screenmatch.model.Categoria;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;

public record SerieDTO(
        String titulo,

        Integer totalTemporadas,

        Double evaluacion,

        Categoria genero,

        String poster,

        String actores,

        String sinopsis) {
}
