package com.aluracursos.screenmatch.service;

import com.aluracursos.screenmatch.dto.SerieDTO;
import com.aluracursos.screenmatch.model.Episodio;
import com.aluracursos.screenmatch.model.Serie;
import com.aluracursos.screenmatch.repository.SerieRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class SerieService {

    @Autowired
    private SerieRepository repository;

    public List<SerieDTO> obtenerTodasLasSeries(){
        return convertirDatos(repository.findAll());
    }

    public List<SerieDTO> obtenerTop5() {
        return convertirDatos(repository.findTop5ByOrderByEvaluacionDesc());
    }

    public List<SerieDTO> obtenerLanzamientosRecientes(){
        return convertirDatos(repository.lanzamientosRecientes());
    }

    public List<SerieDTO> convertirDatos(List<Serie> series){
        return series.stream()
                .map(s -> new SerieDTO(s.getTitulo(), s.getTotalTemporadas(), s.getEvaluacion(), s.getGenero(),
                        s.getPoster(), s.getActores(), s.getSinopsis()))
                .collect(Collectors.toList());
    }
}
