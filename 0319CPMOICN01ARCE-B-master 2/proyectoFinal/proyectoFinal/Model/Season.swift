//
//  Season.swift
//  proyectoFinal
//
//  Created by Agustin Errecalde on 27/07/2019.
//  Copyright © 2019 dh.proyectofinal. All rights reserved.
//

import Foundation

class Season {
    var episodes: Int
    var name: String
    var id: Int
    var seasonNumer: Int
    
    // Constructor
    init(dictionary: [String: AnyObject]) {
        // self.address = dictionary["vicinity"] as? String ?? "no vicinity"
        self.episodes = dictionary["episode_count"] as? Int ?? 0
        self.name = dictionary["name"] as? String ?? "no name"
        self.id = dictionary["id"] as? Int ?? 0
        self.seasonNumer = dictionary["season_number"] as? Int ?? 0
    }
}
