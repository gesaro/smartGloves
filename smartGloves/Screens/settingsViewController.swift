//
//  settingsViewController.swift
//  smartGloves
//
//  Created by Gerardo on 21/04/20.
//  Copyright © 2020 Gerardo. All rights reserved.
//

import UIKit

class settingsViewController: BaseViewController {
    
    //Funcion anonima que se ejeucta despues de ser creada {}(), para agrupar los atributos del elemento y tener una mejor organizacion de codigo
    let back :UIImageView = {
       let imageView = UIImageView()
        //Se deahabilita la propiedad "translatesAutoresizingMaskIntoConstraints" del elemento para utilizar diseño automatico,esto para poder agregar las restricciones mediante programacion
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = #imageLiteral(resourceName: "iPhone6")
        return imageView
    }()
    
    
    let topConteinerView : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let backgroundImageView : UIImageView = {
      let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = #imageLiteral(resourceName: "back3")
        return imageView
    }()

    
    let titleLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Ajustes"
        label.font = UIFont(name: "Arial Rounded MT Bold", size: 37)
        label.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        label.textAlignment = .center
        return label
    }()
    
    
    let idiomaButton : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = #colorLiteral(red: 0.1254901961, green: 0.537254902, blue: 0.9490196078, alpha: 1)
//        button.setTitle("Idioma", for: .normal)
//        button.titleLabel?.font = UIFont(name: "Arial Rounded MT Bold", size: 23)
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(idiomaButtonTapped), for: .touchDown)
        
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOffset = CGSize(width: -2, height: 2.0)
        button.layer.shadowRadius = 4 //8
        button.layer.shadowOpacity = 0.2 //0.5
        button.clipsToBounds = true
        button.layer.masksToBounds = false
        return button
    }()
    
    
    let backgroungIdiomaButton : UIImageView = {
        let button = UIImageView()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.image = #imageLiteral(resourceName: "idioma")
        return button
    }()
    
    let calibrarButton : UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = #colorLiteral(red: 0.1254901961, green: 0.537254902, blue: 0.9490196078, alpha: 1)
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(calibrarButtonTapped), for: .touchDown)
        
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOffset = CGSize(width: -2, height: 2.0)
        button.layer.shadowRadius = 4
        button.layer.shadowOpacity = 0.2
        button.clipsToBounds = true
        button.layer.masksToBounds = false
        return button
    }()
    
    let backgroungCalibrarButton : UIImageView = {
        let button = UIImageView()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.image = #imageLiteral(resourceName: "calibrar")
       return button
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let backBarButton = UIBarButtonItem(title: "Ajustes", style: .plain, target: nil, action: nil)
        self.navigationItem.backBarButtonItem = backBarButton
        
        //Forma de agregado los elementos a una vista
//        [topConteinerView, idiomaButton, calibrarButton].forEach { view.addSubview($0) }
//        [backgroundImageView, titleLabel].forEach { topConteinerView.addSubview($0) }
        
//        view.setGradientBackground(colorOne : .red, colorTwo : .blue)
        
//        //Se agregan las vistas creadas anteriormente a la vista principal
        view.addSubview(topConteinerView)
        topConteinerView.addSubview(backgroundImageView)
        topConteinerView.addSubview(titleLabel)

        view.addSubview(idiomaButton)
        idiomaButton.addSubview(backgroungIdiomaButton)
        view.addSubview(calibrarButton)
        calibrarButton.addSubview(backgroungCalibrarButton)

        setBackground()
    }
    
    //Cambiar el color del status Bar a blanco
