//
//  TableViewControllerLista.swift
//  proyectoFinal
//
//  Created by Agustin Errecalde on 31/05/2019.
//  Copyright © 2019 dh.proyectofinal. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase

class TableViewControllerLista: UITableViewController {

    var arrayPeliculas: [Pelicula] = []
    var arrayGenre: [Genre] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loader()
         let peliculasService = ServicePeliculas()
        peliculasService.getPeliculas { (peliculas) in
                self.arrayPeliculas = peliculas
            
        let genreService = ServiceGenre()
            genreService.getGenre  { (genre) in
                self.arrayGenre = genre
                self.tableView.reloadData()
            }
        }
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return arrayPeliculas.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "celda-peliculas", for: indexPath)

        if let customCell = cell as? TableViewCellPeliculas {
            customCell.setup(pelicula: arrayPeliculas[indexPath.row])
        }

        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let detalle = segue.destination as? ViewControllerDetalle {
            if let posicionSeleccionada = tableView.indexPathForSelectedRow?.row {
                detalle.pelicula = arrayPeliculas[posicionSeleccionada]
            }
        }
    }
    func loader() {
        if let loaderViewController = storyboard?.instantiateViewController(withIdentifier: "loaderVC") as? LoaderViewController {
            loaderViewController.timer = 1
            self.present(loaderViewController, animated: false)
        }
    }
}
