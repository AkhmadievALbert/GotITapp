//
//  AddViewController.swift
//  GotITApp
//
//  Created by Albert Ahmadiev on 11.07.2020.
//  Copyright © 2020 Albert Ahmadiev. All rights reserved.
//

import UIKit

class AddViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {

    @IBOutlet weak var daysCountPicker: UIPickerView!
    @IBOutlet weak var targetTextField: UITextField!
    @IBOutlet weak var daysCountLabel: UILabel!
    @IBOutlet weak var addTargetButton: UIButton!
    
    var days = ["Кол-во дней","1","2","3","4","5","6","7","8","9","10",
                "11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31","32","33","34","35","36","37","38","39","40","41","42","43","44","45","46","47","48","49","50","51","52","53","54","55","56","57","58","59","60","61","62","63","64","65","66","67","68","69","70","71","72","73","74","75","76","77","78","79","80","81","82","83","84","85","86","87","88","89","90","91","92","93","94","95","96","97","98","99","100"]
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return days[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return days.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if row == 0 {
            daysCountLabel.text = "?"
        } else {
        daysCountLabel.text = days[row]
        }
    }
    @IBAction func tapRecognizer(_ sender: Any) {
        targetTextField.resignFirstResponder()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        targetTextField.borderStyle = UITextField.BorderStyle.roundedRect
        
        targetTextField.layer.backgroundColor = UIColor(red: 0.939, green: 0.971, blue: 0.914, alpha: 1).cgColor
        
        addTargetButton.layer.backgroundColor = UIColor(red: 0.471, green: 0.792, blue: 0.659, alpha: 1).cgColor
        
        daysCountPicker.delegate = self
        daysCountPicker.dataSource = self
        daysCountLabel.text = "?"
        targetTextField.delegate = self
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    @IBAction func checkAddTarget(_ sender: UIButton) {
        if targetTextField.text!.isEmpty || daysCountLabel.text == "?" {
            let alert = UIAlertController(title: "Ошибка!", message: "Назовите вашу цель и выберите дату", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        } else {
            
        }
    }
    
    
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
