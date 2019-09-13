//
//  SearchResultsTableViewController.swift
//  proyectoFinal
//
//  Created by Luciana Ines Ezcurra on 28/06/2019.
//  Copyright © 2019 dh.proyectofinal. All rights reserved.
//

import UIKit

class SearchResultsTableViewController: UITableViewController {
    
    var selected: Int?
    var query: String?
    var peliculas: [Pelicula] = []
    var series: [Serie] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if selected == 0 {
            let peliculasService = ServicePeliculas()
            peliculasService.search(query: query) { (peliculas) in
                self.peliculas = peliculas
                self.tableView.reloadData()
            }
        } else {
            let seriesService = ServiceSeries()
            seriesService.search(query: query) { (series) in
                self.series = series
                self.tableView.reloadData()
            }
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         if selected == 0 {
            return peliculas.count
         } else {
            return series.count
            }
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "celda-search", for: indexPath)
        
        if selected == 0 {
            if let customCell = cell as? SearchResultsTableViewCell {
            customCell.setup(pelicula: peliculas[indexPath.row])
            }
        } else {
            if let customCell = cell as? SearchResultsTableViewCell {
                customCell.setup(serie: series[indexPath.row])
            }
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if selected == 0 {
            if let detallePeliculaVC = storyboard?.instantiateViewController(withIdentifier: "detallePelis") as? ViewControllerDetalle {
                detallePeliculaVC.pelicula = self.peliculas[indexPath.row]
                self.navigationController?.pushViewController(detallePeliculaVC, animated: true)
            }
        } else {
            if let seasonsVC = storyboard?.instantiateViewController(withIdentifier: "temporadasVC") as? SeasonsTableViewController {
                seasonsVC.serie = self.series[indexPath.row]
                self.navigationController?.pushViewController(seasonsVC, animated: true)
            }
        }
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
