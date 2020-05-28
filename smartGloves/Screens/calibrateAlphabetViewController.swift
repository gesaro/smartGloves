//
//  testCalibrateViewController.swift
//  smartGloves
//
//  Created by Gerardo on 19/05/20.
//  Copyright © 2020 Gerardo. All rights reserved.
//

import UIKit

private let reuseIdentifier = "letterCell"

let letter = ["A", "B", "C", "D", "E" ,"F" ,"G" ,"H", "I", "J", "K", "L", "M", "N", "Ñ", "O", "P", "Q", "R", "S", "T" ,"U" ,"V" ,"W", "X", "Y", "Z"]

//Variable que cambia conforme a la letra que se esta calibrando, esto para saber a que página ir cuando preciona los botones prevLeeterButton, nextLeeterButton o cuando hace swiping
var pageControl = 0


class calibrateAlphabetViewController: UIViewController {
    
    let calibrateLetterCellCollectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        view.register(LetterCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        view.isPagingEnabled = true
        return view
    }()
    
     let titleLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Arial", size: 20)
        label.text = "Calibrar guante"
        label.textAlignment = .center
        return label
    }()

    
    let doneButton : UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Listo", for: .normal)
        button.titleLabel?.font = UIFont(name: "Arial", size: 18)
        button.setTitleColor(#colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1), for: .normal)
        button.addTarget(self, action: #selector(doneButtonTapped), for: .touchDown)
        return button
    }()
    
    let counterLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Arial Rounded MT Bold", size: 85)
        label.textColor = #colorLiteral(red: 0.05882352941, green: 0.05882352941, blue: 0.4392156863, alpha: 1)
        label.textAlignment = .center
        label.isHidden = true
        return label
    }()
    
    var counterValue = 0
    //Timer es una clase que utilizaremos para disparar una funcion de cada n tiempo.
    var counterTimer : Timer?
    
    
    let prevLetterButton : UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("ANTERIOR", for: .normal)
        button.titleLabel?.font = UIFont(name: "Avenir", size: 15)
        button.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(prevButtonTapped), for: .touchDown)
        return button
    }()

    
    let nextLetterButton : UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("SIGUIENTE", for: .normal)
        button.titleLabel?.font = UIFont(name: "Avenir", size: 15)
        button.setTitleColor(#colorLiteral(red: 0.9098039216, green: 0.2596280571, blue: 0.3835557644, alpha: 1), for: .normal)
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(nextButtonTapped), for: .touchDown)
        return button
    }()
    
    
    let checkShapeLayer = CAShapeLayer()
    
    
    
    
            
    override func viewDidLoad() {
        super.viewDidLoad()
        
        animationSetup()
        view.layer.addSublayer(checkShapeLayer)
        
        [titleLabel, doneButton ,counterLabel, prevLetterButton, nextLetterButton, calibrateLetterCellCollectionView].forEach { view.addSubview($0) }
        calibrateLetterCellCollectionView.delegate = self
        calibrateLetterCellCollectionView.dataSource = self
        
        setupLayout()
    }
    
    func animationSetup(){
        checkShapeLayer.strokeColor = UIColor(red: 0.09803921569, green: 0.8, blue: 0.2784313725, alpha: 1).cgColor
        checkShapeLayer.lineWidth = 10
        checkShapeLayer.fillColor = UIColor.clear.cgColor
        checkShapeLayer.lineCap = CAShapeLayerLineCap.round
        checkShapeLayer.strokeEnd = 0
    }


    func setupLayout(){

        titleLabel.anchor(top: view.topAnchor,topConstant: 20,  leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor)
        titleLabel.anchorSize(width: nil, height: nil, heightConstant: 40) //140
        
        doneButton.anchor(top: view.topAnchor,topConstant: 20,  leading: nil, bottom: nil, trailing: view.trailingAnchor, trailingConstant: -10)
        doneButton.anchorSize(width: nil, widthConstant: 75, height: nil, heightConstant: 40) //140
        
        counterLabel.anchorCenter(centerX: view.centerXAnchor, centerY: view.centerYAnchor, Yconstant: 100)
        counterLabel.anchorSize(width: nil, widthConstant: 90 , height: nil, heightConstant: 90)
        
        prevLetterButton.anchor(top: nil, leading: view.leadingAnchor, leadingConstant: 20 , bottom: view.safeAreaLayoutGuide.bottomAnchor, bottomConstant: -10 ,trailing: nil)
        prevLetterButton.anchorSize(width: nil, widthConstant: view.frame.width * 0.34 , height: nil, heightConstant: 40)

        nextLetterButton.anchor(top: nil, leading: nil, bottom: view.safeAreaLayoutGuide.bottomAnchor, bottomConstant: -10, trailing: view.trailingAnchor )
        nextLetterButton.anchorSize(width: nil, widthConstant: view.frame.width * 0.34, height: nil, heightConstant: 40) //140

        calibrateLetterCellCollectionView.anchor(top: view.topAnchor, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor)
        
        view.sendSubviewToBack(calibrateLetterCellCollectionView)
    }
    
    
    
        
    @objc func startButtonTapped(sender : UIButton) {
        sender.animationPulsate(duration: 0.2, fromValue: 0.96, toValue: 1, autoreverses: true, repeatCount: 0.5, initialVelocity: 0.5, damping: 1)
        //invalite(), Evita que el temporizador vuelva a dispararse y solicita su eliminación de su ciclo de ejecución, para evitar que se empalmen.
        //counterValue, Es el valor inicial que ira en retroceso.
        //counterTimer, Se crea un temporizador que ejecuta la funcion "updateCounterLabel" cada 1 segundo.
        counterTimer?.invalidate()
        counterValue = 3
        counterLabel.isHidden = false
        counterTimer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounterLabel), userInfo: nil, repeats: true)
        counterLabel.text = String(counterValue)
        counterValue -= 1
        
        //Se desactiva la interaccion con los botones para que no pueda pasar a la siguiente pagina sin haber calibrado la letra de la pagina actual.
        prevLetterButton.isEnabled = false
        nextLetterButton.isEnabled = false
        calibrateLetterCellCollectionView.isScrollEnabled = false
        
    }
    
    //Funcion que sera ejecutada cada segundo, donde ira actualizando el valor de la etiqueta(tipo temporizador) para que el usuario pueda adoptar la posicion con el guante.
    @objc func updateCounterLabel(){
        if counterValue != 0 {
            counterLabel.text = String(counterValue)
            counterValue -= 1
        }
        else {
            counterLabel.isHidden = true
            counterTimer?.invalidate()
            
            //Ya que pasaron los 3 segundos se activara el estado para que se puedan recivir datos del guante, este se desactivara 1 segundo despues.
            stateToRecvData = .active
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                stateToRecvData = .inactive
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
                let postRequest = APIResquest(endpoint: "data")
                
                var string = "{'ax':1300,'ay':200,'az':1723,'gx':637,'gy':319,'gz':35,'d1':20,'d2':30,'d3':40,'d4':50}"
                string = string.replacingOccurrences(of: "'", with: "\"")
                let data = string.data(using: .utf8)!


                do {
                    if let jsonArray = try JSONSerialization.jsonObject(with: data, options : []) as? [String: Any] {
                        
                        guard  let ax = jsonArray["ax"] as? Int, let ay = jsonArray["ay"] as? Int, let az = jsonArray["az"] as? Int, let gx = jsonArray["gx"] as? Int, let gy = jsonArray["gy"] as? Int, let gz = jsonArray["gz"] as? Int, let d1 = jsonArray["d1"] as? Int, let d2 = jsonArray["d2"] as? Int, let d3 = jsonArray["d3"] as? Int, let d4 = jsonArray["d4"] as? Int else { return }
                        
                        let datos = sensorsData(ax: ax, ay: ay, az: az, gx: gx, gy: gy, gz: gz, d1: d1, d2: d2, d3: d3, d4: d4, target: letter[pageControl], idiom : languageCode)
                        postRequest.save(datos, completion: { result in
                            switch result{
                                case .success(let response):
                                    print("mensaje: \(response.mensaje)\n")
                                  
                                case .failure(let err):
                                    print("Error: \(err)")
                            }
                        })

                    } else {
                        print("bad json")
                    }
                } catch let error as NSError {
                    print(error)
                }
                
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

                
                
                
                
                
                
                //Se activa la interaccion con los botones cuando termino el tiempo de calibrado(1 segundo).
                self.prevLetterButton.isEnabled = true
                self.nextLetterButton.isEnabled = true
                self.calibrateLetterCellCollectionView.isScrollEnabled = true
                self.checkAnimation()
            }
            
            
        }
    }
    
    @objc private func nextButtonTapped(){
        //Al clickear el boton se actualiza el valor de pageControl para despues ir a esa pagina.
        //En caso de que el pageControl sobrepase el total de numero de letras, el valor se mantendra en la cantidad del array(restando 1, porque inicia en 0 el contador) que contiene las letras para evitar ir a una pagina que no exista.
        pageControl = min(pageControl + 1, letter.count - 1)
        goToPage()
    }
        
    @objc private func prevButtonTapped(){
        //Al clickear el boton se actualiza el valor de pageControl para despues ir a esa pagina.
        //En caso de que el pageControl llege a menor que 0 el valor se mantiene en 0 para evitar ir a una pagina que no exista.
        pageControl = max(pageControl - 1, 0)
        goToPage()
    }
            
    
    private func goToPage(){
        //Indicamos que queremos ir a n pagina del collectionView de la section 0
        let indexPath = IndexPath(item: pageControl, section: 0)
        //pasamos el parametro de cual pagina es a la que nos vamos a dirigir, ademas pasamos en que direccion va  a ser el scroll(en este caso horizontal).
        calibrateLetterCellCollectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
        
        
    @objc func doneButtonTapped(){
        dismiss(animated: true, completion: nil)
    }
    
    func checkAnimation(){
                
        let basicAnimation = CABasicAnimation(keyPath: "strokeEnd")
        
        basicAnimation.toValue = 1
        basicAnimation.duration = 0.3
        
        basicAnimation.fillMode = CAMediaTimingFillMode.forwards
        basicAnimation.isRemovedOnCompletion = false
    
        checkShapeLayer.add(basicAnimation, forKey: "urSoBasic")
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            self.checkShapeLayer.removeAllAnimations()
        }
    }
    
}



extension calibrateAlphabetViewController : UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return letter.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! LetterCell
        
        cell.startButton.addTarget(self, action: #selector(startButtonTapped), for: .touchDown)
        cell.tag = indexPath.row
//        print(indexPath.row, indexPath.item)
        cell.letterLabel.text = letter[indexPath.item]
        
        checkShapeLayer.path = cell.checkPath.cgPath
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.bounds.height)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    
    //Funcion que tiene que ver con el desplazamiento del collectionView, que servira para saber el desaplazamiento que se esta haciendo(swiping) y determinar la pagina que corresponde.
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        
        //variable que guarda el punto de hasta donde se desplazo la pantalla
        let x  = targetContentOffset.pointee.x
        
        //En este caso como el ancho de las celulas son igual al tamaño del dispositivo, al dividir nos da el numero de pagina.
        //Ej: tamaño de pantalla del dispositivo = 375, si se desplaza dos celulas el valor de x = 750, la division dara como resultado 2, que es el numero de celula/pagina.
        pageControl = Int(x / view.frame.width)
    }
}
