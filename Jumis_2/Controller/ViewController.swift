//
//  ViewController.swift
//  Jumis
//
//  Created by Isaac Marroquí Penalva on 13/12/22.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    //MARK: Variables
    //TableViewMenu
    var titleName = ["Perfil", "Ajustes", "Cerrar sesión"]
    var imagenes = ["usuario", "ajustes","close"]
    //TableViewTasks
    var tasksBD = Array<Task>()
    var viewOpen: Bool = true
    var nombreUsu: String?
    var emailUsu: String?
    var IDUsu: Int32 = 0
    let labelEmail = UILabel(frame: CGRect(x: 30, y: 120, width: 300, height: 40))
    let labelLista = UILabel(frame: CGRect(x: 30, y: 180, width: 300, height: 40))
    //BBDD
    let dbFunc = DBHelper()
    var aux: Int32 = 0

    //MARK: Outlets
    @IBOutlet weak var contenidoView: UIView!
    @IBOutlet weak var tableViewMenu: UITableView!
    @IBOutlet weak var tableViewTasks: UITableView!
    
    //MARK: Actions
    @IBAction func GoAddTask(_ sender: Any) {
        if let vc = storyboard?.instantiateViewController(identifier: "AddTaskController") as? AddTaskController {
            vc.recibirID = IDUsu
            vc.emailUsu = emailUsu
            vc.nombreUsu = nombreUsu
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    @IBAction func Menu(_ sender: Any) {
        contenidoView.isHidden = false
        tableViewMenu.isHidden = false
        if !viewOpen {
            labelEmail.isHidden = true
            labelLista.isHidden = true
            viewOpen = true
            contenidoView.frame = CGRect(x:0, y: 117, width: 0, height: 100)
            tableViewMenu.frame = CGRect(x:0, y: 0, width: 0, height: 100)
            UIView.animate(withDuration: 1){
                self.contenidoView.frame = CGRect(x:0, y: 117, width: 212, height: 100)
                self.tableViewMenu.frame = CGRect(x:0, y: 0, width: 212, height: 100)
            }
        } else {
            labelEmail.isHidden = false
            labelLista.isHidden = false
            contenidoView.isHidden = true
            tableViewMenu.isHidden = true
            viewOpen = false
            contenidoView.frame = CGRect(x:0, y: 117, width: 0, height: 100)
            tableViewMenu.frame = CGRect(x:0, y: 0, width: 0, height: 100)
            UIView.animate(withDuration: 1){
                self.contenidoView.frame = CGRect(x:0, y: 117, width: 212, height: 100)
                self.tableViewMenu.frame = CGRect(x:0, y: 0, width: 212, height: 100)
            }
        }
    }
    
    //MARK: Functions
    func registerTableCells(){
        tableViewMenu.register(UINib(nibName: "TableViewCellMenu", bundle: nil), forCellReuseIdentifier: "TableViewCellMenu")
        tableViewTasks.register(UINib(nibName: "TableViewCellTask", bundle: nil), forCellReuseIdentifier: "TableViewCellTask")
    }
    
    //MARK: Overrides
    override func viewDidLoad() {
        super.viewDidLoad()
        // Llamada al metodo del tableViewCellMenu
        registerTableCells()
        self.contenidoView.isHidden = true
        viewOpen = true
        self.tableViewMenu.backgroundColor = #colorLiteral(red: 0.1201617494, green: 0.2964957356, blue: 0.3807103634, alpha: 1)

        //Label programmatically
        labelEmail.textColor = .white
        labelEmail.font = labelEmail.font.withSize(40)
        labelEmail.text = "Usuario \(nombreUsu ?? "")"
        self.view.addSubview(labelEmail)
        
        labelLista.textColor = .white
        labelLista.font = labelLista.font.withSize(30)
        labelLista.text = "Lista:"
        self.view.addSubview(labelLista)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        tasksBD = dbFunc.readTaskUser(id: IDUsu)
    }
    
    //MARK: TableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == tableViewMenu {
            return titleName.count
        } else {
            return tasksBD.count
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == tableViewMenu {
            let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCellMenu") as! TableViewCellMenu
            if(indexPath.row == 0) {
                cell.titleLabel.text = nombreUsu
            } else if(indexPath.row == 2) {
                cell.titleLabel.text = titleName[indexPath.row]
                cell.titleLabel.textColor = #colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1)
            } else{
                cell.titleLabel.text = titleName[indexPath.row]
            }
            cell.imageIcon.image = UIImage(named: imagenes[indexPath.row])
            cell.backgroundColor = .black
            return cell
        } else {
            let cellTask = tableView.dequeueReusableCell(withIdentifier: "TableViewCellTask") as! TableViewCellTask
            cellTask.nameTask.text = tasksBD[indexPath.row].nameTask
            return cellTask
        }
    }
   func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       if tableView == tableViewMenu {
           if indexPath.row == 0 {
               if let vc = storyboard?.instantiateViewController(identifier: "UserController") as? UserController {
                   vc.recibirEmail = emailUsu
                   vc.recibirIDUsu = IDUsu
                   self.navigationController?.pushViewController(vc, animated: true)
               }
           } else if indexPath.row == 1 {
               if let vc = storyboard?.instantiateViewController(identifier: "SettingsController") as? SettingsController {
                   self.navigationController?.pushViewController(vc, animated: true)
               }
           } else if indexPath.row == 2 {
                self.navigationController?.popViewController(animated: true)
           }
       } else {
           if let vc = storyboard?.instantiateViewController(identifier: "TaskDetailController") as? TaskDetailController {
               vc.name = tasksBD[indexPath.row].nameTask
               vc.descripcion = tasksBD[indexPath.row].description
               vc.nameList = tasksBD[indexPath.row].nameList
               vc.fecha = tasksBD[indexPath.row].date
               vc.hora = tasksBD[indexPath.row].hour
               self.navigationController?.pushViewController(vc, animated: true)
           }
       }
    }
}
