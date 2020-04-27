//
//  calibrateViewController.swift
//  smartGloves
//
//  Created by Gerardo on 22/04/20.
//  Copyright © 2020 Gerardo. All rights reserved.
//

import UIKit

class calibrateViewController: BaseViewController {

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
        label.text = "Calibrar"
        label.font = UIFont(name: "Arial Rounded MT Bold", size: 37)
        label.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        label.textAlignment = .center
        return label
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Se agregan las vistas creadas anteriormente a la vista principal
        view.addSubview(topConteinerView)
        topConteinerView.addSubview(backgroundImageView)
        topConteinerView.addSubview(titleLabel)

        setupLayout()


    }
    
    
    func setupLayout(){
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
            titleLabel.heightAnchor.constraint(equalToConstant: 50)

        ])
        view.sendSubviewToBack(backgroundImageView)
    }

}
