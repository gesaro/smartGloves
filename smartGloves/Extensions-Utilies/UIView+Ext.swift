//
//  UIView+Ext.swift
//  smartGloves
//
//  Created by Gerardo on 26/04/20.
//  Copyright © 2020 Gerardo. All rights reserved.
//

import UIKit

extension UIView {
    func pin(to superView: UIView){
        translatesAutoresizingMaskIntoConstraints = false
        topAnchor.constraint(equalTo: superview!.topAnchor).isActive = true
        NSLayoutConstraint.activate([
            topAnchor.constraint(equalTo: superview!.topAnchor),
            leadingAnchor.constraint(equalTo: superview!.leadingAnchor),
            bottomAnchor.constraint(equalTo: superview!.bottomAnchor),
            trailingAnchor.constraint(equalTo: superview!.trailingAnchor)
        ])
    }
}
