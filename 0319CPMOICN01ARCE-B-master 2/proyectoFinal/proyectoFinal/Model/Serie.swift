//
//  Serie.swift
//  proyectoFinal
//
//  Created by Luciana Ines Ezcurra on 19/06/2019.
//  Copyright © 2019 dh.proyectofinal. All rights reserved.
//

import Foundation

public class Serie {

    var name: String
    var genre: String
    var description: String
    var average: Double
    var popularity: Int
    var poster_path: String
    var date: String
    var backdrop_path: String
    var id: Int
    
    
    
    // Constructor
    init(dictionary: [String: AnyObject]) {
        // self.address = dictionary["vicinity"] as? String ?? "no vicinity"
        self.name = dictionary["name"] as? String ?? "no name"
        self.average = dictionary["vote_average"] as? Double ?? 0
        self.popularity = dictionary["popularity"] as? Int ?? 0
        self.description = dictionary["overview"] as? String ?? "no description"
        self.poster_path = dictionary["poster_path"] as? String ?? "no poster"
        self.date = dictionary["first_air_date"] as? String ?? "no date"
        self.backdrop_path = dictionary["backdrop_path"] as? String ?? "no poster"
        self.genre = dictionary["genre"] as? String ?? "no genre"
        self.id = dictionary["id"] as? Int ?? 0

        
    }
    func toDictionary() -> [String: AnyObject] {
        return ["name": name, "vote_average": average, "popularity": popularity, "overview":description, "poster_path":poster_path, "first_air_date": date, "backdrop_path":backdrop_path, "genre":genre, "id":id] as [String: AnyObject]
    }



}
