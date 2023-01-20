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
    let countries = ["Spanish", "English"]
    var pickerView = UIPickerView()
    
    //MARK: Outlets
    @IBOutlet weak var countryTextField: UITextField!
    
    //MARK: Override
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pickerView.delegate = self
        pickerView.dataSource = self
        
        countryTextField.inputView = pickerView
        countryTextField.textAlignment = .center
    }
}
extension SettingsController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return countries.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return countries[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        countryTextField.text = countries[row]
        countryTextField.resignFirstResponder()
        
        if(countries[row] == "Spanish"){
            UserDefaults.standard.removeObject(forKey: "AppleLanguages")
            UserDefaults.standard.set(["es"], forKey: "AppleLanguages")
            UserDefaults.standard.synchronize()
            
            let alert = UIAlertController(title: "Idioma", message:"Para realizar cambios en idioma tienes que reinicar la app.", preferredStyle: .alert)
                                
            alert.addAction(UIAlertAction(title: "Aceptar",
                                          style: .default, handler: { _ in
            }))
            
            self.present(alert, animated: true, completion: nil)
        }
                
        if(countries[row] == "English"){
            UserDefaults.standard.removeObject(forKey: "AppleLanguages")
            UserDefaults.standard.set(["en"], forKey: "AppleLanguages")
            UserDefaults.standard.synchronize()
            
            let alert = UIAlertController(title: "Language", message:"To make language changes you have to restart the app.", preferredStyle: .alert)
                                
            alert.addAction(UIAlertAction(title: "Accept", style: .default, handler: { _ in
            }))
            
            self.present(alert, animated: true, completion: nil)
        }
    }
}
