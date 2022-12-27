//
//  UserController.swift
//  Jumis
//
//  Created by Isaac Marroquí Penalva on 13/12/22.
//

import UIKit

class UserController: UIViewController {
    
    //MARK: Variables
    var recibirEmail: String!
    
    //MARK: Outlets
    @IBOutlet weak var nombreUsuario: UILabel!
    @IBOutlet weak var emailUsuario: UITextField!
    @IBOutlet weak var contrasenaUsuario: UITextField!
    @IBOutlet weak var fechaNacimientoUsuario: UITextField!
    @IBOutlet weak var modificarUser: UIButton!
    @IBOutlet weak var guardarUser: UIButton!
    @IBOutlet weak var cancelarUser: UIButton!
    
    //MARK: Actions
    @IBAction func Modificar(_ sender: Any) {
        //Deshabilitar campos
        emailUsuario.isUserInteractionEnabled = true
        contrasenaUsuario.isUserInteractionEnabled = true
        
        //Deshabilitar botones
        self.guardarUser.isHidden = false
        self.cancelarUser.isHidden = false
    }
   
    @IBAction func Guardar(_ sender: Any) {
        //Deshabilitar campos
        emailUsuario.isUserInteractionEnabled = false
        contrasenaUsuario.isUserInteractionEnabled = false
        
        //Campo contraseña
        contrasenaUsuario.textContentType = .oneTimeCode
        
        //Deshabilitar y habilitar botones
        self.modificarUser.isHidden = false
        self.guardarUser.isHidden = true
        self.cancelarUser.isHidden = true
        //Guardar usuario BBDD
    }
    
    @IBAction func Cancelar(_ sender: Any) {
        //Deshabilitar campos
        emailUsuario.isUserInteractionEnabled = false
        contrasenaUsuario.isUserInteractionEnabled = false
        
        //Deshabilitar y habilitar botones
        self.modificarUser.isHidden = false
        self.guardarUser.isHidden = true
        self.cancelarUser.isHidden = true
    }
    
    //MARK: Overrides
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //No se pueden modificar hasta darle a buttonModificar
        emailUsuario.isUserInteractionEnabled = false
        contrasenaUsuario.isUserInteractionEnabled = false
        fechaNacimientoUsuario.isUserInteractionEnabled = false
        
        //Recogemos email usuario de login
        emailUsuario.text = recibirEmail
        
        //Boton guardar nuevos datos usuario oculto
        guardarUser.isHidden = true
        cancelarUser.isHidden = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
