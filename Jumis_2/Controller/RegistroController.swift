//
//  RegistroController.swift
//  Jumis
//
//  Created by Isaac Marroquí Penalva on 20/12/22.
//

import UIKit

class RegistroController: UIViewController {
    
    //MARK: Variables
    var idUsuario: Int32 = 0
    var nombre: String = ""
    var email: String = ""
    var contrasena: String = ""
    let dateFormater = DateFormatter()
    var dbFunc = DBHelper()
    
    //MARK: Outlets
    @IBOutlet weak var nombreUsu: UITextField!{
        didSet{
            let colorWhite = NSAttributedString(string: "Introduce nombre de usuario",
                                                attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
            nombreUsu.attributedPlaceholder = colorWhite
        }
    }
    
    @IBOutlet weak var emailUsu: UITextField!{
        didSet{
            let colorWhite = NSAttributedString(string: "Introduce tu correo eléctronico",
                                                attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
            emailUsu.attributedPlaceholder = colorWhite
        }
    }
    
    @IBOutlet weak var contrasenaUsu: UITextField!{
        didSet{
            let colorWhite = NSAttributedString(string: "Contraseña",
                                                attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
            contrasenaUsu.attributedPlaceholder = colorWhite
        }
    }
    @IBOutlet weak var fechaNacimientoUsu: UIDatePicker!

    //MARK: Override
    override func viewDidLoad() {
        super.viewDidLoad()
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
    
    //MARK: Action buttons
    @IBAction func CuentaYaCreada(_ sender: Any) {
        if let vc = storyboard?.instantiateViewController(identifier: "LoginController") as? LoginController {
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    @IBAction func SignUp(_ sender: Any) {
        if(nombreUsu.text == "" || emailUsu.text == "" || contrasenaUsu.text == "")
        {
            let alert = UIAlertController(title: "Formulario", message:"Hay campos vacios", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "Aceptar", style: .default, handler: { _ in
                //Cancel Action
            }))
            
            self.present(alert, animated: true, completion: nil)
        }
        else
        {
            nombre = nombreUsu.text!
            email = emailUsu.text!
            contrasena = contrasenaUsu.text!
            let emailConsult = dbFunc.existsUser(email: email)
            if emailConsult == "-1" { //Comprobar que no existe el usuario con ese email en la BBDD
                dbFunc.insertUser(nombre: nombre, email: email, pass: contrasena, fecha_nac: dateFormater.string(from: fechaNacimientoUsu.date))
                let email = emailUsu.text ?? ""
                let pass = contrasenaUsu.text ?? ""
                if let vc = storyboard?.instantiateViewController(identifier: "LoginController") as? LoginController {
                    vc.recibirEmailRegistro = email
                    vc.recibirPassRegistro = pass
                    navigationController?.pushViewController(vc, animated: true)
                }
            }
            else {
                let alert = UIAlertController(title: "Formulario", message:"El email ya existe", preferredStyle: .alert)
                
                alert.addAction(UIAlertAction(title: "Aceptar", style: .default, handler: { _ in
                    //Cancel Action
                }))
                
                self.present(alert, animated: true, completion: nil)
            }
        }
    }
}
