//
//  Usuario.swift
//  proyectoFinal
//
//  Created by Agustin Errecalde on 22/07/2019.
//  Copyright © 2019 dh.proyectofinal. All rights reserved.
//

import Foundation

class Usuario {

    var id: String
    var nombre: String
    var email: String
    var favPeliculas: [Pelicula] = []
    var favSeries: [Serie] = []
    
    init(id: String) {
        self.id = id
        self.nombre = ""
        self.email = ""
    }
    
    init(dictionary: [String: AnyObject]) {
        self.id = dictionary["id"] as? String ?? ""
        self.nombre = dictionary["name"] as? String ?? "no name"
        self.email = dictionary["email"] as? String ?? ""
        self.favPeliculas = []
        if let array = dictionary["favPeliculas"] as? [[String: AnyObject]] {
            for dic in array {
                self.favPeliculas.append(Pelicula(dictionary: dic))
            }
        }
        self.favSeries = []
        if let array = dictionary["favSeries"] as? [[String: AnyObject]] {
            for dic in array {
                self.favSeries.append(Serie(dictionary: dic))
            }
        }
    }
    
    func toDictionary() -> [String: AnyObject] {
        var result =  ["id": id, "name": nombre, "email": email] as [String: AnyObject]
        if favPeliculas.count > 0 {
            var arrayPelicula: [[String: AnyObject]] = []
            for pelicula in favPeliculas {
                arrayPelicula.append(pelicula.toDictionary())
            }
            result["favPeliculas"] = arrayPelicula as AnyObject
        }
        if favSeries.count > 0 {
            var arraySeries: [[String: AnyObject]] = []
            for serie in favSeries {
                arraySeries.append(serie.toDictionary())
            }
            result["favSeries"] = arraySeries as AnyObject
        }
        
        return result
    }
}
