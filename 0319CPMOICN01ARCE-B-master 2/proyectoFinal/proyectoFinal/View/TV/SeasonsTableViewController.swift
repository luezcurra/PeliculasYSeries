//
//  SeasonsTableViewController.swift
//  proyectoFinal
//
//  Created by Agustin Errecalde on 27/07/2019.
//  Copyright © 2019 dh.proyectofinal. All rights reserved.
//

import UIKit

class SeasonsTableViewController: UITableViewController {

    var serie: Serie?
    var arraySeasons: [Season] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let seasonService = ServiceSeries()
        seasonService.getSeason(tvId: serie?.id) { (seasons) in
            self.arraySeasons = seasons
            self.tableView.reloadData()
        }
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return arraySeasons.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "season-cell", for: indexPath)

        cell.textLabel?.text = arraySeasons[indexPath.row].name
        
        if arraySeasons[indexPath.row].episodes > 1 {
        cell.detailTextLabel?.text = String(arraySeasons[indexPath.row].episodes) + " episodes"
        } else {
            cell.detailTextLabel?.text = String(arraySeasons[indexPath.row].episodes) + " episode"
            }
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let episode = segue.destination as? EpisodeTableViewController {
            if let posicionSeleccionada = tableView.indexPathForSelectedRow?.row {
                episode.serie = serie
                episode.season = arraySeasons[posicionSeleccionada]
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
