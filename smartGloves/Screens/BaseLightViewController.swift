//
//  BaseViewController.swift
//  smartGloves
//
//  Created by Gerardo on 22/04/20.
//  Copyright © 2020 Gerardo. All rights reserved.
//

import UIKit

class BaseLightViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Color de background -> A navigation controller determines its "preferredStatusBarStyle" based on the navigation bar style.
        //As result, the status bar matches the bar style, without any extra code required.
        //.barStyle = .black --> SatusBarStyle = white
        //.barStyle = .default --> StatusBarStyle = black
        self.navigationController!.navigationBar.barStyle = .black
        //Transparencia del background
        self.navigationController!.navigationBar.isTranslucent = true
        //Color del icono y texto de la barra de navegacion
        self.navigationController!.navigationBar.tintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        //Se hace visible o invisible(alargando) el background
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        self.navigationController?.isNavigationBarHidden = false
    }
    
}
