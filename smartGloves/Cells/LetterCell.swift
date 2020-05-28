//
//  calibrateCell.swift
//  smartGloves
//
//  Created by Gerardo on 19/05/20.
//  Copyright © 2020 Gerardo. All rights reserved.
//

import UIKit

class LetterCell: UICollectionViewCell {
    
    let checkimageView : UIImageView = {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "iconCheckGreen")
        imageView.isHidden = true
        return imageView
    }()

    let letterLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Arial Rounded MT Bold", size: 190)
        label.textAlignment = .center
        return label
    }()
    
    let startButton : UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Empezar", for: .normal)
        button.titleLabel?.font = UIFont(name: "Arial Rounded MT Bold", size: 25)
        button.setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        button.layer.cornerRadius = 10
        button.backgroundColor = #colorLiteral(red: 0.1254901961, green: 0.537254902, blue: 0.9490196078, alpha: 1)
        button.setShadow(color: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), size: .init(width: -2, height: 2), radius: 4, opacity: 0.2)
        return button
    }()
    
    
    var checkPath: UIBezierPath {
        let centerX = contentView.center.x
        let centerY = contentView.center.y + 120
        let bezierPath = UIBezierPath()
        
        bezierPath.addArc(withCenter: CGPoint(x: centerX, y: centerY), radius: 60, startAngle: -CGFloat.pi * 0.95, endAngle:  -3 * CGFloat.pi, clockwise: false)
        bezierPath.move(to: CGPoint(x: centerX - 30, y: centerY ))
        bezierPath.addLine(to: CGPoint(x: centerX - 10, y: centerY + 20))
        bezierPath.addLine(to: CGPoint(x: centerX + 35, y: centerY - 20))
        bezierPath.move(to: CGPoint(x: centerX + 47, y: centerY - 37))
        return bezierPath
    }
    
    
    override init(frame: CGRect) {
        super.init(frame : frame)
                        
        [checkimageView, letterLabel, startButton].forEach { contentView.addSubview($0) }
        
        setupLayout()
    }   
    
    func setupLayout(){
        
        checkimageView.anchor(top: contentView.topAnchor, topConstant: 15 , leading: nil, bottom: nil, trailing: contentView.trailingAnchor, trailingConstant: -15)
        checkimageView.anchorSize(width: nil, widthConstant: 60 ,height: nil, heightConstant: 60)
        
        letterLabel.anchor(top: contentView.topAnchor, topConstant: contentView.frame.height * 0.09 , leading: contentView.leadingAnchor, bottom: nil, trailing: contentView.trailingAnchor)
        letterLabel.anchorSize(width: nil, height: nil, heightConstant: 220) //180
        
        //El ancho del ipad es demasiado, por eso se toma un maximo alto del boton de 95
        let heightCorrectionStartButton = min(95, contentView.frame.width * 0.16)//0.134
        
        startButton.anchor(top: letterLabel.bottomAnchor, topConstant: 20, leading: nil, bottom: nil, trailing: nil)
        startButton.anchorSize(width: contentView.widthAnchor, widthMultiplier: 0.7, height: nil, heightConstant: heightCorrectionStartButton )
        startButton.anchorCenter(centerX: contentView.centerXAnchor, centerY: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
