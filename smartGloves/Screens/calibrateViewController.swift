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
    
    
    let counterLabel : testLabel = {
        let label = testLabel()
        label.font = UIFont(name: "Arial Rounded MT Bold", size: 20)
        label.textColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
        label.textAlignment = .center
        return label
    }()
    
    let startButton : UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Empezar", for: .normal)
        button.titleLabel?.font = UIFont(name: "Arial Rounded MT Bold", size: 23)
        button.setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        button.backgroundColor = .blue
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(label), for: .touchUpInside)
        return button
    }()
    
    @objc func label() {
//        print(Date.)
        counterLabel.count(fromValue: 0, to: 10, withDuration: 10, andAnimationType: .Linear, andCounterType: .Int)
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Se agregan las vistas creadas anteriormente a la vista principal
        view.addSubview(topConteinerView)
        topConteinerView.addSubview(backgroundContainerImageView)
        topConteinerView.addSubview(titleLabel)
        
        view.addSubview(counterLabel)
        view.addSubview(startButton)

        setupLayout()


    }
    
    
//    override func viewDidAppear(_ animated: Bool) {
//        super.viewDidAppear(animated)
//
//        counterLabel.count(fromValue: 0, to: 10, withDuration: 10, andAnimationType: .Linear, andCounterType: .Int)
//    }
    
    
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
        
        
        counterLabel.anchorCenter(centerX: view.centerXAnchor, centerY: view.centerYAnchor)
        counterLabel.anchorSize(width: nil, widthConstant: 150 , height: nil, heightConstant: 150)
        
        startButton.anchorCenter(centerX: view.centerXAnchor , centerY: view.centerYAnchor, Yconstant: 250)
        startButton.anchorSize(width: nil, widthConstant: 150 , height: nil, heightConstant: 150)
        
    }

}
