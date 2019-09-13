//
//  ServiceSeries.swift
//  proyectoFinal
//
//  Created by iOS on 26/06/2019.
//  Copyright © 2019 dh.proyectofinal. All rights reserved.
//

import Foundation

class ServiceSeries {
    
    func getSeries(serviceCompleted: @escaping ( ([Serie])) -> Void  ) -> Void {
        let daoSeries = DAOSeries()
        daoSeries.getSeriesFromAPI(daoCompleted: { (series) in
            
            serviceCompleted(series)
        })
    }
    func search(query: String?, completion:  @escaping ( ([Serie]) -> Void) ) -> Void {
        if let aQuery = query {
            let serieDAO = DAOSeries()
            serieDAO.search(query: aQuery) { (series) in
                completion(series)
            }
        }
    }
    func getSeason(tvId: Int?, completion:  @escaping ( ([Season]) -> Void) ) -> Void {
        if let aKey = tvId {
            let seriesDAO = DAOSeries()
            seriesDAO.getSeasons(tvId: aKey) { (seasons) in
                completion(seasons)
            }
        }
    }
    func getEpisodes(tvId: Int?, seasonNumber: Int?, completion:  @escaping ( ([Episode]) -> Void) ) -> Void {
        if let aTvId = tvId, let aSesonNumber = seasonNumber {
            let seriesDAO = DAOSeries()
            seriesDAO.getEpisodes(tvId: aTvId, seasonNumber: aSesonNumber) { (episodes) in
                completion(episodes)
            }
        }
    }
    func searchTrailer(movieID: Int?, completion:  @escaping ( ([Trailer]) -> Void) ) -> Void {
        if let aKey = movieID {
            let seriesDAO = DAOSeries()
            seriesDAO.searchTrailer(movieID: aKey) { (trailers) in
                completion(trailers)
            }
        }
    }
    
    
}
