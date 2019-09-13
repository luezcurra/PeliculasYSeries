//
//  LoaderViewController.swift
//  proyectoFinal
//
//  Created by Agustin Errecalde on 07/08/2019.
//  Copyright © 2019 dh.proyectofinal. All rights reserved.
//

import UIKit

class LoaderViewController: UIViewController {
    @IBOutlet weak var uimageViewLogo: UIImageView!

    var timer: Double = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        uimageViewLogo.layer.cornerRadius = uimageViewLogo.bounds.size.width/5
        start()
    }
    

     func start() {
        Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        
    }
    
    @objc func updateTimer() {
        //example functionality
        if timer > 0 {
            timer -= 1
        } else if (timer == 0) {
            dismiss(animated: false, completion: nil)
        }
    }

}
