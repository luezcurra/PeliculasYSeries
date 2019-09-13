//
//  ServiceGenre.swift
//  proyectoFinal
//
//  Created by Ag  on 27/06/2019.
//  Copyright © 2019 dh.proyectofinal. All rights reserved.
//

import Foundation

class ServiceGenre {
    
    func getGenre(serviceCompleted: @escaping ( ([Genre])) -> Void  ) -> Void {
        let daoGenre = DAOGenre()
        daoGenre.getGenresFromAPI(daoCompleted: { (genre) in
            
            serviceCompleted(genre)
        })
    }
    
}
