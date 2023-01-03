//
//  AddTaskController.swift
//  Jumis
//
//  Created by Isaac Marroquí Penalva on 3/1/23.
//

import UIKit

class AddTaskController: UIViewController {

    //MARK: Variables
    var recibiID:Int32 = 0
    
    //MARK: Outlets
    @IBOutlet weak var nameTask: UITextField!
    @IBOutlet weak var descriptionTask: UITextView!
    @IBOutlet weak var nameListTask: UITextField!
    @IBOutlet weak var dateHourTask: UIDatePicker!
    
    //MARK: Button Action
    @IBAction func AddTask(_ sender: Any) {
        if (nameTask.text != "" && descriptionTask.text != "" && nameListTask.text != "") {
            //Insertar tarea en la base de datos
            
        } else{
            let alert = UIAlertController(title: "Añadir tarea", message:"Hay campos vacios", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "Aceptar", style: .default, handler: { _ in
                //Cancel Action
            }))
            
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    //MARK: Override
    override func viewDidLoad() {
        super.viewDidLoad()
        //print("ID DEL USUARIO \(recibiID)")
    }
}
