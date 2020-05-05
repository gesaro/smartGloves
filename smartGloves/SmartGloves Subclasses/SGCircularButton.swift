//
//  SGcircularButton.swift
//  smartGloves
//
//  Created by Gerardo on 01/05/20.
//  Copyright © 2020 Gerardo. All rights reserved.
//

import UIKit

class SGCircularButton : UIButton {
    
    override var bounds: CGRect {
        didSet{
            layer.cornerRadius = bounds.size.width / 2
        }
    }
    
    
}
