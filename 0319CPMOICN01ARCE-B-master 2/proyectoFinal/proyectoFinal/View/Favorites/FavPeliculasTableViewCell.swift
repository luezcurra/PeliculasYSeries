//
//  FavPeliculasTableViewCell.swift
//  proyectoFinal
//
//  Created by Agustin Errecalde on 22/07/2019.
//  Copyright © 2019 dh.proyectofinal. All rights reserved.
//

import UIKit
import Kingfisher
import FirebaseAuth
import FirebaseDatabase

protocol TapDelegate {
    func tappedUnfav(pelicula: Pelicula?, serie: Serie?)
}

class FavPeliculasTableViewCell: UITableViewCell {

    let imagenStringDefault: String = "https://image.tmdb.org/t/p/w500"
    @IBOutlet weak var peliculaImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var genreLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var ratedLabel: UILabel!
    @IBOutlet weak var starImage: UIImageView!
    @IBOutlet weak var unfavBtn: UIButton!
    var pelicula: Pelicula?
    var serie: Serie?
    
    var buttonTapDelegate: TapDelegate?
    
    //Configuro la pelicula
    func setup(pelicula: Pelicula) {
        let url = URL(string: imagenStringDefault + "\(pelicula.poster_path)")
        peliculaImageView.kf.setImage(with: url)
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-mm-dd"
        
        let str = pelicula.date
        let index: String.Index = str.index(str.startIndex, offsetBy: 4)
        yearLabel.text = "(" + str.substring(to: index) + ")"
        
        ratedLabel.text = String(pelicula.average)
        starImage.image = UIImage(named: "star")
        nameLabel.text = pelicula.name
        genreLabel.text = String(pelicula.genre)
        self.pelicula = pelicula
    }
    //Configuro la serie
    func setupSerie(serie: Serie) {
        let url = URL(string: imagenStringDefault + "\(serie.poster_path)")
        peliculaImageView.kf.setImage(with: url)
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-mm-dd"
        
        let str = serie.date
        let index: String.Index = str.index(str.startIndex, offsetBy: 4)
        yearLabel.text = "(" + str.substring(to: index) + ")"
        
        ratedLabel.text = String(serie.average)
        starImage.image = UIImage(named: "star")
        nameLabel.text = serie.name
        genreLabel.text = String(serie
            .genre)
        self.serie = serie
    }
    
    @IBAction func tapped() -> Void {
        buttonTapDelegate?.tappedUnfav(pelicula: self.pelicula, serie: self.serie)
    }
}

