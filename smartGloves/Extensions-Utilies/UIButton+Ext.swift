//
//  UIButton+Ext.swift
//  smartGloves
//
//  Created by Gerardo on 07/05/20.
//  Copyright © 2020 Gerardo. All rights reserved.
//

import UIKit

extension UIButton {
    func playAudioAnimation(){
        animationPulsate(duration: 100, fromValue: 0.97, toValue: 1, autoreverses: true, repeatCount: 100, initialVelocity: 0.5, damping: 0)
    }
}
