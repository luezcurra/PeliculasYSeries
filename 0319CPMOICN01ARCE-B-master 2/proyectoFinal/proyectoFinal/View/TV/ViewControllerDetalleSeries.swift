//
//  ViewControllerDetalleSeries.swift
//  proyectoFinal
//
//  Created by Ag  on 27/06/2019.
//  Copyright © 2019 dh.proyectofinal. All rights reserved.
//

import UIKit
import Kingfisher

class ViewControllerDetalleSeries: UIViewController {
    
    let imagenStringDefault: String = "https://image.tmdb.org/t/p/w500"
    @IBOutlet weak var peliculaImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var genreLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var descriptionTxt: UITextView!
    @IBOutlet weak var imageLogo: UIImageView!
    @IBOutlet weak var btnPlay: UIButton!
    
    
    var serie: Serie?
    var season: Season?
    var episode: Episode?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageLogo.image = UIImage(named: "logoDef")
        title = "Detalle"
        btnPlay.layer.cornerRadius = 5
        btnPlay.layer.borderWidth = 1
        
        if let serie = serie, let season = season, let episode = episode {
            let url = URL(string: imagenStringDefault + episode.image)
            peliculaImageView.kf.setImage(with: url)
            
            nameLabel.text = serie.name + " (Season:  \(String(season.seasonNumer)) - Episode:  \(String(episode.episodeNumber)))"
            
            genreLabel.text = String(serie.genre)
            descriptionTxt.text = episode.overview
            yearLabel.text = episode.airDate
//            let dateFormatterGet = DateFormatter()
//            dateFormatterGet.dateFormat = "yyyy-mm-dd"
//            let dateFormatterPrint = DateFormatter()
//            dateFormatterPrint.dateFormat = "MMM, yyyy"
//
//            if let date = dateFormatterGet.date(from: serie.date) {
//                yearLabel.text = dateFormatterPrint.string(from: date)
//            } else {
//                yearLabel.text = "Unknow date"
//            }
        }
    }
    @IBAction func playTrailer(_ sender: Any) {
        if let detalleSerieViewController = storyboard?.instantiateViewController(withIdentifier: "reproductor-serie") as? TrailerSerieViewController {
            detalleSerieViewController.movieID = serie?.id
            self.navigationController?.pushViewController(detalleSerieViewController, animated: true)
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
