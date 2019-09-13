//
//  ServicePeliculas.swift
//  proyectoFinal
//
//  Created by iOS on 26/06/2019.
//  Copyright © 2019 dh.proyectofinal. All rights reserved.
//

import Foundation

class ServicePeliculas {
    
    func getPeliculas(serviceCompleted: @escaping ( ([Pelicula])) -> Void  ) -> Void {
        let daoPeliculas = DAOPeliculas()
        daoPeliculas.getPeliculasFromAPI(daoCompleted: { (peliculas) in

            serviceCompleted(peliculas)
        })
    }
    
    func search(query: String?, completion:  @escaping ( ([Pelicula]) -> Void) ) -> Void {
        if let aQuery = query {
            let peliculasDAO = DAOPeliculas()
            peliculasDAO.search(query: aQuery) { (peliculas) in
                completion(peliculas)
            }
        }
    }
    
    func searchTrailer(movieID: Int?, completion:  @escaping ( ([Trailer]) -> Void) ) -> Void {
        if let aKey = movieID {
            let peliculasDAO = DAOPeliculas()
            peliculasDAO.searchTrailer(movieID: aKey) { (trailers) in
                completion(trailers)
            }
        }
    }
    
}

