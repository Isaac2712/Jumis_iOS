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
    
    //MARK: Variables
    var recibirEmailRegistro: String = ""
    var recibirPassRegistro: String = ""
    var dbFunc = DBHelper()
    
    //MARK: Global
    //static var sessionActive = 0
    //static var email = ""
    
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
        
        usuario.text = recibirEmailRegistro
        contrasena.text = recibirPassRegistro
        
        login.layer.cornerRadius = 15.0
        login.layer.masksToBounds = true
        registro.layer.cornerRadius = 15.0
        registro.layer.masksToBounds = true
        
        logo.layer.cornerRadius = logo.frame.width / 2
        logo.layer.masksToBounds = true
    }
        
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
        //El valor true, es para desaparecer la barra
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
        //El valor false, vuelve a poner el navigation bar para el próximo viewcontroller.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueLoginToHome"
        {
            if(usuario.text == "" || contrasena.text == "")
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
                //Comprobamos que existe en la BBDD
                var existe: Bool = false
                existe = dbFunc.existsUserLogin(email: usuario.text!, pass: contrasena.text!)
                if existe
                {
                    let vc = segue.destination as? ViewController
                    vc?.emailUsu = usuario.text!
                } else
                {
                    //Mostrar alerta si no existe el usuario en la BBDD
                    let alert = UIAlertController(title: "Identificación", message:"El usuario y contraseña no son correctos", preferredStyle: .alert)
                    
                    alert.addAction(UIAlertAction(title: "Aceptar", style: .default, handler: { _ in
                        //Cancel Action
                    }))
                    
                    self.present(alert, animated: true, completion: nil)
                }
            }
        }
    }
    
    //MARK: Action buttons
}
