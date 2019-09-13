//
//  SearchViewController.swift
//  proyectoFinal
//
//  Created by Luciana Ines Ezcurra on 28/06/2019.
//  Copyright © 2019 dh.proyectofinal. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {
   
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var selectedControl: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func searchTap(_ sender: Any) {
        if let listSearchViewController = storyboard?.instantiateViewController(withIdentifier: "search-results") as? SearchResultsTableViewController {
            listSearchViewController.query = self.searchTextField.text
            listSearchViewController.selected = selectedControl.selectedSegmentIndex
            self.navigationController?.pushViewController(listSearchViewController, animated: true)
        }
        
    }
}
