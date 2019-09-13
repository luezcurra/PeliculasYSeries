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

class FavPeliculasTableViewController: UITableViewController, TapDelegate {

    var arrayHeaders: [String] = ["Peliculas", "Series"]
    var arrayPeliculas: [Pelicula] = []
    var arraySeries: [Serie] = []
    var arrayGenre: [Genre] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        loader()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let ref = Database.database().reference()
        guard let uid = Auth.auth().currentUser?.uid else {
            return
        }
        ref.child("usuarios").child(uid).observeSingleEvent(of:DataEventType.value) { (snapshot) in
            if let peliculasDictionary = snapshot.value as? [String: AnyObject], let seriesDictionary = snapshot.value as? [String: AnyObject] {
                self.arrayPeliculas.removeAll()
                self.arraySeries.removeAll()

                if let favPeliculas = peliculasDictionary["favPeliculas"] as? [[String: AnyObject]] {
                    for peliculaDictionary in favPeliculas {
                        let pelicula = Pelicula(dictionary: peliculaDictionary)
                        self.arrayPeliculas.append(pelicula)
                    }
                }
                if let favSeries = seriesDictionary["favSeries"] as? [[String: AnyObject]] {
                    for seriesDictionary in favSeries {
                        let serie = Serie(dictionary: seriesDictionary)
                        self.arraySeries.append(serie)
                    }
                }
                self.tableView.reloadData()
            }
        }
    }

    override func numberOfSections(in tableView: UITableView) -> Int {

        return arrayHeaders.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return arrayPeliculas.count
        } else {
            return arraySeries.count
        }
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell-fav-pelicula", for: indexPath)

        if let stateCell = cell as? FavPeliculasTableViewCell {
            stateCell.buttonTapDelegate = self
         let headers = arrayHeaders[indexPath.section]
            if headers == "Peliculas" {
                let pelicula = arrayPeliculas[indexPath.row]
                stateCell.setup(pelicula: pelicula)
            } else {
                let serie = arraySeries[indexPath.row]
                stateCell.setupSerie(serie: serie)
            }
        }
        return cell
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let header = arrayHeaders[section]
        return header
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            if let detallePeliculaVC = storyboard?.instantiateViewController(withIdentifier: "detallePelis") as? ViewControllerDetalle {
                detallePeliculaVC.pelicula = self.arrayPeliculas[indexPath.row]
                self.navigationController?.pushViewController(detallePeliculaVC, animated: true)
            }
        } else {
            if let seasonsVC = storyboard?.instantiateViewController(withIdentifier: "temporadasVC") as? SeasonsTableViewController {
                seasonsVC.serie = self.arraySeries[indexPath.row]
                self.navigationController?.pushViewController(seasonsVC, animated: true)
            }
        }
    }
    
    func tappedUnfav(pelicula: Pelicula?, serie: Serie?) {
        DispatchQueue.main.async { self.tableView.reloadData() }
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
                    if let pelicula = pelicula {
                        var position = 0
                        for peliculaUnfav in usuario.favPeliculas {
                            if peliculaUnfav.id == pelicula.id {
                                
                                usuario.favPeliculas.remove(at: position)
                                ref.child("usuarios").child(uid).setValue(usuario.toDictionary())
                            }
                            position += 1
                        }
                        DispatchQueue.main.async { self.tableView.reloadData() }
                        self.loader()
                    }
                    if let serie = serie {
                        var position = 0
                        for serieUnfav in usuario.favSeries {
                            if serieUnfav.id == serie.id {
                                
                                usuario.favSeries.remove(at: position)
                                ref.child("usuarios").child(uid).setValue(usuario.toDictionary())
                            }
                            position += 1
                        }
                        DispatchQueue.main.async { self.tableView.reloadData() }
                        self.loader()
                    }
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
