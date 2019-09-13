//
//  TrailerSerieViewController.swift
//  proyectoFinal
//
//  Created by Agustin Errecalde on 28/07/2019.
//  Copyright © 2019 dh.proyectofinal. All rights reserved.
//

import UIKit

class TrailerSerieViewController: UIViewController {

    @IBOutlet weak var youtubePlayer: YTPlayerView!
    
    var movieID: Int?
    var trailers: [Trailer] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let serieService = ServiceSeries()
        serieService.searchTrailer(movieID: movieID) { (trailers) in
            self.trailers = trailers
            let idTrailer = self.trailers[0].key
            self.youtubePlayer.load(withVideoId: idTrailer)
        }
    }

}
