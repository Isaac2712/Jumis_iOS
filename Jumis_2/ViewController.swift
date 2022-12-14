//
//  ViewController.swift
//  Jumis_2
//
//  Created by Isaac Marroquí Penalva on 13/12/22.
//

import UIKit

class ViewController: UIViewController {
    
    var titleName = ["User", "Settings"]

    @IBOutlet var labelHome: UIView!
    @IBOutlet weak var contenidoView: UIView!
    @IBOutlet weak var tableView: UITableView!
    
    var viewOpen: Bool = true
    
    @IBAction func Menu(_ sender: Any) {
        contenidoView.isHidden = false
        tableView.isHidden = false
        if !viewOpen {
            viewOpen = true
            contenidoView.frame = CGRect(x:0, y: 117, width: 0, height: 208)
            tableView.frame = CGRect(x:0, y: 0, width: 0, height: 208)
            UIView.animate(withDuration: 1){
                self.contenidoView.frame = CGRect(x:0, y: 117, width: 212, height: 208)
                self.tableView.frame = CGRect(x:0, y: 0, width: 212, height: 208)
            }
        } else {
            contenidoView.isHidden = true
            tableView.isHidden = true
            viewOpen = false
            contenidoView.frame = CGRect(x:0, y: 117, width: 0, height: 208)
            tableView.frame = CGRect(x:0, y: 0, width: 0, height: 208)
            UIView.animate(withDuration: 1){
                self.contenidoView.frame = CGRect(x:0, y: 117, width: 212, height: 208)
                self.tableView.frame = CGRect(x:0, y: 0, width: 212, height: 208)
            }
        }
    }
    
    func registerTableCells(){
        tableView.register(UINib(nibName: "TitleTableViewCell", bundle: nil), forCellReuseIdentifier: "TitleTableViewCell")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Llamada al metodo del tableViewCell
        registerTableCells()
        self.contenidoView.isHidden = true
        viewOpen = true
    }
}
extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titleName.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TitleTableViewCell") as! TitleTableViewCell
        cell.titleLabel.text = titleName[indexPath.row]
        cell.backgroundColor = .black
        return cell
    }
   func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       if indexPath.row == 0 {
           if let vc = storyboard?.instantiateViewController(identifier: "UserController") as? UserController {
               self.navigationController?.pushViewController(vc, animated: true)
           }
       } else if indexPath.row == 1 {
           if let vc = storyboard?.instantiateViewController(identifier: "SettingsController") as? SettingsController {
               self.navigationController?.pushViewController(vc, animated: true)
           }
       }
    }
}

