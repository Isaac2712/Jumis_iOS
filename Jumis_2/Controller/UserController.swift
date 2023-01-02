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
    var dbFunc = DBHelper()
    var dataUser = Array<User>()
    
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
        //Habilitar campos
        emailUsuario.isUserInteractionEnabled = true
        contrasenaUsuario.isUserInteractionEnabled = true
        fechaNacimientoUsuario.isUserInteractionEnabled = true
        
        //Quitamos puntitos contraseña
        contrasenaUsuario.isSecureTextEntry = false
        
        //Deshabilitar botones
        self.guardarUser.isHidden = false
        self.cancelarUser.isHidden = false
    }
    
    @IBAction func Guardar(_ sender: Any) {
        //Guardar usuario BBDD
        var oldEmail:String! = dataUser[0].email
        if(emailUsuario.text != "" && contrasenaUsuario.text != "" && fechaNacimientoUsuario.text != "")
        {
            //Deshabilitar y habilitar botones
            self.modificarUser.isHidden = false
            self.guardarUser.isHidden = true
            self.cancelarUser.isHidden = true
            
            //Deshabilitar campos
            emailUsuario.isUserInteractionEnabled = false
            contrasenaUsuario.isUserInteractionEnabled = false
            fechaNacimientoUsuario.isUserInteractionEnabled = false
            
            //Campo contraseña
            contrasenaUsuario.textContentType = .oneTimeCode
            contrasenaUsuario.isSecureTextEntry = true
            
            // El email antiguo nos interesa recogerlo antes del guardar para mandarselo al update
            var email:String! = emailUsuario.text!
            var pass:String! = contrasenaUsuario.text!
            var fecha:String! = fechaNacimientoUsuario.text!
            
            dbFunc.updateUser(oldEmail: oldEmail, email: email, pass: pass, fecha: fecha)
            
            
        } else {
            let alert = UIAlertController(title: "Formulario", message:"Hay campos vacios", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "Aceptar", style: .default, handler: { _ in
                //Cancel Action
            }))
            
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    @IBAction func Cancelar(_ sender: Any) {
        //Deshabilitar campos
        emailUsuario.isUserInteractionEnabled = false
        contrasenaUsuario.isUserInteractionEnabled = false
        fechaNacimientoUsuario.isUserInteractionEnabled = false
        
        emailUsuario.text = recibirEmail
        contrasenaUsuario.text = dataUser[0].password
        fechaNacimientoUsuario.text = dataUser[0].fecha_nacimiento
        
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
        dataUser = dbFunc.dataUser(email: (emailUsuario.text ?? ""))
        nombreUsuario.text = dataUser[0].nombre
        emailUsuario.text = dataUser[0].email
        contrasenaUsuario.text = dataUser[0].password
        fechaNacimientoUsuario.text = dataUser[0].fecha_nacimiento
        
        //Boton guardar nuevos datos usuario oculto
        guardarUser.isHidden = true
        cancelarUser.isHidden = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
