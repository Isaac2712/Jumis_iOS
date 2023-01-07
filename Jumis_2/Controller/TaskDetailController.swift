//
//  TaskDetailController.swift
//  Jumis
//
//  Created by Isaac Marroquí Penalva on 7/1/23.
//

import UIKit

class TaskDetailController: UIViewController {
    
    //MARK: Variables
    var name: String?
    var descripcion: String?
    var nameList: String?
    var fecha: String?
    var hora: String?

    //MARK: Outlets
    @IBOutlet weak var nameTask: UITextField!
    @IBOutlet weak var descriptionTask: UITextView!
    @IBOutlet weak var nameListTask: UITextField!
    @IBOutlet weak var fechaHoraTask: UITextField!
    
    //MARK: Override
    override func viewDidLoad() {
        super.viewDidLoad()

        nameTask.text = name
        descriptionTask.text = descripcion
        nameListTask.text = nameList
        fechaHoraTask.text = fecha
    }
}
