//
//  UIView+Ext.swift
//  smartGloves
//
//  Created by Gerardo on 26/04/20.
//  Copyright © 2020 Gerardo. All rights reserved.
//

import UIKit

extension UIView {
    
    func fillView(to superView: UIView){
        
        //Se deahabilita la propiedad "translatesAutoresizingMaskIntoConstraints" del elemento para utilizar diseño automatico,esto para poder agregar las restricciones mediante programacion
        translatesAutoresizingMaskIntoConstraints = false
        
        //Se agrupa en un NSLayoutConstraint todas las restricciones de los elementos para poder activarlas todas mas facilmente
        //de lo contrario tendria que ser activadas individualemnte -> backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        NSLayoutConstraint.activate([
            topAnchor.constraint(equalTo: superview!.topAnchor),
            leadingAnchor.constraint(equalTo: superview!.leadingAnchor),
            bottomAnchor.constraint(equalTo: superview!.bottomAnchor),
            trailingAnchor.constraint(equalTo: superview!.trailingAnchor)
        ])
    }
    
    func anchor(top: NSLayoutYAxisAnchor?, topConstant : CGFloat = 0, leading: NSLayoutXAxisAnchor?, leadingConstant : CGFloat = 0, bottom: NSLayoutYAxisAnchor?, bottomConstant : CGFloat = 0, trailing: NSLayoutXAxisAnchor?, trailingConstant : CGFloat = 0){
        
        //Se deahabilita la propiedad "translatesAutoresizingMaskIntoConstraints" del elemento para utilizar diseño automatico,esto para poder agregar las restricciones mediante programacion
        translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top {
            topAnchor.constraint(equalTo: top, constant: topConstant).isActive = true
        }
        if let leading = leading {
            leadingAnchor.constraint(equalTo: leading, constant: leadingConstant).isActive = true
        }
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: bottomConstant).isActive = true
        }
        if let trailing = trailing {
            trailingAnchor.constraint(equalTo: trailing, constant: trailingConstant).isActive = true
        }

    }
    
    
    func anchorSize(width : NSLayoutDimension?, widthConstant : CGFloat = 0, widthMultiplier : CGFloat = 0, height : NSLayoutDimension?, heightConstant : CGFloat = 0, heightMultiplier : CGFloat = 0){
        
        //Se deahabilita la propiedad "translatesAutoresizingMaskIntoConstraints" del elemento para utilizar diseño automatico,esto para poder agregar las restricciones mediante programacion
        translatesAutoresizingMaskIntoConstraints = false
        
        if let width = width {
            widthAnchor.constraint(equalTo: width, multiplier: widthMultiplier).isActive = true
        }
        if let height = height {
            heightAnchor.constraint(equalTo: height, multiplier: heightMultiplier).isActive = true
        }
        if widthConstant != 0 {
            widthAnchor.constraint(equalToConstant: widthConstant).isActive = true
        }
        if heightConstant != 0 {
            heightAnchor.constraint(equalToConstant: heightConstant).isActive = true
        }
    }
    
    
    func anchorCenter(centerX : NSLayoutXAxisAnchor?, Xconstant : CGFloat = 0, centerY : NSLayoutYAxisAnchor?, Yconstant: CGFloat = 0){
        
        translatesAutoresizingMaskIntoConstraints = false
        
        if let centerX = centerX {
            centerXAnchor.constraint(equalTo: centerX, constant: Xconstant).isActive = true
        }
        if let centerY = centerY {
            centerYAnchor.constraint(equalTo: centerY, constant: Yconstant).isActive = true
        }
    }
    
    func setShadow(color: UIColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), size: CGSize, radius: CGFloat = 0, opacity: Float = 0){
        layer.shadowOffset = size
        layer.shadowColor = color.cgColor
        layer.shadowRadius = radius
        layer.shadowOpacity = opacity
        clipsToBounds = true
        layer.masksToBounds = false
    }
    
    func setShadow2(color: UIColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), size: CGSize, radius: CGFloat = 0, opacity: Float = 0){
        layer.shadowOffset = size
        layer.shadowColor = color.cgColor
        layer.shadowRadius = radius
        layer.shadowOpacity = opacity
//        clipsToBounds = true
//        layer.masksToBounds = true
    }
    
    func animationPulsate(duration: CFTimeInterval, fromValue: CGFloat, toValue: CGFloat, autoreverses: Bool, repeatCount: Float, initialVelocity: CGFloat, damping: CGFloat){
        //Se crea la animacion del tipo CASpringAnimation que es tipo de animacion elastica
        //en la keyPath selecionamos el tipo de transformar escalando de 1.0 = 100 %
        let pulse = CASpringAnimation(keyPath: "transform.scale")
        pulse.duration = duration
        //Porcentaje(en escala) del tamaño inicial del elemento
        pulse.fromValue = fromValue
        //Pocertanje del tamaño final del elemento
        pulse.toValue = toValue
        //Ejecuta la animacion de atras hacia delante
        pulse.autoreverses = autoreverses
        //Cantidad de veces que se repite la animacion
        pulse.repeatCount = repeatCount
        pulse.initialVelocity = initialVelocity
        //Como se debe de amortiguar el movimiento del resorte
        pulse.damping = damping
        
        layer.add(pulse, forKey: nil)
    }
    
    func animationPulsate2(view: UIView, scaleX: CGFloat, y: CGFloat, duration: TimeInterval, delay : TimeInterval = 0, springWithDamping: CGFloat, springVelocity: CGFloat){
        
        transform = CGAffineTransform(scaleX: scaleX, y: y)
        
        UIView.animate(withDuration: duration,
                     delay: delay,
                     usingSpringWithDamping: springWithDamping,
                     initialSpringVelocity: springVelocity,
                     options: UIView.AnimationOptions.allowUserInteraction,
                     
    
                     animations: {
                         view.transform = CGAffineTransform.identity
                     }, completion: nil)
        
        
//        transform = CGAffineTransform(scaleX: 0.6, y: 0.6)
//
//        UIView.animate(withDuration: 2.0,
//                         delay: 0,
//                         usingSpringWithDamping: CGFloat(0.20),
//                         initialSpringVelocity: CGFloat(6.0),
//                         options: UIView.AnimationOptions.allowUserInteraction,
//
//                         animations: {
//                             view.transform = CGAffineTransform.identity
//                         }, completion: nil)
    }
    
    func animationFlash(){
        
    }
    func animationShake(){
        
    }
    
    
    
    
}
