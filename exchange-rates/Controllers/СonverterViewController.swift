//
//  СonverterViewController.swift
//  exchange rates
//
//  Created by APPLE on 08.03.2022.
//

import UIKit

class ConverterViewController: UIViewController {
    
    let converterServices = RatesAPI()
    var arrayConverter: RatesModelDTO?
    var arrayNameValute:[String] = []
    var converterView: ConverterView {return self.view as! ConverterView}
    
    override func loadView() {
        super.loadView()
        self.view = ConverterView(frame: UIScreen.main.bounds)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        converterView.onAction = {[weak self] in
            guard let self = self  else {return}
            
            self.actionButton()
        }
        
        converterServices.getRates {  rates, _   in
            self.arrayConverter = rates
            
            self.arrayConverter?.valute.forEach({ (key: String, _ ) in
                self.arrayNameValute.append(key)
            })
            
            DispatchQueue.main.async {
                self.converterView.pickerValute.delegate = self
                self.converterView.pickerValute.dataSource = self
                self.converterView.pickerValute.reloadAllComponents()
               
            }
            
        }
        self.converterView.pickerValute.isHidden = true
        converterView.textFieldRUB.delegate = self
        converterView.textFieldValute.delegate = self
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.tapGesture))
                view.addGestureRecognizer(tapGesture)
    }
    
    @objc func tapGesture() {
        converterView.textFieldRUB.resignFirstResponder()
      }
    
    func actionButton() {
        if converterView.pickerValute.isHidden {
            converterView.pickerValute.isHidden = false
        } else {
            converterView.pickerValute.isHidden = true
        }
        
        converterView.textFieldRUB.resignFirstResponder()

    }
    
    func converterValute(text: String) {
        let transformationName = converterView.labelNameValute.text?.components(separatedBy: " ")
        let nameValute = transformationName?.first
        let number: Double? = Double(text)
        
        let rezult = (number ?? 0)  / (arrayConverter?.valute[nameValute ?? ""]?.value ?? 1)
        
        converterView.textFieldValute.text = String(format: "%.2f", rezult)
    }

}
extension ConverterViewController: UITextFieldDelegate{
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        converterView.pickerValute.isHidden = true
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        if converterView.textFieldValute == textField {
            return false
        }
        return true
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        converterValute(text: textField.text ?? "")
    }
}

extension ConverterViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return arrayConverter?.valute.count ?? 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let nameValute = arrayNameValute[row]
        return  (arrayConverter?.valute[nameValute]?.charCode ?? "") + "  " + (arrayConverter?.valute[nameValute]?.name ?? "")
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let nameValute = arrayNameValute[row]
        converterView.buttonSelectionValute.setImage(UIImage(named: nameValute), for: .normal)
        converterView.labelNameValute.text = nameValute
        
        converterValute(text: converterView.textFieldRUB.text ?? "")
    }
    
}
