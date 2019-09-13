//
//  TrailerViewController.swift
//  proyectoFinal
//
//  Created by Ag  on 01/07/2019.
//  Copyright © 2019 dh.proyectofinal. All rights reserved.
//

import UIKit
import youtube_ios_player_helper

class TrailerViewController: UIViewController {
    
    @IBOutlet weak var youtubePlayer: YTPlayerView!
    var movieID: Int?
    var trailers: [Trailer] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let peliculasService = ServicePeliculas()
            peliculasService.searchTrailer(movieID: movieID) { (trailers) in
                self.trailers = trailers
                let idTrailer = self.trailers[0].key
                self.youtubePlayer.load(withVideoId: idTrailer)
            }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
