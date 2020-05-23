//
//  calibrateCell.swift
//  smartGloves
//
//  Created by Gerardo on 19/05/20.
//  Copyright © 2020 Gerardo. All rights reserved.
//

import UIKit

class LetterCell: UICollectionViewCell {

    let letterLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Arial Rounded MT Bold", size: 190)
        label.backgroundColor = .blue
        label.textAlignment = .center
        return label
    }()
    
    let startButton : UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Empezar", for: .normal)
        button.titleLabel?.font = UIFont(name: "Arial Rounded MT Bold", size: 23)
        button.setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        button.backgroundColor = .blue
        button.layer.cornerRadius = 10
        return button
    }()
    
    let doneButton : UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Hecho", for: .normal)
        button.titleLabel?.font = UIFont(name: "Arial Rounded MT Bold", size: 23)
        button.setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        button.layer.cornerRadius = 10
        button.backgroundColor = .blue
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame : frame)
                
        contentView.addSubview(letterLabel)
        contentView.addSubview(startButton)
        contentView.addSubview(doneButton)
        
        setupLayout()
    }   
    
    func setupLayout(){
        letterLabel.anchor(top: contentView.topAnchor, topConstant: contentView.frame.height * 0.09 , leading: contentView.leadingAnchor, bottom: nil, trailing: contentView.trailingAnchor)
        letterLabel.anchorSize(width: nil, height: nil, heightConstant: 220) //180
        
        
        startButton.anchor(top: letterLabel.bottomAnchor, topConstant: 25, leading: contentView.leadingAnchor, leadingConstant: 20 , bottom: nil, trailing: nil)
        startButton.anchorSize(width: nil, widthConstant: contentView.frame.width * 0.34 , height: nil, heightConstant: 40)

        doneButton.anchor(top: letterLabel.bottomAnchor, topConstant: 25, leading: nil, bottom: nil, trailing: contentView.trailingAnchor, trailingConstant: -20 )
        doneButton.anchorSize(width: nil, widthConstant: contentView.frame.width * 0.34, height: nil, heightConstant: 40) //140
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
