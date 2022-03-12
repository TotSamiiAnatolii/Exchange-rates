//
//  ConverterView.swift
//  exchange rates
//
//  Created by APPLE on 08.03.2022.
//

import UIKit

class ConverterView: UIView {
    
    var onAction: (()->())?
    
    var pickerValute: UIPickerView!
    
    let labelDescription: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Конвертер валют"
        label.font = UIFont.boldSystemFont(ofSize: 26)
        return label
    }()
    
    let labelNameValute: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "USD"
        label.font = UIFont.boldSystemFont(ofSize: 13)
        return label
    }()
    
    let labelFIXRUB: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "RUB"
        label.font = UIFont.boldSystemFont(ofSize: 13)
        return label
    }()
    
    let textFieldRUB: UITextField = {
        let text = UITextField()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.layer.borderWidth = 1
        text.layer.borderColor = UIColor.gray.cgColor
        text.placeholder = "Введите сумму в RUB"
        text.layer.cornerRadius = 5
        text.textAlignment = .center
        text.keyboardType = .numberPad
        return text
    }()
    
    let textFieldValute: UITextField = {
        let text = UITextField()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.layer.borderWidth = 1
        text.layer.borderColor = UIColor.gray.cgColor
        text.layer.cornerRadius = 5
        text.textAlignment = .center
        return text
    }()
    
    let buttonSelectionValute: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.cornerRadius = 20
        button.addTarget(self, action: #selector(getPickerView), for: .touchUpInside)
        button.setImage(UIImage(named: "EUR"), for: .normal)
        button.clipsToBounds = true
        return button
    }()
    
    let buttonFixRUB: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.cornerRadius = 20
        button.setImage(UIImage(named: "Russia"), for: .normal)
        button.clipsToBounds = true
        return button
    }()
    
    let imageArrows: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "arrows")
        return image
    }()
 
    override init(frame: CGRect) {
        super.init(frame: frame)
        pickerValute = UIPickerView(frame: .zero)
        pickerValute.translatesAutoresizingMaskIntoConstraints = false
        setAddSubView()
        setConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setAddSubView(){
        self.addSubview(textFieldRUB)
        self.addSubview(textFieldValute)
        self.addSubview(labelDescription)
        self.addSubview(labelNameValute)
        self.addSubview(labelFIXRUB)
        self.addSubview(buttonSelectionValute)
        self.addSubview(buttonFixRUB)
        self.addSubview(pickerValute)
        self.addSubview(imageArrows)
    }
    
    @objc func getPickerView() {
        onAction?()
    }
    
    func setConstraint() {
        
        NSLayoutConstraint.activate([
            textFieldRUB.widthAnchor.constraint(equalToConstant: 200),
            textFieldRUB.heightAnchor.constraint(equalToConstant: 50),
            textFieldRUB.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            textFieldRUB.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -60)
        ])
        
        NSLayoutConstraint.activate([
            textFieldValute.widthAnchor.constraint(equalToConstant: 200),
            textFieldValute.heightAnchor.constraint(equalToConstant: 50),
            textFieldValute.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            textFieldValute.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 60)
        ])
        
        NSLayoutConstraint.activate([
            labelDescription.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            labelDescription.topAnchor.constraint(equalTo: self.topAnchor, constant: 100)
        ])
        
        NSLayoutConstraint.activate([
            labelNameValute.centerXAnchor.constraint(equalTo: buttonSelectionValute.centerXAnchor),
            labelNameValute.topAnchor.constraint(equalTo: buttonSelectionValute.bottomAnchor, constant: 2)
        ])
        
        NSLayoutConstraint.activate([
            labelFIXRUB.centerXAnchor.constraint(equalTo: buttonFixRUB.centerXAnchor),
            labelFIXRUB.topAnchor.constraint(equalTo: buttonFixRUB.bottomAnchor, constant: 2)
        ])
        
        NSLayoutConstraint.activate([
            buttonSelectionValute.widthAnchor.constraint(equalToConstant: 40),
            buttonSelectionValute.heightAnchor.constraint(equalToConstant: 40),
            buttonSelectionValute.leadingAnchor.constraint(equalTo: textFieldValute.trailingAnchor, constant: 10),
            buttonSelectionValute.topAnchor.constraint(equalTo: textFieldValute.topAnchor)
        ])
        
        NSLayoutConstraint.activate([
            buttonFixRUB.widthAnchor.constraint(equalToConstant: 40),
            buttonFixRUB.heightAnchor.constraint(equalToConstant: 40),
            buttonFixRUB.leadingAnchor.constraint(equalTo: textFieldRUB.trailingAnchor, constant: 10),
            buttonFixRUB.topAnchor.constraint(equalTo: textFieldRUB.topAnchor)
        ])
        
        NSLayoutConstraint.activate([
            pickerValute.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            pickerValute.topAnchor.constraint(equalTo: self.textFieldValute.bottomAnchor, constant: 10)
        ])
        
        NSLayoutConstraint.activate([
            imageArrows.widthAnchor.constraint(equalToConstant: 30),
            imageArrows.heightAnchor.constraint(equalToConstant: 30),
            imageArrows.centerYAnchor.constraint(equalTo: buttonSelectionValute.centerYAnchor),
            imageArrows.centerXAnchor.constraint(equalTo: buttonSelectionValute.centerXAnchor, constant: 28)
        ])
        
    }
    
}
