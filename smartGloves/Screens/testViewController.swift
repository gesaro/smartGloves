//
//  testViewController.swift
//  smartGloves
//
//  Created by Gerardo on 22/04/20.
//  Copyright © 2020 Gerardo. All rights reserved.
//

import UIKit
import AVFoundation

class testViewController: UIViewController {

    var vel = 0.0
    
    let synth = AVSpeechSynthesizer()
    var myUtterance = AVSpeechUtterance(string: "")
    
    
    @IBOutlet weak var but: UIButton!
    @IBOutlet weak var text: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    
    
    @IBAction func textToSpeech(_ sender: UIButton) {
        var textString = ""
        
        if text.text == "" {
            textString = "this text is used as an exmaple for this text to speech application"
        }
        else {
            textString = text.text
        }
        myUtterance = AVSpeechUtterance(string: textString)
        //LenguageCode
        //español Mexico -> es-MX
        //ingles Estados Unidos -> en-US
        //portugues Brazil -> pt-BR
        //(chino simplificado)Mandarin china -> zh-Hans
        //Ruso Rusio -> ru
        myUtterance.voice = AVSpeechSynthesisVoice(language: "ru")
        myUtterance.rate = Float(vel)
        synth.speak(myUtterance)
    }
    

    @IBAction func bajar(_ sender: Any) {
        if vel != 0 {
            vel = vel - 0.1
        }
        but.setTitle(String(vel), for: .normal)
    }
    
    @IBAction func subir(_ sender: Any) {
        vel = vel + 0.1
        but.setTitle(String(vel), for: .normal)
    }
    
}
