//
//  settingsViewController.swift
//  smartGloves
//
//  Created by Gerardo on 21/04/20.
//  Copyright © 2020 Gerardo. All rights reserved.
//

import UIKit

class settingsViewController: BaseLightViewController {
    
    let backBarButton = UIBarButtonItem(title: "Ajustes", style: .plain, target: nil, action: nil)
        
    let topConteinerView = UIView()
    
    //Funcion anonima que se ejeucta despues de ser creada {}(), para agrupar los atributos del elemento y tener una mejor organizacion de codigo
    let backgroundContainerImageView : UIImageView = {
      let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "back3")
        return imageView
    }()

    
    let titleLabel : UILabel = {
        let label = SGTitleLabel()
        label.text = "Ajustes"
        return label
    }()
    
    
    let idiomButton : UIButton = {
        let button = UIButton()
        button.backgroundColor = #colorLiteral(red: 0.1254901961, green: 0.537254902, blue: 0.9490196078, alpha: 1)
        button.layer.cornerRadius = 10
        button.setShadow(color: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), size: .init(width: -2, height: 2), radius: 4, opacity: 0.2)
        button.addTarget(self, action: #selector(idiomButtonTapped), for: .touchDown)
        return button
    }()
    
    
    let backgroundIdiomButton : UIImageView = {
        let button = UIImageView()
        button.image = #imageLiteral(resourceName: "idioma")
        return button
    }()
    
    let calibrateButton : UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = #colorLiteral(red: 0.1254901961, green: 0.537254902, blue: 0.9490196078, alpha: 1)
        button.layer.cornerRadius = 10
        button.setShadow(color: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), size: .init(width: -2, height: 2), radius: 4, opacity: 0.2)
        button.addTarget(self, action: #selector(calibrateButtonTapped), for: .touchUpInside)
        return button
    }()
    
    let backgroundCalibrateButton : UIImageView = {
        let button = UIImageView()
        button.image = #imageLiteral(resourceName: "calibrar")
       return button
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.backBarButtonItem = backBarButton

        
        //Se agregan las vistas creadas anteriormente a la vista principal
        view.addSubview(topConteinerView)
        topConteinerView.addSubview(backgroundContainerImageView)
        topConteinerView.addSubview(titleLabel)

        view.addSubview(idiomButton)
        idiomButton.addSubview(backgroundIdiomButton)
        
        view.addSubview(calibrateButton)
        calibrateButton.addSubview(backgroundCalibrateButton)

        setupLayout()
    }
    
    
    //Funcion que contiene las restricciones de todos los elementos creados anteriormente
    func setupLayout(){
        
        //Restricciones del topContentView
        topConteinerView.anchor(top: view.topAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor)
        topConteinerView.anchorSize(width: nil, height: view.heightAnchor, heightMultiplier : 0.32)

        //Restricciones del backgroundImageView dentro del topConteinerView
        backgroundContainerImageView.anchor(top: topConteinerView.topAnchor, leading: topConteinerView.leadingAnchor, bottom: topConteinerView.bottomAnchor, trailing: topConteinerView.trailingAnchor)

        //Restricciones del titleLabel dentro del topConteinerView
        titleLabel.anchor(top: nil, leading: topConteinerView.leadingAnchor, bottom: nil, trailing: topConteinerView.trailingAnchor)
        titleLabel.anchorCenter(centerX: nil, centerY: topConteinerView.centerYAnchor)
        titleLabel.anchorSize(width: nil, height: nil, heightConstant: 50)
        
        //Restricciones del Button idioma dentro de la view principal
        idiomButton.anchor(top: topConteinerView.bottomAnchor, topConstant: 50, leading: view.leadingAnchor, leadingConstant: 50, bottom: nil, trailing: nil)
        idiomButton.anchorSize(width: view.heightAnchor, widthMultiplier: 0.16, height: view.heightAnchor, heightMultiplier: 0.16)

        //Restricciones del background del idiomaButton
        backgroundIdiomButton.anchorCenter(centerX: idiomButton.centerXAnchor, centerY: idiomButton.centerYAnchor)
        backgroundIdiomButton.anchorSize(width: idiomButton.widthAnchor, widthMultiplier: 0.7, height: idiomButton.heightAnchor, heightMultiplier: 0.7)

        //Restricciones del Button calibrar dentro de la view principal
        calibrateButton.anchor(top: topConteinerView.bottomAnchor, topConstant: 50, leading: nil, bottom: nil, trailing: view.trailingAnchor, trailingConstant: -50)
        calibrateButton.anchorSize(width: view.heightAnchor, widthMultiplier: 0.16, height: view.heightAnchor, heightMultiplier: 0.16)

        //Restricciones del background del calibrarButton
        backgroundCalibrateButton.anchorCenter(centerX: calibrateButton.centerXAnchor, centerY: calibrateButton.centerYAnchor)
        backgroundCalibrateButton.anchorSize(width: calibrateButton.widthAnchor, widthMultiplier: 0.7, height: calibrateButton.heightAnchor, heightMultiplier: 0.7)
        
        view.sendSubviewToBack(backgroundContainerImageView)
    }
        
    
    @objc func idiomButtonTapped(sender : UIButton){
        sender.animationPulsate(duration: 0.2, fromValue: 0.96, toValue: 1, autoreverses: true, repeatCount: 0.5, initialVelocity: 0.5, damping: 1)
        
        performSegue(withIdentifier: "idiomViewController", sender: nil)
    }
    
    @objc func calibrateButtonTapped(sender : UIButton){
        sender.animationPulsate(duration: 0.2, fromValue: 0.96, toValue: 1, autoreverses: true, repeatCount: 0.5, initialVelocity: 0.5, damping: 1)
        
        performSegue(withIdentifier: "calibrateViewController", sender: nil)
    }
    

}
