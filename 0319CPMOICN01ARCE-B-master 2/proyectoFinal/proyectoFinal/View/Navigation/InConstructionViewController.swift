//
//  InConstructionViewController.swift
//  proyectoFinal
//
//  Created by Agustin Errecalde on 09/06/2019.
//  Copyright © 2019 dh.proyectofinal. All rights reserved.
//

import UIKit

class InConstructionViewController: UIViewController {
    @IBOutlet weak var lblConstruction: UIImageView!
    @IBOutlet weak var imageNombre: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblConstruction.image = UIImage(named: "inConstruction")
        imageNombre.image = UIImage(named: "logoNombre")
    }
}
