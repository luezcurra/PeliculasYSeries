//
//  Trailer.swift
//  proyectoFinal
//
//  Created by Agustin Errecalde on 27/07/2019.
//  Copyright © 2019 dh.proyectofinal. All rights reserved.
//

import Foundation

class Trailer {
    var name: String
    var key: String
    var id: String
    
    // Constructor
    init(dictionary: [String: AnyObject]) {
        // self.address = dictionary["vicinity"] as? String ?? "no vicinity"
        self.name = dictionary["name"] as? String ?? "no name"
        self.key = dictionary["key"] as? String ?? "no video"
        self.id = dictionary["id"] as? String ?? "no id"
        
    }
}
