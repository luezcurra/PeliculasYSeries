//
//  Episodes.swift
//  proyectoFinal
//
//  Created by Agustin Errecalde on 28/07/2019.
//  Copyright © 2019 dh.proyectofinal. All rights reserved.
//

import Foundation

class Episode {
    var episodeNumber: Int
    var name: String
    var id: Int
    var overview: String
    var airDate: String
    var image: String
    
    // Constructor
    init(dictionary: [String: AnyObject]) {
        // self.address = dictionary["vicinity"] as? String ?? "no vicinity"
        self.episodeNumber = dictionary["episode_number"] as? Int ?? 0
        self.name = dictionary["name"] as? String ?? "no name"
        self.id = dictionary["id"] as? Int ?? 0
        self.overview = dictionary["overview"] as? String ?? "No description"
        self.airDate = dictionary["air_date"] as? String ?? "No date"
        self.image = dictionary["still_path"] as? String ?? ""

    }
}
