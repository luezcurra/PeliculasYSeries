//
//  LoginViewController.swift
//  proyectoFinal
//
//  Created by Agustin Errecalde on 22/07/2019.
//  Copyright © 2019 dh.proyectofinal. All rights reserved.
//

import UIKit
import FirebaseUI
import FirebaseStorage
import FBSDKCoreKit

class LoginViewController: UIViewController, FUIAuthDelegate  {
    @IBOutlet weak var logo: UIImageView!
    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var logoutBtn: UIButton!
    @IBOutlet weak var sesionLabel: UILabel!
    @IBOutlet weak var goBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        actualizarPantalla()
        let authUI = FUIAuth.defaultAuthUI()
        authUI?.delegate = self
        // Configurar los providers que vamos a usar
        let providers: [FUIAuthProvider] = [FUIEmailAuth(), FUIGoogleAuth(), FUIFacebookAuth()]
        authUI?.providers = providers
        
    }
    @IBAction func loginTap(_ sender: Any) {
        if let authUI = FUIAuth.defaultAuthUI() {
            let authViewController = authUI.authViewController()
            present(authViewController, animated: true) {
            }
        }
    }
    
    func authUI(_ authUI: FUIAuth, didSignInWith authDataResult: AuthDataResult?, error: Error?) {
        actualizarPantalla()
    }

    func actualizarPantalla() {
        if let user = Auth.auth().currentUser {
            loginBtn.isHidden = true
            sesionLabel.isHidden = true
            goBtn.isHidden = false
            logoutBtn.isHidden = false
        } else {
            loginBtn.isHidden = false
            sesionLabel.isHidden = false
            goBtn.isHidden = true
            logoutBtn.isHidden = true
            }
        }
    @IBAction func logoutTap(_ sender: Any) {
        let alert = UIAlertController(title: "LogOut", message: "Seguro desea deslogearse de Crabflix?", preferredStyle: .alert)
        let ok = UIAlertAction(title: "Continuar", style: .default, handler: { action in
            let authUI = FUIAuth.defaultAuthUI()
            do {
                try authUI?.signOut()
            } catch {
                print(error)
            }
            self.actualizarPantalla()
            //            self.dismiss(animated: true, completion: nil)
        })
        let cancel = UIAlertAction(title: "Cancel", style: .default, handler: { action in
            
        })
        alert.addAction(cancel)
        alert.addAction(ok)
        DispatchQueue.main.async(execute: {
            self.present(alert, animated: true)
        })
    }
    @IBAction func goAppTap(_ sender: Any) {
        performSegue(withIdentifier: "login-segue", sender: nil)
    }
    
}
