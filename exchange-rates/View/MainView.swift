//
//  MainView.swift
//  exchange rates
//
//  Created by APPLE on 04.03.2022.
//

import UIKit

class MainView: UIView {
    
    var collectionTable: UICollectionView!
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
       
        return label
    }()
    
    let ratesLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = UIFont.boldSystemFont(ofSize: 45)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let previousLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 23)
        return label
    }()
    
    let differencePercent: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 22)
        return label
    }()
    
    let nameCountry: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.text = "RUB"
        return label
    }()
    
    let imagePointer: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "red")
        return image
    }()
    
    let imageFlag: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.layer.cornerRadius = 25
        image.layer.borderWidth = 1
        image.layer.borderColor = UIColor.black.cgColor
        image.image = UIImage(named: "Russia")
        return image
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        collectionTable = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionTable.translatesAutoresizingMaskIntoConstraints = false
        collectionTable.collectionViewLayout = layout
        collectionTable.showsHorizontalScrollIndicator = false
        collectionTable.backgroundColor = .white
        collectionTable.register(ValuteCell.self, forCellWithReuseIdentifier: ValuteCell.identifier)
        addSubview()
        setConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addSubview() {
        self.addSubview(collectionTable)
        self.addSubview(ratesLabel)
        self.addSubview(previousLabel)
        self.addSubview(descriptionLabel)
        self.addSubview(differencePercent)
        self.addSubview(imagePointer)
        self.addSubview(imageFlag)
        self.addSubview(nameCountry)
    }
    
    func setConstraint() {
        
        NSLayoutConstraint.activate([
            collectionTable.widthAnchor.constraint(equalTo: self.widthAnchor),
            collectionTable.heightAnchor.constraint(equalToConstant: 150),
            collectionTable.topAnchor.constraint(equalTo: previousLabel.bottomAnchor, constant: 90)
        ])
        
        NSLayoutConstraint.activate([
            ratesLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            ratesLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -50)
        ])
        
        NSLayoutConstraint.activate([
            previousLabel.topAnchor.constraint(equalTo: ratesLabel.bottomAnchor, constant: -5),
            previousLabel.leftAnchor.constraint(equalTo: ratesLabel.leftAnchor)
        ])
        
        NSLayoutConstraint.activate([
            descriptionLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10),
            descriptionLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 100)
        ])
        
        NSLayoutConstraint.activate([
            differencePercent.topAnchor.constraint(equalTo: ratesLabel.bottomAnchor, constant: -6),
            differencePercent.leadingAnchor.constraint(equalTo: previousLabel.trailingAnchor, constant: 10)
        ])
        
        NSLayoutConstraint.activate([
            imagePointer.widthAnchor.constraint(equalToConstant: 27),
            imagePointer.heightAnchor.constraint(equalToConstant: 37),
            imagePointer.trailingAnchor.constraint(equalTo: ratesLabel.leadingAnchor, constant: -10),
            imagePointer.centerYAnchor.constraint(equalTo: ratesLabel.centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            imageFlag.widthAnchor.constraint(equalToConstant: 50),
            imageFlag.heightAnchor.constraint(equalToConstant: 50),
            imageFlag.leadingAnchor.constraint(equalTo: ratesLabel.trailingAnchor, constant: 9),
            imageFlag.centerYAnchor.constraint(equalTo: ratesLabel.centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            nameCountry.topAnchor.constraint(equalTo: imageFlag.bottomAnchor, constant: -1),
            nameCountry.centerXAnchor.constraint(equalTo:imageFlag.centerXAnchor)
        ])
    }
}
