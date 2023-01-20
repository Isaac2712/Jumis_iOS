//
//  TaskDetailController.swift
//  Jumis
//
//  Created by Isaac Marroquí Penalva on 7/1/23.
//

import UIKit

class TaskDetailController: UIViewController {
    
    //MARK: Variables
    var idTask: Int32 = -1
    var name: String?
    var descripcion: String?
    var nameList: String?
    var fecha: String?
    var hora: String?
    //BBDD
    let dbFunc = DBHelper()
    //Usuario
    var recibirID:Int32 = 0
    var emailUsu: String?
    var nombreUsu: String?

    //MARK: Outlets
    @IBOutlet weak var nameTask: UITextField!
    @IBOutlet weak var descriptionTask: UITextView!
    @IBOutlet weak var nameListTask: UITextField!
    @IBOutlet weak var fechaHoraTask: UITextField!
    @IBOutlet weak var eliminarTarea: UIButton!
    
    //MARK: Override
    override func viewDidLoad() {
        super.viewDidLoad()

        nameTask.text = name
        descriptionTask.text = descripcion
        nameListTask.text = nameList
        fechaHoraTask.text = hora
    }
    
    
    @IBAction func eliminarTarea(_ sender: Any) {
        dbFunc.deleteTaskByID(id: idTask)
        if let vc = storyboard?.instantiateViewController(identifier: "ViewController") as? ViewController {
            vc.IDUsu = recibirID
            vc.emailUsu = emailUsu
            vc.nombreUsu = nombreUsu
            self.navigationController?.pushViewController(vc, animated: false)
        }
    }
}
