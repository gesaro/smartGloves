//
//  CollectionViewController.swift
//  smartGloves
//
//  Created by Gerardo on 23/04/20.
//  Copyright © 2020 Gerardo. All rights reserved.
//

import UIKit

class CollectionViewController: BaseViewController {
    
    //Funcion anonima que se ejeucta despues de ser creada {}(), para agrupar los atributos del elemento y tener una mejor organizacion de codigo
    let back :UIImageView = {
       let imageView = UIImageView()
        //Se deahabilita la propiedad "translatesAutoresizingMaskIntoConstraints" del elemento para utilizar diseño automatico,esto para poder agregar las restricciones mediante programacion
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = #imageLiteral(resourceName: "iPhone_X-XS_7")
        return imageView
    }()

    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        view.addSubview(back)
        o()
    }
    
    func o() {
        NSLayoutConstraint.activate([
            back.topAnchor.constraint(equalTo: view.topAnchor),
            back.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            back.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            back.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        view.sendSubviewToBack(back)
    }

    

}
