//
//  SGEdgeInsetsButton.swift
//  smartGloves
//
//  Created by Gerardo on 06/05/20.
//  Copyright © 2020 Gerardo. All rights reserved.
//

import UIKit

class SGEdgeInsetsButton : UIButton {
    //En esta funcion podemos modificar el desplazamiento del icono y texto interior de un boton
    override func layoutSubviews() {
        super.layoutSubviews()
        //comprueba si el boton tiene un icono dentro
        if imageView != nil {
            
            var leadingIconKeyboard = CGFloat(0.0)
            var leadingTitleButton = CGFloat(0.0)
            
            //la primera vez que se ejecuta los valores de las vistas aparecen en nulo y comprueba para evitar un error
            if superview?.frame.width != nil {
                //En dispositivos con un ancho pequeño el desplazamineto del texto y el icono deben ser menor, de lo contrario saldrian de los margenes del boton.
                if (superview?.frame.width)! <= 375 {
                    leadingIconKeyboard = 110
                    leadingTitleButton = 90
                }
                else {
                    leadingIconKeyboard = bounds.width * 0.42
                    leadingTitleButton = bounds.width * 0.3662
                }
            }
            

            imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: leadingIconKeyboard)
            titleEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: leadingTitleButton)

        }

    }

}
