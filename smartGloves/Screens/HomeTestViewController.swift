//
//  HomeTestViewController.swift
//  smartGloves
//
//  Created by Gerardo on 30/04/20.
//  Copyright © 2020 Gerardo. All rights reserved.
//

import UIKit
import AVFoundation

class HomeTestViewController: BaseDarkViewController {
    
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
        
        let texto = "Los autores de los textos de este portal de cultura son periodistas con experiencia. Además, un equipo pedagógico se encarga de preparar cada reportaje o entrevista como recurso ELE para aprender español. Este portal crece cada día. Te invitamos a visitarlo regularmente y a seguir las novedades a través de Twitter, somos @hablacultura. Si lo tuyo es el email, contacta con la editorial de cultura y ELE Habla con Eñe.Los autores de los textos de este portal de cultura son periodistas con experiencia. Además, un equipo pedagógico se encarga de preparar cada reportaje o entrevista como recurso ELE para aprender español.Este portal crece cada día. Te invitamos a visitarlo regularmente y a seguir las novedades a través de Twitter, somos @hablacultura. Si lo tuyo es el email, contacta con la editorial de cultura y ELE Habla con Eñe."
        
        let textView = SGVerticallyCenteredTextView()
        textView.backgroundColor = .clear
        textView.font = UIFont(name: "Avenir", size: 25)
        textView.textColor = #colorLiteral(red: 0.05490196078, green: 0.1098039216, blue: 0.3803921569, alpha: 1)
        textView.text = texto///*"Hola, ¿cómo estás?"*/ "Hola, ¿cómo estás?, necesito ayuda para ir a esta dirección"
        textView.textAlignment = .center
        textView.isEditable = false
        textView.returnKeyType = UIReturnKeyType.done
        return textView
    }()
    
    
    //variable que se va a utilizar para la animacion del playAudioButton
    var playAudioButtonCenterXConstraint: NSLayoutConstraint!
    let playAudioButton : UIButton = {
        let button = SGCircularButton()
        button.backgroundColor = #colorLiteral(red: 0.05882352941, green: 0.05882352941, blue: 0.4392156863, alpha: 1)
        button.addTarget(self, action: #selector(playAudioButtonTapped), for: .touchDown)
        button.layer.borderColor = #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1)
        return button
    }()
    let backgroundPlayButton : UIImageView = {
        let button = UIImageView()
        button.image = #imageLiteral(resourceName: "playAudio")
       return button
    }()
    
    
    
    //variable que se va a utilizar para la animacion del stopAudioButton
    var stopAudioButtonCenterXConstraint: NSLayoutConstraint!
    let stopAudioButton : UIButton = {
        let button = SGCircularButton()
        button.backgroundColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
        button.addTarget(self, action: #selector(stopAudioButtonTapped), for: .touchDown)
        return button
    }()
    let backgroundStopButton : UIImageView = {
        let button = UIImageView()
        button.image = #imageLiteral(resourceName: "stopAudio")
       return button
    }()
    
    
    
    let useKeyboardButton : UIButton = {
        let button = SGEdgeInsetsButton(type: .system)
        button.layer.borderColor = #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1)
        button.layer.borderWidth = 2
        button.layer.cornerRadius = 10
        button.setTitle("Usa el teclado", for: .normal)
        button.setTitleColor(#colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1), for: .normal)
        button.titleLabel?.font = UIFont(name: "Avenir", size: 23)
        button.addTarget(self, action: #selector(useKeyboardButtonTapped), for: .touchDown)
        
        let icon = UIImage(systemName: "keyboard")!
        button.setImage(icon, for: .normal)
        button.imageView?.contentMode = .scaleToFill
        return button
    }()
    
    //Variable de tipo AVSpeechSynthesizer para utlizar reproduccion de texto a voz
    let synth = AVSpeechSynthesizer()

    override func viewDidLoad() {
        super.viewDidLoad()
                
        createObservers()
        
        synth.delegate = self
        textView.delegate = self
                
        [iconEarImageView, shadowTextView, textView, playAudioButton, stopAudioButton, useKeyboardButton].forEach{ view.addSubview($0) }
        stopAudioButton.addSubview(backgroundStopButton)
        playAudioButton.addSubview(backgroundPlayButton)
        view.sendSubviewToBack(stopAudioButton)
        
        
//        view.addSubview(iconEarImageView)
//        view.addSubview(shadowTextView)
//        view.addSubview(textView)
//        view.addSubview(playAudioButton)
//        view.addSubview(stopAudioButton)
//        stopAudioButton.addSubview(backgroundStopButton)
//        view.sendSubviewToBack(stopAudioButton)
//        playAudioButton.addSubview(backgroundPlayButton)
//        view.addSubview(useKeyboradButton)
        
        setupLayout()
        
        
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(keyboardWillHide))
        view.addGestureRecognizer(tap)
        
    }
        
    func createObservers(){
        //Call the 'keyboardWillShow' function when the controller receive nitification that keyboard is going to be show
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardDidShowNotification, object: nil)
        //Call the 'keyboardWillShow' function when the controller receive nitification that keyboard is going to be hidden
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
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
//        playAudioButton.anchorCenter(centerX: view.centerXAnchor, centerY: nil)
        playAudioButtonCenterXConstraint = playAudioButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        //Se activa la propiedad anterior
        playAudioButtonCenterXConstraint.isActive = true

        backgroundPlayButton.anchorCenter(centerX: playAudioButton.centerXAnchor, centerY: playAudioButton.centerYAnchor)
        backgroundPlayButton.anchorSize(width: playAudioButton.widthAnchor, widthMultiplier: 0.5, height: playAudioButton.heightAnchor, heightMultiplier: 0.5)
        
        
        stopAudioButton.anchorSize(width: nil, widthConstant: withCorrectionPlayAudioButton, height: nil, heightConstant: withCorrectionPlayAudioButton)
        stopAudioButton.anchor(top: textView.bottomAnchor, topConstant: 25, leading: nil, bottom: nil, trailing: nil)
        //Se asigna el centerXAnchor para despues utilizarlo para cambiar el valor de centerX y poder crear una animacion en el stopAudioButton
        stopAudioButtonCenterXConstraint = stopAudioButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        //Se activa la propiedad anterior
        stopAudioButtonCenterXConstraint.isActive = true

        backgroundStopButton.anchorCenter(centerX: stopAudioButton.centerXAnchor, centerY: stopAudioButton.centerYAnchor)
        backgroundStopButton.anchorSize(width: stopAudioButton.widthAnchor, widthMultiplier: 0.5, height: stopAudioButton.heightAnchor, heightMultiplier: 0.5)
        
        
        let heightCorrectionButtonKeyboard = min(80, view.frame.size.width * 0.14)
        
        useKeyboardButton.anchor(top: nil, leading: view.leadingAnchor, leadingConstant: view.frame.width * 0.055, bottom: view.bottomAnchor, bottomConstant: -30, trailing: view.trailingAnchor, trailingConstant: view.frame.width * -0.055)
        useKeyboardButton.anchorSize(width: nil, height: nil, heightConstant: heightCorrectionButtonKeyboard) //0.14

    }
    
    @objc func playAudioButtonTapped(sender: UIButton){
        let textString = textView.text!

        if !synth.isSpeaking {
            let myUtterance = AVSpeechUtterance(string: textString)

            myUtterance.voice = AVSpeechSynthesisVoice(language: languageCode)
            myUtterance.rate = 0.5
            synth.speak(myUtterance)
            animateCenterXConstraintPlayAudioButton()

        }
        else {
            if synth.isPaused {
                synth.continueSpeaking()
                sender.animationPulsate(duration: 100, fromValue: 0.97, toValue: 1, autoreverses: true, repeatCount: 100, initialVelocity: 0.5, damping: 0)

            }
            else {
                synth.pauseSpeaking(at: AVSpeechBoundary.immediate)
                playAudioButton.layer.removeAllAnimations()

            }
        }
    
    }
    
    
    @objc func stopAudioButtonTapped(sender: UIButton){
        synth.stopSpeaking(at: AVSpeechBoundary.immediate)
        backgroundPlayButton.image = #imageLiteral(resourceName: "playAudio")
        playAudioButton.layer.borderWidth = 0
        playAudioButton.layer.removeAllAnimations()
        animateCenterXConstraintStopAudioButton()
    }
    
    
    @objc func useKeyboardButtonTapped(){
//        let usuario = "test"
//
//        let postRequest = APIResquest(endpoint: "post/\(usuario)")
//
//        postRequest.get(completion: { result in
//            switch result{
//                case .success(let datos):
//
//                    DispatchQueue.main.async { // Correct
//                        let alert = UIAlertController(title: "", message: datos.usuario, preferredStyle: .alert)
//                        alert.addAction(UIAlertAction(title: "Aceptar", style: .cancel, handler: nil))
//                        self.present(alert, animated: true)
//                    }
//
//
//                case .failure(let err):
//                    print("Error: \(err)")
//            }
//        })
        
        textView.isEditable = true
        textView.becomeFirstResponder()
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
    
        guard let keyboardSize = (notification.userInfo?[ UIResponder.keyboardFrameEndUserInfoKey ] as? NSValue)?.cgRectValue else {
           // if keyboard size is not available for some reason, dont do anything
           return
        }
    
        //Calcula el alto que hay desde abajo de la vista principal hasta el shadowTextView
        let sizeBottomViewToShadowTextView = view.frame.height - (view.frame.height * 0.41 + shadowTextView.frame.height)
        //Se calcula la cantidad que se va a desplazar la vista principal negativamente (hacia arriba), pero se agrega el tamaño que hay entre la vista prinpal y el shadowView para que el shadowtextView quede al raz del teclado
        //Los 10 es para para que un poco separado del teclado. El valor siempre debe ser negativo o 0, de lo contrario la vista se desplazaría hacia abajo y quedaria una parte negra.
        let sizeTopKeyboardToShadowTextView = min(0, sizeBottomViewToShadowTextView - 10 - keyboardSize.height)
                
        view.frame.origin.y = sizeTopKeyboardToShadowTextView
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        //Oculta el teclado
        view.endEditing(true)
        view.frame.origin.y = 0
        textView.isEditable = false
    }
    
}

extension HomeTestViewController {
        func animateCenterXConstraintPlayAudioButton(){
    //        stopAudioButtonCenterXConstraint.constant = (view.frame.size.width * 0.25)
            stopAudioButtonCenterXConstraint.constant = (view.frame.size.width * 0.20)
            playAudioButtonCenterXConstraint.constant = (view.frame.size.width * -0.20)

            UIView.animate(withDuration: 0.9, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 4,
                options: .curveLinear, animations: {
                self.view.layoutIfNeeded()
            }, completion: nil)
            
        }
        
        func animateCenterXConstraintStopAudioButton(){
            stopAudioButtonCenterXConstraint.constant = 0
            playAudioButtonCenterXConstraint.constant = 0

            UIView.animate(withDuration: 0.4) {
                self.view.layoutIfNeeded()
            }
            
        }
}

extension HomeTestViewController : AVSpeechSynthesizerDelegate {
    
    func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, didStart utterance: AVSpeechUtterance) {
        backgroundPlayButton.image = #imageLiteral(resourceName: "pauseAudio")
        playAudioButton.layer.borderWidth = 3
        playAudioButton.animationPulsate(duration: 100, fromValue: 0.97, toValue: 1, autoreverses: true, repeatCount: 100, initialVelocity: 0.5, damping: 0)
    }
    
    func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, didFinish utterance: AVSpeechUtterance) {
        backgroundPlayButton.image = #imageLiteral(resourceName: "playAudio")
        playAudioButton.layer.borderWidth = 0
        playAudioButton.layer.removeAllAnimations()
        animateCenterXConstraintStopAudioButton()
    }
    
}

extension HomeTestViewController : UITextViewDelegate {
    
    //Al clickear el boton de aceptar en el teclado desaparece el mismo
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if(text == "\n") {
            textView.resignFirstResponder()
            return false
        }
        return true
    }
}
