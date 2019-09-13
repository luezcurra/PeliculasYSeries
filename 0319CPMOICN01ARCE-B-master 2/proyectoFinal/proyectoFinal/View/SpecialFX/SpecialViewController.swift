//
//  SpecialViewController.swift
//  proyectoFinal
//
//  Created by Santiago Gegenschatz on 14/07/2019.
//  Copyright © 2019 dh.proyectofinal. All rights reserved.
//

import UIKit


class SpecialViewController: UIViewController {
    var counter = 180
    @IBOutlet var timeLabel: UILabel!
    var arrayPeliculas: [Pelicula] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let peliculasService = ServicePeliculas()
        peliculasService.getPeliculas { (peliculas) in
            self.arrayPeliculas = peliculas }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let time = UserDefaults.standard.integer(forKey: "time")
        counter = Int(time)
    }
    

    @IBAction func start(_ sender: Any) {
        Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)

    }
    
    @objc func updateCounter() {
        //example functionality
        if counter > 0 {
            self.timeLabel.text = ("\(counter) seconds to get an AWESOME randomized audiovisual content")
            counter -= 1
        } else if (counter == 0) {
            timeLabel.text = "Redirecting"
            let randomnumber = Int.random(in: 0..<arrayPeliculas.count)
            if let detallePeliculaViewController = storyboard?.instantiateViewController(withIdentifier: "reproductor") as? TrailerViewController {
                detallePeliculaViewController.movieID = arrayPeliculas[randomnumber].id
                self.navigationController?.pushViewController(detallePeliculaViewController, animated: true)        }
            counter = -1
        }
    }
}
