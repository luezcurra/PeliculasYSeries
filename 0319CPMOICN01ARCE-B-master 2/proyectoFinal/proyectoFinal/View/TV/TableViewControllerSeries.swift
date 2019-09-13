//
//  TableViewControllerSeries.swift
//  proyectoFinal
//
//  Created by Ag  on 27/06/2019.
//  Copyright © 2019 dh.proyectofinal. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase

class TableViewControllerSeries: UITableViewController {

    var arraySeries: [Serie] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loader()
        let serieService = ServiceSeries()
        serieService.getSeries { (series) in
            self.arraySeries = series
            self.tableView.reloadData()
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return arraySeries.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "celda-series", for: indexPath)
        
        if let customCell = cell as? TableViewCellSeries {
            customCell.setup(serie: arraySeries[indexPath.row])
        }
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let seasons = segue.destination as? SeasonsTableViewController {
            if let posicionSeleccionada = tableView.indexPathForSelectedRow?.row {
                seasons.serie = arraySeries[posicionSeleccionada]
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

