//
//  HomeTestViewController.swift
//  smartGloves
//
//  Created by Gerardo on 30/04/20.
//  Copyright © 2020 Gerardo. All rights reserved.
//

import UIKit
import AVFoundation

class HomeTestViewController: BaseViewController {
    
    let image = UIImageView()
    
    
    let iconEarImageView : UIImageView = {
       let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "iconAudio")
        return imageView
    }()
    
    let shadowTextView : UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.9529411765, green: 0.9529411765, blue: 0.9529411765, alpha: 1)
        view.layer.cornerRadius = 11
        view.setShadow(color: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), size: .init(width: 0, height: 3), radius: 3.1, opacity: 0.19)
        return view
    }()
    
    let textView : UITextView = {
        let textView = SGVerticallyCenteredTextView()
        textView.backgroundColor = .clear
        textView.font = UIFont(name: "Avenir", size: 25)
        textView.textColor = #colorLiteral(red: 0.05490196078, green: 0.1098039216, blue: 0.3803921569, alpha: 1)
        textView.text = "Hola, ¿cómo estás?" //"Hola, ¿cómo estás?, necesito ayuda para ir a esta dirección"
        textView.textAlignment = .center
        return textView
    }()
    
    
    let playAudioButton : UIButton = {
        let button = SGCircularButton()
        button.backgroundColor = #colorLiteral(red: 0.05882352941, green: 0.05882352941, blue: 0.4392156863, alpha: 1)
        button.addTarget(self, action: #selector(playAudioButtonTapped), for: .touchDown)
        return button
    }()
    
    let backgroundPlayButton : UIImageView = {
        let button = UIImageView()
        button.image = #imageLiteral(resourceName: "playAudio")
       return button
    }()
    
    let useKeyboradButton : UIButton = {
        let button = buttonWidth(type: .system)
//        button.backgroundColor = #colorLiteral(red: 0.05882352941, green: 0.05882352941, blue: 0.4392156863, alpha: 1)
        button.layer.borderColor = #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1)
        button.layer.borderWidth = 2
        button.layer.cornerRadius = 10
        button.setTitle("Usa el teclado", for: .normal)
        button.setTitleColor(#colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1), for: .normal)
        button.titleLabel?.font = UIFont(name: "Avenir", size: 23)   //Helvetica Neue
        button.addTarget(self, action: #selector(useKeyboardButtonTapped), for: .touchDown)
        
        let icon = UIImage(systemName: "keyboard")!
        button.setImage(icon, for: .normal)
        button.imageView?.contentMode = .scaleToFill
        return button
    }()
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
//        image.image = #imageLiteral(resourceName: "iph")
//        view.addSubview(image)
//        image.fillView(to: view)
//        view.sendSubviewToBack(image)
        
        view.addSubview(iconEarImageView)
        view.addSubview(shadowTextView)
        view.addSubview(textView)
        view.addSubview(playAudioButton)
        playAudioButton.addSubview(backgroundPlayButton)
        view.addSubview(useKeyboradButton)
        
        
        setupLayout()

    }
    
    func setupLayout(){
        //El alto del ipad es demasiado, por eso se toma como maximo de separacion al top de 165
        let topCorrectionIconEarImageView = min(165, view.frame.height * 0.18)//200
        //El ancho del ipad, por eso se toma como maximo de ancho del icono de 165
        let withCorrectionIconEarImageView = min(240, view.frame.width * 0.32) //300
        
        iconEarImageView.anchor(top: view.topAnchor, topConstant: topCorrectionIconEarImageView, leading: nil, bottom: nil, trailing: nil)
        iconEarImageView.anchorSize(width: nil, widthConstant: withCorrectionIconEarImageView, height: nil, heightConstant: withCorrectionIconEarImageView)
        iconEarImageView.anchorCenter(centerX: view.centerXAnchor, centerY: nil)

        shadowTextView.anchor(top: view.topAnchor, topConstant: view.frame.height * 0.41, leading: view.leadingAnchor, leadingConstant: view.frame.width * 0.05, bottom: nil, trailing: view.trailingAnchor, trailingConstant: view.frame.width * -0.05)
        shadowTextView.anchorSize(width: nil, height: view.heightAnchor, heightMultiplier: 0.27)

        textView.anchor(top: view.topAnchor, topConstant: view.frame.height * 0.41, leading: view.leadingAnchor, leadingConstant: view.frame.width * 0.05, bottom: nil, trailing: view.trailingAnchor, trailingConstant: view.frame.width * -0.05)
        textView.anchorSize(width: nil, height: view.heightAnchor, heightMultiplier: 0.27)


        //El ancho del ipad es demasiado, por eso se toma un maximo ancho del boton de 120
        let withCorrectionPlayAudioButton = min(120, view.frame.size.width * 0.17)

        playAudioButton.anchorSize(width: nil, widthConstant: withCorrectionPlayAudioButton, height: nil, heightConstant: withCorrectionPlayAudioButton)
        playAudioButton.anchor(top: textView.bottomAnchor, topConstant: 25, leading: nil, bottom: nil, trailing: nil)
        playAudioButton.anchorCenter(centerX: view.centerXAnchor, centerY: nil)

        backgroundPlayButton.anchorCenter(centerX: playAudioButton.centerXAnchor, centerY: playAudioButton.centerYAnchor)
        backgroundPlayButton.anchorSize(width: playAudioButton.widthAnchor, widthMultiplier: 0.5, height: playAudioButton.heightAnchor, heightMultiplier: 0.5)
        
        let heightCorrectionKeyboar = min(80, view.frame.size.width * 0.14)
        print(heightCorrectionKeyboar)
        
        useKeyboradButton.anchor(top: nil, leading: view.leadingAnchor, leadingConstant: view.frame.width * 0.055, bottom: view.bottomAnchor, bottomConstant: -30, trailing: view.trailingAnchor, trailingConstant: view.frame.width * -0.055)
        useKeyboradButton.anchorSize(width: nil, height: nil, heightConstant: heightCorrectionKeyboar) //0.14

    }
    
    
    @objc func playAudioButtonTapped(sender: UIButton){
        sender.animationPulsate(duration: 0.2, fromValue: 0.9, toValue: 1.15, autoreverses: true, repeatCount: 0.5, initialVelocity: 0.5, damping: 1)
        
        var textString = ""
        
        if textView.text == "" {
            textString = "this text is used as an exmaple for this text to speech application"
        }
        else {
            textString = textView.text
        }
        
        
        let myUtterance = AVSpeechUtterance(string: textString)
        let synth = AVSpeechSynthesizer()
        //LenguageCode
        //español Mexico -> es-MX
        //ingles Estados Unidos -> en-US
        //portugues Brazil -> pt-BR
        //(chino simplificado)Mandarin china -> zh-Hans
        //Ruso Rusio -> ru
        myUtterance.voice = AVSpeechSynthesisVoice(language: "ru")
        myUtterance.rate = 0.5
        synth.speak(myUtterance)
    }
    
    @objc func useKeyboardButtonTapped(){
//        let postRequest = APIResquest(endpoint: "post/\(usuario)")
//
//        postRequest.get(datos, completion: { result in
//            switch result{
//                case .success(let datos):
//                    if password == datos.password {
//                        DispatchQueue.main.async { // Correct
//                           self.performSegue(withIdentifier: "secondView", sender: self)
//                        }
//
//                    }
//                    else {
//                        DispatchQueue.main.async { // Correct
//                            let alert = UIAlertController(title: "", message: "Contraseña incorrecta", preferredStyle: .alert)
//                            alert.addAction(UIAlertAction(title: "Aceptar", style: .cancel, handler: nil))
//                            self.present(alert, animated: true)
//                            self.tfdPassword.text = ""
//                        }
//                    }
//                case .failure(let err):
//                    print("Error: \(err)")
//            }
//        })
        
        
    }
    
}

class buttonWidth : UIButton{
    override func layoutSubviews() {
        super.layoutSubviews()
        if imageView != nil {
            
            var leadingIconKeyboard = CGFloat(0.0)
            var leadingTitleButton = CGFloat(0.0)
            
            if superview?.frame.width != nil {
                if (superview?.frame.width)! <= 375 {
                    leadingIconKeyboard = 110
                    leadingTitleButton = 90
                }
                else {
                    leadingIconKeyboard = bounds.width * 0.42
                    leadingTitleButton = bounds.width * 0.3662
                }
            }
            

            imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: leadingIconKeyboard)
            titleEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: leadingTitleButton)
            
//            imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 155)
//            titleEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 135)
        }

    }

}
