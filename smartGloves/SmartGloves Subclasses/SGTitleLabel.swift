//
//  SGTitleLabel.swift
//  smartGloves
//
//  Created by Gerardo on 27/04/20.
//  Copyright © 2020 Gerardo. All rights reserved.
//

import UIKit

class SGTitleLabel : UILabel {
    override init(frame: CGRect) {
        super.init(frame : frame)
        styleLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func styleLabel(){
        font = UIFont(name: "Arial Rounded MT Bold", size: 37)
        textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        textAlignment = .center
    }
    
    
}
