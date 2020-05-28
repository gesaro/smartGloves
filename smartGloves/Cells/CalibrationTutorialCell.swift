//
//  CalibrationTutorialCell.swift
//  smartGloves
//
//  Created by Gerardo on 27/05/20.
//  Copyright © 2020 Gerardo. All rights reserved.
//

import UIKit

class CalibrationTutorialCell: UICollectionViewCell {
    
    
    let imageView : UIImageView = {
       let imageView = UIImageView()
        imageView.backgroundColor = .white
        return imageView
    }()
    
    
    
    override init(frame: CGRect) {
        super.init(frame : frame)
                        
        [imageView].forEach { contentView.addSubview($0) }
        
        setupLayout()
    }
    
    func setupLayout(){
        
//        imageView.anchor(top: contentView.topAnchor, topConstant: 30, leading: contentView.leadingAnchor, leadingConstant: 30, bottom: contentView.bottomAnchor, bottomConstant: -30 ,trailing: contentView.trailingAnchor, trailingConstant: -30)
        
//        imageView.anchorSize(width: contentView.widthAnchor, widthMultiplier: 0.70, height: contentView.widthAnchor, heightMultiplier: 1.4021)
        
        //El ancho del ipad es demasiado, por eso se toma un maximo ancho del imageView de 120
        let withCorrectionImageView = min(contentView.frame.width  * 0.7322, 349.3917)
        //El ancho del ipad es demasiado, por eso se toma un maximo ancho del imageView de 120
        let heightCorrectionImageView = min(contentView.frame.width  * 1.466, 700)
        
        
        imageView.anchorSize(width: nil, widthConstant: withCorrectionImageView ,height: nil, heightConstant: heightCorrectionImageView)
        imageView.anchorCenter(centerX: contentView.centerXAnchor, centerY: contentView.centerYAnchor, Yconstant: -5)
//        imageView.anchor(top: contentView.topAnchor, topConstant: 10, leading: nil, bottom: nil, trailing: nil)
        print(contentView.frame.width  * 0.7322, contentView.frame.width  * 1.4666)
        
//        letterLabel.anchor(top: contentView.topAnchor, topConstant: contentView.frame.height * 0.09 , leading: contentView.leadingAnchor, bottom: nil, trailing: contentView.trailingAnchor)
//        letterLabel.anchorSize(width: nil, height: nil, heightConstant: 220) //180
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
