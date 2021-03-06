//
//  BaseDarkViewController.swift
//  smartGloves
//
//  Created by Gerardo on 06/05/20.
//  Copyright © 2020 Gerardo. All rights reserved.
//

import UIKit

class BaseDarkViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        //Color de background -> A navigation controller determines its "preferredStatusBarStyle" based on the navigation bar style.
        //As result, the status bar matches the bar style, without any extra code required.
        //.barStyle = .black --> SatusBarStyle = white
        //.barStyle = .default --> StatusBarStyle = black
        self.navigationController!.navigationBar.barStyle = .default
        //Transparencia del background
        self.navigationController!.navigationBar.isTranslucent = true
        //Color del icono y texto de la barra de navegacion
        self.navigationController!.navigationBar.tintColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        //Se hace visible o invisible(alargando) el background
        self.navigationController?.navigationBar.prefersLargeTitles = false
        
        self.navigationController?.isNavigationBarHidden = true
    }

    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }
}
