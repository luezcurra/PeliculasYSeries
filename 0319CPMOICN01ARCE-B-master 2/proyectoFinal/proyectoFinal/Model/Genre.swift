//
//  Genre.swift
//  proyectoFinal
//
//  Created by Ag  on 27/06/2019.
//  Copyright © 2019 dh.proyectofinal. All rights reserved.
//

import Foundation

public class Genre {
    
    var name: String
    var id: Int
    
    // Constructor
    init(dictionary: [String: AnyObject]) {
        // self.address = dictionary["vicinity"] as? String ?? "no vicinity"
        self.id = dictionary["id"] as? Int ?? 0
        self.name = dictionary["name"] as? String ?? "no name"
        
    }
    
    
    
    
}
