//
//  ViewController.swift
//  smartGloves
//
//  Created by Gerardo on 20/04/20.
//  Copyright © 2020 Gerardo. All rights reserved.
//

import UIKit

class ViewController: BaseViewController {
        
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        navigationController?.isNavigationBarHidden = true
        
    }
    
    
//    override var preferredStatusBarStyle: UIStatusBarStyle {
//        return .lightContent
//    }

    
    @IBAction func next(_ sender: Any) {
        performSegue(withIdentifier: "settingsViewController", sender: nil)
//        navigationController?.popViewController(animated: true)
    }
    
    
}
