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
    var titleName = ["User", "Settings", "Cerrar sesión"]
    var imagenes = ["usuario", "ajustes","close"]
    //TableViewTasks
    var tasks = ["Tarea1", "Tarea2"]
    var viewOpen: Bool = true
    var emailUsu: String?
    let label = UILabel(frame: CGRect(x: 30, y: 120, width: 200, height: 20))

    //MARK: Outlets
    @IBOutlet weak var contenidoView: UIView!
    @IBOutlet weak var tableViewMenu: UITableView!
    @IBOutlet weak var tableViewTasks: UITableView!
    
    //MARK: Actions
    @IBAction func Menu(_ sender: Any) {
        contenidoView.isHidden = false
        tableViewMenu.isHidden = false
        if !viewOpen {
            label.isHidden = true
            viewOpen = true
            contenidoView.frame = CGRect(x:0, y: 117, width: 0, height: 100)
            tableViewMenu.frame = CGRect(x:0, y: 0, width: 0, height: 100)
            UIView.animate(withDuration: 1){
                self.contenidoView.frame = CGRect(x:0, y: 117, width: 212, height: 100)
                self.tableViewMenu.frame = CGRect(x:0, y: 0, width: 212, height: 100)
            }
        } else {
            label.isHidden = false
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
        label.textColor = .white
        label.text = "Lista del usuario \(emailUsu ?? "")"
        self.view.addSubview(label)
    }
    
    //MARK: TableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == tableViewMenu {
            return titleName.count
        } else {
            return tasks.count
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == tableViewMenu {
            let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCellMenu") as! TableViewCellMenu
            cell.titleLabel.text = titleName[indexPath.row]
            cell.imageIcon.image = UIImage(named: imagenes[indexPath.row])
            cell.backgroundColor = .black
            return cell
        } else {
            let cellTask = tableView.dequeueReusableCell(withIdentifier: "TableViewCellTask") as! TableViewCellTask
            cellTask.nameTask.text = tasks[indexPath.row]
            return cellTask
        }
    }
   func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       if tableView == tableViewMenu {
           if indexPath.row == 0 {
               if let vc = storyboard?.instantiateViewController(identifier: "UserController") as? UserController {
                   vc.recibirEmail = emailUsu
                   self.navigationController?.pushViewController(vc, animated: true)
               }
           } else if indexPath.row == 1 {
               if let vc = storyboard?.instantiateViewController(identifier: "SettingsController") as? SettingsController {
                   self.navigationController?.pushViewController(vc, animated: true)
               }
           } else if indexPath.row == 2 {
                self.navigationController?.popViewController(animated: true)
           }
       } else
       {
       }
    }
}
