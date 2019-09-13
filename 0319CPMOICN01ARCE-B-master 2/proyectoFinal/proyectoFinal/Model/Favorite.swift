//
//  Favorite.swift
//  proyectoFinal
//
//  Created by Agustin Errecalde on 28/07/2019.
//  Copyright © 2019 dh.proyectofinal. All rights reserved.
//

import Foundation

class Favorite {
    var favorite: [Pelicula] = []
    
    // Constructor
    init(dictionary: [String: AnyObject]) {
        if let peliculasFavArray = dictionary["usuarios"] as? [[String: AnyObject]] {
            for item in peliculasFavArray {
                if let pelicula = item["favPeliculas"] as? Pelicula {
                    self.favorite.append(pelicula)
                }
            }
        
        }
    }
}
