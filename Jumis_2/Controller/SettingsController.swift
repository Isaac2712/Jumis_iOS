//
//  SettingsController.swift
//  Jumis
//
//  Created by Isaac Marroquí Penalva on 13/12/22.
//

import UIKit

class SettingsController: UIViewController {
    
    //MARK: Variables
    var nameTask: String?
    var index:[String] = []
    
    @IBOutlet weak var optionLanguage: UIButton!
    
    //MARK: Function
    //No me deja poner tu correo para comprobar si esto funciona
    func language(){
        let option = {(action : UIAction) in print(action.title)}
        
        optionLanguage.menu = UIMenu(children : [
            UIAction(title : "Español", state : .on, handler: option),
            UIAction(title : "Inglés", state : .on, handler: option)
        ])
        
    }
    /*
    @IBAction func newLanguage(_ sender: Any) {
        
        let index = optionLanguage.index(ofAccessibilityElement: <#T##Any#>)
        print(index)
        if(index == 0){
            UserDefaults.standard.removeObject(forKey: "AppleLanguages")
            UserDefaults.standard.set(["es"], forKey: "AppleLanguages")
            UserDefaults.standard.synchronize()
        }
        
        if(index == 1){
            UserDefaults.standard.removeObject(forKey: "AppleLanguages")
            UserDefaults.standard.set(["en"], forKey: "AppleLanguages")
            UserDefaults.standard.synchronize()
        }
        
        
        //UserDefaults.standard.set(language, forKey: "Font Size")
    }
    
    */
    @IBOutlet weak var lbTipografia: UILabel!
    //MARK: Override
    override func viewDidLoad() {
        super.viewDidLoad()
        language()
    }
}
