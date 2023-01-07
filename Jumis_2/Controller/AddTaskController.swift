//
//  AddTaskController.swift
//  Jumis
//
//  Created by Isaac Marroquí Penalva on 3/1/23.
//

import UIKit

class AddTaskController: UIViewController{

    //MARK: Variables
    var recibirID:Int32 = 0
    var emailUsu: String?
    var nombreUsu: String?
    
    //MARK: Outlets
    @IBOutlet weak var nameTask: UITextField!
    @IBOutlet weak var descriptionTask: UITextView!
    @IBOutlet weak var nameListTask: UITextField!
    @IBOutlet weak var dateHourTask: UIDatePicker!
    
    let dbFunc = DBHelper()
    let dateFormater = DateFormatter()
    
    var anyo:String = ""
    var hora:String = ""
    
    //MARK: Button Action
    @IBAction func AddTask(_ sender: Any) {
        dateFormater.dateFormat = "HH:MM"
        hora = dateFormater.string(from: dateHourTask.date)
        
        dateFormater.dateFormat = "dd/MM/y"
        anyo = dateFormater.string(from: dateHourTask.date)
        
        if (nameTask.text != "" && descriptionTask.text != "" && nameListTask.text != "") {
            //Insertar tarea en la base de datos
            let taskuserid = dbFunc.idTask()
            dbFunc.insertTask(id: (taskuserid+1), nameTask: nameTask.text!, description: descriptionTask.text!, nameList: nameListTask.text!, date: anyo, hour: hora)
            if (taskuserid != 0) {
                dbFunc.insertUserTask(usertaskid: recibirID, taskuserid: (taskuserid+1))
                if let vc = storyboard?.instantiateViewController(identifier: "ViewController") as? ViewController {
                    vc.IDUsu = recibirID
                    vc.emailUsu = emailUsu
                    vc.nombreUsu = nombreUsu
                    self.navigationController?.pushViewController(vc, animated: false)
                }
            }
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
