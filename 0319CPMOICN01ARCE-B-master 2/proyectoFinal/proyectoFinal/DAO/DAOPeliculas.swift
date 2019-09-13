//
//  DAOPeliculas.swift
//  proyectoFinal
//
//  Created by iOS on 26/06/2019.
//  Copyright © 2019 dh.proyectofinal. All rights reserved.
//

import Foundation
import Alamofire

class DAOPeliculas {
    
    func getPeliculasFromAPI(daoCompleted: @escaping (([Pelicula]) -> Void)) -> Void {
        Alamofire.request("https://api.themoviedb.org/3/movie/popular?api_key=db898f2be5d80aee6fee0407b549ec39").responseJSON {
            (response) in
            
//            if let data = response.data {
//                let json = String(data: data, encoding: String.Encoding.utf8)
//                print("Failure response: \(String(describing: json))")
//            }
            
            if let rootArray = response.value as? [String:AnyObject]  {

                var peliculasResultArray: [Pelicula] = []
                if let array = rootArray["results"] as? [[String : AnyObject]] {
                    for aDictionary in array {
                        let pelicula = Pelicula(dictionary: aDictionary)
                        peliculasResultArray.append(pelicula)

                    }
                }

                daoCompleted(peliculasResultArray)
            }
        }
    }
    
    
    func search(query: String, completion:  @escaping ( ([Pelicula]) -> Void) ) {
        
        let parameters = ["query": query]
        Alamofire.request("https://api.themoviedb.org/3/search/movie?api_key=db898f2be5d80aee6fee0407b549ec39&language=en-US&query=", parameters: parameters).responseJSON { (response) in
            
            if let rootDictionary = response.value as? [String:AnyObject] {
                if let results = rootDictionary["results"] as? [[String: AnyObject]] {
                    var peliculasResultArray: [Pelicula] = []
                    for aDictionary in results {
                        let aPeliculaObject = Pelicula( dictionary: aDictionary)
                        peliculasResultArray.append(aPeliculaObject)
                    }
                    completion(peliculasResultArray)
                }
            }
            
        }
        
    }
    
    func searchTrailer(movieID: Int, completion:  @escaping ( ([Trailer]) -> Void) ) {
        
        let parameters = ["id": movieID]
        Alamofire.request("https://api.themoviedb.org/3/movie/" + String(movieID) + "/videos?api_key=db898f2be5d80aee6fee0407b549ec39&language=en-US", parameters: parameters).responseJSON { (response) in
            
                        if let data = response.data {
                            let json = String(data: data, encoding: String.Encoding.utf8)
                            print("Failure response: \(String(describing: json))")
                        }
            
            if let rootDictionary = response.value as? [String:AnyObject] {
                if let results = rootDictionary["results"] as? [[String: AnyObject]] {
                    var peliculaTrailerArray: [Trailer] = []
                    for aDictionary in results {
                        let aTrailerObject = Trailer( dictionary: aDictionary)
                        peliculaTrailerArray.append(aTrailerObject)
                    }
                    completion(peliculaTrailerArray)
                }
            }
            
        }
        
    }
    
    
}
