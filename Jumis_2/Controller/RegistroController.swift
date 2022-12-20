//
//  RegistroController.swift
//  Jumis
//
//  Created by Isaac Marroquí Penalva on 20/12/22.
//

import UIKit

class RegistroController: UIViewController {
    
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
    @IBOutlet weak var buttonSignUp: UIButton!
    @IBOutlet weak var fechaNacimientoUsu: UIDatePicker!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
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
            let email = emailUsu.text ?? ""
            let vc = segue.destination as! LoginController
            vc.recibirEmailRegistro = email
        }
    }
    
    //MARK: Override
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    //MARK: Action buttons
}
