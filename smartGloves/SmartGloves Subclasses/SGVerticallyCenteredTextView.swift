//
//  SGVerticallyCenteredTextView.swift
//  smartGloves
//
//  Created by Gerardo on 01/05/20.
//  Copyright © 2020 Gerardo. All rights reserved.
//

import UIKit

class SGVerticallyCenteredTextView: UITextView {
//    override var contentSize: CGSize {
//        didSet {
//            var topCorrection = (bounds.size.height - contentSize.height * zoomScale) / 2.0
//            topCorrection = max(0, topCorrection)
//            contentInset = UIEdgeInsets(top: topCorrection, left: 0, bottom: 0, right: 0)
//        }
//    }
    
    override var contentSize: CGSize {
        didSet {
            var topCorrection = (bounds.size.height - contentSize.height) / 2.0
            topCorrection = max(0, topCorrection)
            contentInset = UIEdgeInsets(top: topCorrection, left: 0, bottom: 0, right: 0)
        }
    }
}
