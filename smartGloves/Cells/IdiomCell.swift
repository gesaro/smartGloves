//
//  IdiomCell.swift
//  smartGloves
//
//  Created by Gerardo on 26/04/20.
//  Copyright © 2020 Gerardo. All rights reserved.
//

import UIKit

class IdiomCell : UICollectionViewCell {
    
    let countryFlagImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true
        return imageView
    }()
        
        
    let idiomLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Español"
        label.font = UIFont(name: "Arial Rounded MT Bold", size: 22)
        label.textColor = .black
        return label
    }()
        
        
    let countryLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Mexico"
        label.font = UIFont(name: "Avenir", size: 22)
        label.textColor = .black
        return label
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame : frame)
        
        layer.cornerRadius = 10
        
//        Se agregan los elementos al contentView
        [countryFlagImageView, idiomLabel, countryLabel].forEach{contentView.addSubview($0)}
        setupLayout()
    }

    
    
    func setupLayout(){
        NSLayoutConstraint.activate([
            countryFlagImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            countryFlagImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: contentView.frame.width * 0.07),
            countryFlagImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5),
            countryFlagImageView.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.37),
            
            idiomLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            idiomLabel.leadingAnchor.constraint(equalTo: countryFlagImageView.trailingAnchor, constant: 35),
            idiomLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5),
            idiomLabel.heightAnchor.constraint(equalToConstant: contentView.frame.height/2 - 10),
            
            countryLabel.topAnchor.constraint(equalTo: idiomLabel.bottomAnchor),
            countryLabel.leadingAnchor.constraint(equalTo: countryFlagImageView.trailingAnchor, constant: 35),
            countryLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5),
            countryLabel.heightAnchor.constraint(equalToConstant: contentView.frame.height/2 - 10)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension UIView {
    
}
