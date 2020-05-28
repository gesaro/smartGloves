//
//  testSplashScreenViewController.swift
//  smartGloves
//
//  Created by Gerardo on 18/05/20.
//  Copyright © 2020 Gerardo. All rights reserved.
//

import UIKit

class testSplashScreenViewController: BaseLightViewController {
    
    let backgroundImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "aaa")
        return imageView
    }()
    
    let titleLabel : UILabel = {
        let label = SGTitleLabel()
        label.text = "Smart Gloves"
        return label
    }()
    
    let iconSmartGlovesImageView : UIImageView = {
       let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "iconSmartGloves")
        return imageView
    }()
    
    let textTextView : UITextView = {
        let textView = UITextView()
        textView.backgroundColor = #colorLiteral(red: 1, green: 0, blue: 0.3352953767, alpha: 0)
        textView.text = "Comunicación \n sin barreras"
        textView.font = UIFont(name: "Arial Rounded MT Bold", size: 25)
        textView.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        textView.textAlignment = .center
        textView.isEditable = false
        textView.isSelectable = false
        
        return textView
    }()
    
    let buttonStart : UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Comenzar", for: .normal)
        button.titleLabel?.font = UIFont(name: "Avenir", size: 25)
        button.setTitleColor(#colorLiteral(red: 0.05490196078, green: 0.1098039216, blue: 0.3803921569, alpha: 1), for: .normal)
        button.layer.cornerRadius = 27
        button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        button.addTarget(self, action: #selector(startButtonTapped), for: .touchDown)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
                
        [backgroundImageView, titleLabel, iconSmartGlovesImageView, textTextView, buttonStart].forEach{ view.addSubview($0) }
        
        
        setupLayout()
    }
    
    
    func setupLayout(){
        
        backgroundImageView.fillView(to: view)
        
        
        titleLabel.anchor(top: view.topAnchor, topConstant: view.frame.height * 0.21, leading: view.leadingAnchor, leadingConstant: 12, bottom: nil, trailing: view.trailingAnchor, trailingConstant: -12)
        titleLabel.anchorSize(width: nil, height: nil, heightConstant: 50)
        
        
        iconSmartGlovesImageView.anchorCenter(centerX: view.centerXAnchor, centerY: nil)
        iconSmartGlovesImageView.anchorSize(width: nil, widthConstant: 140, height: nil, heightConstant: 115)
        iconSmartGlovesImageView.anchor(top: view.topAnchor, topConstant: view.frame.height * 0.5 - 122 ,leading: nil, bottom: nil, trailing: nil)
        
        
        textTextView.anchorSize(width: nil, height: nil, heightConstant: 100)
        textTextView.anchor(top: view.topAnchor, topConstant: view.frame.height * 0.54, leading: view.leadingAnchor, leadingConstant: 12 ,bottom: nil, trailing: view.trailingAnchor, trailingConstant: -12)
                
        
        buttonStart.anchor(top: textTextView.bottomAnchor, topConstant: 20 ,leading: view.leadingAnchor, leadingConstant: 60 ,bottom: nil, trailing: view.trailingAnchor, trailingConstant: -60)
        buttonStart.anchorSize(width: nil ,height: nil, heightConstant: 57)
        
            
        
        view.sendSubviewToBack(backgroundImageView)
    }
    
    @objc func startButtonTapped(){
//        performSegue(withIdentifier: "testCalibrate", sender: nil)
    }
    
}
