//
//  CollectionViewCell.swift
//  exchange rates
//
//  Created by APPLE on 07.03.2022.
//

import UIKit

class ValuteCell: UICollectionViewCell {
    
   static var identifier = "ValuteCell"
    
    var imageCell: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.clipsToBounds = true
        image.layer.cornerRadius = 40
        return image
    }()
    
    var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.text = "USD"
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setConstraint() {
        contentView.addSubview(imageCell)
        contentView.addSubview(nameLabel)
        contentView.backgroundColor = .white
        
        NSLayoutConstraint.activate([
            imageCell.widthAnchor.constraint(equalToConstant: 80),
            imageCell.heightAnchor.constraint(equalToConstant: 80),
            imageCell.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            imageCell.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: imageCell.bottomAnchor, constant: 3),
            nameLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)
        ])
    }
    
    func configureCell(arrayFlag: String) {
        imageCell.image = UIImage(named: arrayFlag)
        nameLabel.text = arrayFlag
    }
    
}