//    override var preferredStatusBarStyle: UIStatusBarStyle {
//        return .lightContent
//    }
    
    //Funcion que contiene las restricciones de todos los elementos creados anteriormente
    func setBackground(){
        
        //Se agrupa en un NSLayoutConstraint todas las restricciones de los elementos para poder activarlas todas mas facilmente
        //de lo contrario tendria que ser activadas individualemnte = backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        NSLayoutConstraint.activate([
            //Restricciones del topContentView
            topConteinerView.topAnchor.constraint(equalTo: view.topAnchor),
            topConteinerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            topConteinerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            topConteinerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.32),
            
            //Restricciones del backgroundImageView dentro del topConteinerView
            backgroundImageView.topAnchor.constraint(equalTo: topConteinerView.topAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: topConteinerView.leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: topConteinerView.trailingAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: topConteinerView.bottomAnchor),
            
            //Restricciones del titleLabel dentro del topConteinerView
            titleLabel.centerYAnchor.constraint(equalTo: topConteinerView.centerYAnchor),
            titleLabel.leftAnchor.constraint(equalTo: topConteinerView.leftAnchor, constant: 12),
            titleLabel.rightAnchor.constraint(equalTo: topConteinerView.rightAnchor, constant: -12),
            titleLabel.heightAnchor.constraint(equalToConstant: 50),
            
            //Restricciones del Button idioma dentro de la view principal
            idiomaButton.topAnchor.constraint(equalTo: topConteinerView.bottomAnchor, constant: 50),
            idiomaButton.widthAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.16),
            idiomaButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.16),
            idiomaButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            
            //Restricciones del background del idiomaButton
            backgroungIdiomaButton.centerXAnchor.constraint(equalTo: idiomaButton.centerXAnchor),
            backgroungIdiomaButton.widthAnchor.constraint(equalTo: idiomaButton.widthAnchor, multiplier: 0.7),
            backgroungIdiomaButton.heightAnchor.constraint(equalTo: idiomaButton.heightAnchor, multiplier: 0.7),
            backgroungIdiomaButton.centerYAnchor.constraint(equalTo: idiomaButton.centerYAnchor),
            
            //Restricciones del Button calibrar dentro de la view principal
            calibrarButton.topAnchor.constraint(equalTo: topConteinerView.bottomAnchor, constant: 50),
            calibrarButton.widthAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.16),
            calibrarButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.16),
            calibrarButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            
            //Restricciones del background del calibrarButton
            backgroungCalibrarButton.centerXAnchor.constraint(equalTo: calibrarButton.centerXAnchor),
            backgroungCalibrarButton.widthAnchor.constraint(equalTo: calibrarButton.widthAnchor, multiplier: 0.7),
            backgroungCalibrarButton.heightAnchor.constraint(equalTo: calibrarButton.heightAnchor, multiplier: 0.7),
            backgroungCalibrarButton.centerYAnchor.constraint(equalTo: calibrarButton.centerYAnchor)
        ])
        view.sendSubviewToBack(backgroundImageView)
    }
    
//    func o() {
//        NSLayoutConstraint.activate([
//            back.topAnchor.constraint(equalTo: view.topAnchor),
//            back.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            back.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//            back.bottomAnchor.constraint(equalTo: view.bottomAnchor)
//        ])
//        view.sendSubviewToBack(back)
//    }

    
    
    @objc func idiomaButtonTapped(sender : UIButton){
        sender.pulsate()
        performSegue(withIdentifier: "idiomViewController", sender: nil)
//        print("idioma")
    }
    
    @objc func calibrarButtonTapped(sender : UIButton){
        sender.pulsate()
        performSegue(withIdentifier: "calibrateViewController", sender: nil)
//        print("calibrar")
    }
    

}

extension UIView {
    func pulsate(){
        
        let pulse = CASpringAnimation(keyPath: "transform.scale")
        pulse.duration = 0.2
        pulse.fromValue = 0.96
        pulse.toValue = 1.0
        pulse.autoreverses = true
        pulse.repeatCount = 0.5
        pulse.initialVelocity = 0.5
        pulse.damping = 1.0
        
        layer.add(pulse, forKey: nil)
    }
    
    func setShadow(){
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0.0, height: 6.8)
        layer.shadowRadius = 8
        layer.shadowOpacity = 0.5
        clipsToBounds = true
        layer.masksToBounds = false
    }
    
    
//    func setGradientBackground(colorOne : UIColor, colorTwo : UIColor){
//
//        let gradientLayer = CAGradientLayer()
//        gradientLayer.frame = bounds
//        gradientLayer.colors = [colorOne.cgColor, colorTwo.cgColor]
//        gradientLayer.locations = [0.0, 1.0]
//        gradientLayer.startPoint = CGPoint(x: 1.0, y: 1.0)
//        gradientLayer.endPoint = CGPoint(x: 0.0, y: 0.0)
//
//        layer.insertSublayer(gradientLayer, at: 0)
//    }
    
    
//    func pulsate2(){
//        let pulse = CASpringAnimation(keyPath: "transform.scale")
//        pulse.duration = 0.6
//        pulse.fromValue = 0.95
//        pulse.toValue = 1.0
//        pulse.autoreverses = true
//        pulse.repeatCount = 2
//        pulse.initialVelocity = 0.5
//        pulse.damping = 1.0
//
//        layer.add(pulse, forKey: nil)
//    }
    
//    func flash(){
//        let flash = CASpringAnimation(keyPath: "opacity")
//        flash.duration = 0.2
//        flash.fromValue = 1.0
//        flash.toValue = 0.9
//        flash.autoreverses = true
//        flash.repeatCount = 3
//        flash.initialVelocity = 0.5
//        flash.damping = 1.0
//
//        layer.add(flash, forKey: nil)
//    }
}
