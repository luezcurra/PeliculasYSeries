//
//  ViewControllerDetalle.swift
//  proyectoFinal
//
//  Created by Agustin Errecalde on 31/05/2019.
//  Copyright © 2019 dh.proyectofinal. All rights reserved.
//

import UIKit
import Kingfisher

class ViewControllerDetalle: UIViewController {
    
    let imagenStringDefault: String = "https://image.tmdb.org/t/p/w500"
    @IBOutlet weak var peliculaImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var genreLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var descriptionTxt: UITextView!
    @IBOutlet weak var imageLogo: UIImageView!
    @IBOutlet weak var btnPlay: UIButton!
    
    var pelicula: Pelicula?
    var genre: Genre?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageLogo.image = UIImage(named: "logoDef")
        title = "Detalle"
        btnPlay.layer.cornerRadius = 5
        btnPlay.layer.borderWidth = 1
        
        if let pelicula = pelicula {
            let url = URL(string: imagenStringDefault + "\(pelicula.backdrop_path)")
            peliculaImageView.kf.setImage(with: url)
            nameLabel.text = pelicula.name
            genreLabel.text = String(pelicula.genre)
            descriptionTxt.text = pelicula.description
            
            let dateFormatterGet = DateFormatter()
            dateFormatterGet.dateFormat = "yyyy-mm-dd"
            let dateFormatterPrint = DateFormatter()
            dateFormatterPrint.dateFormat = "MMM, yyyy"
            
            if let date = dateFormatterGet.date(from: pelicula.date) {
                yearLabel.text = dateFormatterPrint.string(from: date)
            } else {
                yearLabel.text = "Unknow date"
            }

            
        }
    }
    
    @IBAction func actionRepPelicula(_ sender: Any) {
        if let detallePeliculaViewController = storyboard?.instantiateViewController(withIdentifier: "reproductor") as? TrailerViewController {
            detallePeliculaViewController.movieID = pelicula?.id
            self.navigationController?.pushViewController(detallePeliculaViewController, animated: true)
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
