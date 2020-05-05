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
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true
        return imageView
    }()
        
        
    let idiomLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Arial Rounded MT Bold", size: 22)
        label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        return label
    }()
        
        
    let countryLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Avenir", size: 22)
        label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        return label
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame : frame)
        
        layer.cornerRadius = 10
        
        //Se agregan los elementos al contentView
        [countryFlagImageView, idiomLabel, countryLabel].forEach{contentView.addSubview($0)}
        
        setupLayout()
    }

    
    
    func setupLayout(){
        countryFlagImageView.anchor(top: contentView.topAnchor, topConstant: 5, leading: contentView.leadingAnchor, leadingConstant: contentView.frame.width * 0.07, bottom: contentView.bottomAnchor, bottomConstant: -5, trailing: nil)
        countryFlagImageView.anchorSize(width: contentView.widthAnchor, widthMultiplier: 0.37, height: nil)
        
        idiomLabel.anchor(top: contentView.topAnchor, topConstant: 10, leading: countryFlagImageView.trailingAnchor, leadingConstant: 35, bottom: nil, trailing: contentView.trailingAnchor, trailingConstant: -5)
        idiomLabel.anchorSize(width: nil, height: nil, heightConstant: contentView.frame.height/2 - 10)
        
        countryLabel.anchor(top: idiomLabel.bottomAnchor, leading: countryFlagImageView.trailingAnchor, leadingConstant: 35, bottom: nil, trailing: contentView.trailingAnchor, trailingConstant: -5)
        countryLabel.anchorSize(width: nil, height: nil, heightConstant: contentView.frame.height/2 - 10)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
