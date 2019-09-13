//
//  TableViewCellSeries.swift
//  proyectoFinal
//
//  Created by Ag  on 27/06/2019.
//  Copyright © 2019 dh.proyectofinal. All rights reserved.
//

import UIKit
import Kingfisher
import FirebaseAuth
import FirebaseDatabase

class TableViewCellSeries: UITableViewCell {
    
    let imagenStringDefault: String = "https://image.tmdb.org/t/p/w500"
    @IBOutlet weak var serieImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var genreLabel: UILabel!
    @IBOutlet weak var averageLabel: UILabel!
    @IBOutlet weak var starImage: UIImageView!
    var serie: Serie?
    var usuario: Usuario?
    
    
    func setup(serie: Serie) {
        self.serie = serie
        let url = URL(string: imagenStringDefault + "\(serie.poster_path)")
        serieImage.kf.setImage(with: url)
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-mm-dd"
        
        let str = serie.date
        let index: String.Index = str.index(str.startIndex, offsetBy: 4)
        yearLabel.text = "(" + str.substring(to: index) + ")"
        
        averageLabel.text = String(serie.average)
        starImage.image = UIImage(named: "star")
        nameLabel.text = serie.name
        genreLabel.text = String(serie.genre)
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
                
                if let serie = self.serie {
                    var repetida = true
                    
                    if usuario.self.favSeries.count > 0 {
                        for capi in usuario.self.favSeries {
                            if capi.id != serie.id {
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
                            usuario.favSeries.append(serie)
                            ref.child("usuarios").child(uid).setValue(usuario.toDictionary())
                        }
                }
            }
        }
    }
    
    
    
}
