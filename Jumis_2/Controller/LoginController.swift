//
//  LoginViewController.swift
//  Jumis
//
//  Created by ucam on 23/11/22.
//  Copyright © 2022 ucam. All rights reserved.
//

import UIKit
import QuartzCore

class LoginController: UIViewController {
    
    //MARK: Global
    static var sessionActive = 0
    static var email = ""
    
    //MARK: Outlets
    @IBOutlet weak var usuario: UITextField!{
        didSet{
            let colorWhite = NSAttributedString(string: "Usuario",
                                                attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
            usuario.attributedPlaceholder = colorWhite
        }
    }
    
    @IBOutlet weak var login: UIButton!
    @IBOutlet weak var registro: UIButton!
    @IBOutlet weak var logo: UIImageView!
    
    @IBOutlet weak var contrasena: UITextField!{
        didSet{
            let colorWhite = NSAttributedString(string: "Contraseña",
                                                attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
            contrasena.attributedPlaceholder = colorWhite
            
        }
    }
    
    //MARK: Override
    override func viewDidLoad() {
        super.viewDidLoad()
        login.layer.cornerRadius = 15.0
        login.layer.masksToBounds = true
        registro.layer.cornerRadius = 15.0
        registro.layer.masksToBounds = true
        
        logo.layer.cornerRadius = logo.frame.width / 2
        logo.layer.masksToBounds = true
    }
        
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    //MARK: Action buttons
    @IBAction func login(_ sender: Any) {
        if(usuario.text == "" && contrasena.text == "")
        {
            //Mostrar alerta si no hay datos introducidos en el formulario
            let alert = UIAlertController(title: "Identificación", message:"Campo de usuario y contraseña vacios", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "Aceptar", style: .default, handler: { _ in
                //Cancel Action
            }))
            
            self.present(alert, animated: true, completion: nil)
        }
        else
        {
            //Asignamos a la variable global el email
            LoginController.email = usuario.text!
            LoginController.sessionActive = 1
        }
    }
}
