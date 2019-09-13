//
//  DAOGenre.swift
//  proyectoFinal
//
//  Created by Ag  on 27/06/2019.
//  Copyright © 2019 dh.proyectofinal. All rights reserved.
//

import Foundation
import Alamofire

class DAOGenre {
    
    func getGenresFromAPI(daoCompleted: @escaping (([Genre]) -> Void)) -> Void {
Alamofire.request("https://api.themoviedb.org/3/genre/movie/list?api_key=db898f2be5d80aee6fee0407b549ec39&language=en-US").responseJSON {
            (response) in
            
            if let rootArray = response.value as? [String:AnyObject]  {
                
                var genreResultArray: [Genre] = []
                if let array = rootArray["genres"] as? [[String : AnyObject]] {
                    for aDictionary in array {
                        let genre = Genre(dictionary: aDictionary)
                        genreResultArray.append(genre)
                        
                    }
                }
                
                daoCompleted(genreResultArray)
            }
        }
    }
}
