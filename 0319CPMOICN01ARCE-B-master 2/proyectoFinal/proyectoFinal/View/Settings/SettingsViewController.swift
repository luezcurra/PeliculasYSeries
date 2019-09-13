//
//  SettingsViewController.swift
//  proyectoFinal
//
//  Created by Agustin Errecalde on 28/07/2019.
//  Copyright © 2019 dh.proyectofinal. All rights reserved.
//

import UIKit
import FirebaseUI
import FirebaseStorage



class SettingsViewController: UIViewController{
    
    @IBOutlet weak var textSegundos: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func logoutTap(_ sender: Any) {
        let alert = UIAlertController(title: "LogOut", message: "Seguro desea deslogearse de Crabflix?", preferredStyle: .alert)
        let ok = UIAlertAction(title: "Continuar", style: .default, handler: { action in
            let authUI = FUIAuth.defaultAuthUI()
                do {
                    try authUI?.signOut()
                    self.tabBarController?.performSegue(withIdentifier: "logout", sender: nil)
//                    if let loginVC = self.storyboard?.instantiateViewController(withIdentifier: "loginVC") as? LoginViewController {
//                        self.navigationController?.pushViewController(loginVC, animated: true)
//                    }
                } catch {
                    print(error)
                }

            })
            let cancel = UIAlertAction(title: "Cancel", style: .default, handler: { action in
                
            })
            alert.addAction(cancel)
            alert.addAction(ok)
            DispatchQueue.main.async(execute: {
                self.present(alert, animated: true)
            })
        }
    
    
    @IBAction func modificarSegundos(_ sender: Any) {
        let segundos = self.textSegundos.text
        UserDefaults.standard.set(segundos, forKey: "time")
        
    }
    
    
    
    
    

}
