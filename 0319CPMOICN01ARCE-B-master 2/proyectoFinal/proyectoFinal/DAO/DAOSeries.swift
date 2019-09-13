//
//  DAOSeries.swift
//  proyectoFinal
//
//  Created by iOS on 26/06/2019.
//  Copyright © 2019 dh.proyectofinal. All rights reserved.
//

import Foundation
import Alamofire

class DAOSeries {
    
    func getSeriesFromAPI(daoCompleted: @escaping (([Serie]) -> Void)) -> Void {
        Alamofire.request("https://api.themoviedb.org/3/tv/popular?api_key=db898f2be5d80aee6fee0407b549ec39").responseJSON {
            (response) in
            
            if let rootArray = response.value as? [String:AnyObject]  {
                var seriesResultArray: [Serie] = []
                if let array = rootArray["results"] as? [[String : AnyObject]] {
                    for aDictionary in array {
                        let serie = Serie(dictionary: aDictionary)
                        seriesResultArray.append(serie)
                        
                    }
                }
                
                daoCompleted(seriesResultArray)
            }
        }
    }
    func search(query: String, completion:  @escaping ( ([Serie]) -> Void) ) {
        
        let parameters = ["query": query]
        Alamofire.request("https://api.themoviedb.org/3/search/tv?api_key=db898f2be5d80aee6fee0407b549ec39&language=en-US&query=", parameters: parameters).responseJSON { (response) in
            
            if let rootDictionary = response.value as? [String:AnyObject] {
                if let results = rootDictionary["results"] as? [[String: AnyObject]] {
                    var serieResultArray: [Serie] = []
                    for aDictionary in results {
                        let aSerieObject = Serie( dictionary: aDictionary)
                        serieResultArray.append(aSerieObject)
                    }
                    completion(serieResultArray)
                }
            }
            
        }
        
    }
    
    
    func getSeasons(tvId: Int, completion:  @escaping ( ([Season]) -> Void) ) {
        
        let parameters = ["tv_id": tvId]

        Alamofire.request("https://api.themoviedb.org/3/tv/" + String(tvId) + "?api_key=db898f2be5d80aee6fee0407b549ec39&language=en-US", parameters: parameters).responseJSON { (response) in
            
            if let data = response.data {
                let json = String(data: data, encoding: String.Encoding.utf8)
                print("Failure response: \(String(describing: json))")
            }
            if let rootDictionary = response.value as? [String:AnyObject] {
                if let results = rootDictionary["seasons"] as? [[String: AnyObject]] {
                    var seasonTvArray: [Season] = []
                    for aDictionary in results {
                        let aTraiaSeasonObject = Season( dictionary: aDictionary)
                        seasonTvArray.append(aTraiaSeasonObject)
                    }
                    completion(seasonTvArray)
                }
            }
        }
    }
    func getEpisodes(tvId: Int, seasonNumber: Int, completion:  @escaping ( ([Episode]) -> Void) ) {
        
        let parameters = ["tv_id": tvId,
                          "season_number": seasonNumber]
        
        
        Alamofire.request("https://api.themoviedb.org/3/tv/" + String(tvId) + "/season/" + String(seasonNumber) + "?api_key=db898f2be5d80aee6fee0407b549ec39&language=en-US", parameters: parameters).responseJSON { (response) in
            
            if let data = response.data {
                let json = String(data: data, encoding: String.Encoding.utf8)
                print("Failure response: \(String(describing: json))")
            }
            if let rootDictionary = response.value as? [String:AnyObject] {
                if let results = rootDictionary["episodes"] as? [[String: AnyObject]] {
                    var episodeTvArray: [Episode] = []
                    for aDictionary in results {
                        let aEpisodeObject = Episode( dictionary: aDictionary)
                        episodeTvArray.append(aEpisodeObject)
                    }
                    completion(episodeTvArray)
                }
            }
        }
    }

    func searchTrailer(movieID: Int, completion:  @escaping ( ([Trailer]) -> Void) ) {
        
        let parameters = ["id": movieID]
        Alamofire.request("https://api.themoviedb.org/3/tv/" + String(movieID) + "/videos?api_key=db898f2be5d80aee6fee0407b549ec39&language=en-US", parameters: parameters).responseJSON { (response) in
            
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
