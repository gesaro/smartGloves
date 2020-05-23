//
//  boton.swift
//  smartGloves
//
//  Created by Gerardo on 20/05/20.
//  Copyright © 2020 Gerardo. All rights reserved.
//

import UIKit

class boton: UIButton {

    var letra: String? = "valor"

    override init(frame: CGRect) {
       super.init(frame: frame)

    }

    required init(coder aDecoder: NSCoder) {
       fatalError("This class does not support NSCoding")
    }

}
