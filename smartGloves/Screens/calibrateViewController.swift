//
//  calibrateViewController.swift
//  smartGloves
//
//  Created by Gerardo on 22/04/20.
//  Copyright © 2020 Gerardo. All rights reserved.
//

import UIKit

class calibrateViewController: BaseViewController {

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
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Se agregan las vistas creadas anteriormente a la vista principal
        view.addSubview(topConteinerView)
        topConteinerView.addSubview(backgroundContainerImageView)
        topConteinerView.addSubview(titleLabel)

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
    }

}
