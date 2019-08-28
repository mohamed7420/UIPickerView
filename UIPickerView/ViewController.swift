//
//  ViewController.swift
//  UIPickerView
//
//  Created by Mohamed on 8/28/19.
//  Copyright © 2019 Mohamed74. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textDateField: UITextField!
    var selctedDay: String?
    var data = ["Saturday" , "Sunday" , "Monday" , "TuesDay" , "thursday" , "wedensday" , "friday"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        makeDatePicker()
       makeToolbar()
        
    }


}
extension ViewController : UIPickerViewDelegate , UIPickerViewDataSource {
  
    
    func makeDatePicker() {
    
        let datePicker = UIPickerView()
        datePicker.delegate = self
        datePicker.dataSource = self
       
        textDateField.inputView = datePicker
        
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        return data.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        return data[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        selctedDay = data[row]
        
        if let selected = selctedDay {
        textDateField.text = selected
        }
        
    }
    
    func makeToolbar(){
        
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        let okButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(ViewController.doneButton))
        toolbar.isUserInteractionEnabled = true
        toolbar.setItems([okButton], animated: false)
        textDateField.inputAccessoryView = toolbar
    }
    
    @objc func doneButton(){
        
        view.endEditing(true)
    }
   
}

