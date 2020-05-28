//
//  calibrateViewController.swift
//  smartGloves
//
//  Created by Gerardo on 22/04/20.
//  Copyright © 2020 Gerardo. All rights reserved.
//

import UIKit

class calibrateViewController: BaseLightViewController {

    let topConteinerView = UIView()
    
    let backgroundContainerImageView : UIImageView = {
      let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "back3")
        return imageView
    }()
    
    let titleLabel : UILabel = {
        let label = SGTitleLabel()
        label.text = "Calibrar"
        return label
    }()
       
    
    let helpButton : UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = #colorLiteral(red: 0.1254901961, green: 0.537254902, blue: 0.9490196078, alpha: 1)
        button.layer.cornerRadius = 10
        button.setShadow(color: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), size: .init(width: -2, height: 2), radius: 4, opacity: 0.2)
        button.addTarget(self, action: #selector(helpButtonTapped), for: .touchUpInside)
        return button
    }()
    
    let backgroundHelpButton : UIImageView = {
        let button = UIImageView()
        button.image = #imageLiteral(resourceName: "help")
       return button
    }()
    
    let calibrateAlphabetButton : UIButton = {
        let button = UIButton()
        button.backgroundColor = #colorLiteral(red: 0.1254901961, green: 0.537254902, blue: 0.9490196078, alpha: 1)
        button.layer.cornerRadius = 10
        button.setShadow(color: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), size: .init(width: -2, height: 2), radius: 4, opacity: 0.2)
        button.addTarget(self, action: #selector(calibrateButtonTapped), for: .touchDown)
        return button
    }()
    
    
    let backgroundCalibrateButton : UIImageView = {
        let button = UIImageView()
        button.image = #imageLiteral(resourceName: "calibrateAlphabet")
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
                    
        //Se agregan las vistas creadas anteriormente a la vista principal
        [topConteinerView, helpButton, calibrateAlphabetButton].forEach{ view.addSubview($0) }
        [backgroundContainerImageView, titleLabel].forEach{ topConteinerView.addSubview($0) }
        helpButton.addSubview(backgroundHelpButton)
        calibrateAlphabetButton.addSubview(backgroundCalibrateButton)
        
        setupLayout()
    }
        
    
    //Funcion que contiene las restricciones de todos los elementos creados anteriormente
    func setupLayout(){
        
        //Restricciones del topContentView
        topConteinerView.anchor(top: view.topAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor)
        topConteinerView.anchorSize(width: nil, height: view.heightAnchor, heightMultiplier: 0.32)

        //Restricciones del backgroundImageView dentro del topConteinerView
        backgroundContainerImageView.fillView(to: topConteinerView)

        //Restricciones del titleLabel dentro del topConteinerView
        titleLabel.anchor(top: nil, leading: topConteinerView.leadingAnchor, leadingConstant: 12, bottom: nil, trailing: topConteinerView.trailingAnchor, trailingConstant: -12)
        titleLabel.anchorCenter(centerX: nil, centerY: topConteinerView.centerYAnchor)
        titleLabel.anchorSize(width: nil, height: nil, heightConstant: 50)
        
                
        //Restricciones del Button idioma dentro de la view principal
        helpButton.anchor(top: topConteinerView.bottomAnchor, topConstant: 50, leading: view.leadingAnchor, leadingConstant: 65, bottom: nil, trailing: nil)
        helpButton.anchorSize(width: view.heightAnchor, widthMultiplier: 0.14, height: view.heightAnchor, heightMultiplier: 0.14)

        //Restricciones del background del idiomaButton
        backgroundHelpButton.anchorCenter(centerX: helpButton.centerXAnchor, centerY: helpButton.centerYAnchor)
        backgroundHelpButton.anchorSize(width: helpButton.widthAnchor, widthMultiplier: 0.75, height: helpButton.heightAnchor, heightMultiplier: 0.75)

        
        //Restricciones del Button calibrar dentro de la view principal
        calibrateAlphabetButton.anchor(top: topConteinerView.bottomAnchor, topConstant: 50, leading: nil, bottom: nil, trailing: view.trailingAnchor, trailingConstant: -65)
        calibrateAlphabetButton.anchorSize(width: view.heightAnchor, widthMultiplier: 0.14, height: view.heightAnchor, heightMultiplier: 0.14)

        //Restricciones del background del calibrarButton
        backgroundCalibrateButton.anchorCenter(centerX: calibrateAlphabetButton.centerXAnchor, centerY: calibrateAlphabetButton.centerYAnchor)
        backgroundCalibrateButton.anchorSize(width: calibrateAlphabetButton.widthAnchor, widthMultiplier: 0.75, height: calibrateAlphabetButton.heightAnchor, heightMultiplier: 0.75)
    
    }
    
    
    @objc func helpButtonTapped(sender : UIButton){
        sender.animationPulsate(duration: 0.2, fromValue: 0.96, toValue: 1, autoreverses: true, repeatCount: 0.5, initialVelocity: 0.5, damping: 1)
        
        performSegue(withIdentifier: "testSplash", sender: nil)
    }
    
    @objc func calibrateButtonTapped(sender : UIButton){
        sender.animationPulsate(duration: 0.2, fromValue: 0.96, toValue: 1, autoreverses: true, repeatCount: 0.5, initialVelocity: 0.5, damping: 1)
        
        performSegue(withIdentifier: "calibrateAlphabetViewController", sender: nil)
    }

}
