//
//  TableViewCellPeliculas.swift
//  proyectoFinal
//
//  Created by Luciana Ines Ezcurra on 02/06/2019.
//  Copyright © 2019 dh.proyectofinal. All rights reserved.
//

import UIKit
import Kingfisher
import FirebaseAuth
import FirebaseDatabase


class TableViewCellPeliculas: UITableViewCell {
    
    let imagenStringDefault: String = "https://image.tmdb.org/t/p/w500"
    @IBOutlet weak var peliculaImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var genreLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var ratedLabel: UILabel!
    @IBOutlet weak var starImage: UIImageView!
    var pelicula: Pelicula?
    var usuario: Usuario?
    
    
    func setup(pelicula: Pelicula) {
        self.pelicula = pelicula
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
    }
    
    func setGenre(genre: Genre) {
        
        
    }
    @IBAction func favTap(_ sender: Any) {
        let ref = Database.database().reference()
        if let uid = Auth.auth().currentUser?.uid {
            ref.child("usuarios").child(uid).observeSingleEvent(of: DataEventType.value) { (snapshot) in
                
                var usuario: Usuario
                if let usuariosDictionary = snapshot.value as? [String: AnyObject] {
                    // el usuario existe
                    usuario = Usuario(dictionary: usuariosDictionary)
                    usuario.id = uid
                } else {
                   // no existe
                    usuario = Usuario(id: uid)
                }

                // el usuario existe
                if let pelicula = self.pelicula {
                    var repetida = true
                    
                    if usuario.favPeliculas.count > 0 {
                    for pelis in usuario.self.favPeliculas {
                            if pelis.id != pelicula.id {
                                repetida = false
                            } else {
                                repetida = true
                                break
                                }
                        }
                    } else {
                        repetida = false
                    }
                    if repetida == false {
                        usuario.favPeliculas.append(pelicula)
                        ref.child("usuarios").child(uid).setValue(usuario.toDictionary())
                    }
                }
            
            }
        }
    }
}
