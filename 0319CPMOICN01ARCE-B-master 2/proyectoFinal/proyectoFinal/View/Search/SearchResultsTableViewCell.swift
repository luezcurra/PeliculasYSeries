//
//  SearchResultsTableViewCell.swift
//  proyectoFinal
//
//  Created by Luciana Ines Ezcurra on 28/06/2019.
//  Copyright © 2019 dh.proyectofinal. All rights reserved.
//

import UIKit
import Kingfisher

class SearchResultsTableViewCell: UITableViewCell {
    
    let imagenStringDefault: String = "https://image.tmdb.org/t/p/w500"
    @IBOutlet weak var genreLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var ratedLabel: UILabel!
    @IBOutlet weak var starImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var peliculaImageView: UIImageView!
    
    func setup(pelicula: Pelicula) {
        let url = URL(string: imagenStringDefault + "\(pelicula.poster_path)")
        peliculaImageView.kf.setImage(with: url)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-mm-dd"
        let str = pelicula.date
        if str.count > 0 {
            let index: String.Index = str.index(str.startIndex, offsetBy: 4)
            yearLabel.text = "(" + str.substring(to: index) + ")"
        }
        ratedLabel.text = String(pelicula.average)
        starImage.image = UIImage(named: "star")
        nameLabel.text = pelicula.name
        genreLabel.text = String(pelicula.genre)
    }
    
    func setup(serie: Serie) {
        let url = URL(string: imagenStringDefault + "\(serie.poster_path)")
        peliculaImageView.kf.setImage(with: url)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-mm-dd"
        let str = serie.date
        if str.count > 0 {
            let index: String.Index = str.index(str.startIndex, offsetBy: 4)
            yearLabel.text = "(" + str.substring(to: index) + ")"
        }
        ratedLabel.text = String(serie.average)
        starImage.image = UIImage(named: "star")
        nameLabel.text = serie.name
        genreLabel.text = String(serie.genre)
    }
    
}
