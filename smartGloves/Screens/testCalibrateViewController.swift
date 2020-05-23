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


class testCalibrateViewController: UIViewController {
    
    let calibrateLetterCellCollectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.backgroundColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
        view.register(LetterCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        view.isPagingEnabled = true
        return view
    }()
    
    
    let prevLetterButton : UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("ANTERIOR", for: .normal)
        button.titleLabel?.font = UIFont(name: "Avenir", size: 14)
        button.setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        button.backgroundColor = .blue
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(handlePrev), for: .touchDown)
        return button
    }()

    
    let nextLetterButton : UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("SIGUIENTE", for: .normal)
        button.titleLabel?.font = UIFont(name: "Avenir", size: 14)
        button.setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        button.layer.cornerRadius = 10
        button.backgroundColor = .blue
        button.addTarget(self, action: #selector(handleNext), for: .touchDown)
        return button
    }()
        
    private func goToPage(){
        //Indicamos que queremos ir a n pagina del collectionView de la section 0
        let indexPath = IndexPath(item: pageControl, section: 0)
        //pasamos el parametro de cual pagina es a la que nos vamos a dirigir, ademas pasamos en que direccion va  a ser el scroll(en este caso horizontal).
        calibrateLetterCellCollectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(prevLetterButton)
        view.addSubview(nextLetterButton)

        view.addSubview(calibrateLetterCellCollectionView)
        calibrateLetterCellCollectionView.delegate = self
        calibrateLetterCellCollectionView.dataSource = self

        setupLayout()
    }


    func setupLayout(){


        prevLetterButton.anchor(top: nil, leading: view.leadingAnchor, leadingConstant: 20 , bottom: view.safeAreaLayoutGuide.bottomAnchor, trailing: nil)
        prevLetterButton.anchorSize(width: nil, widthConstant: view.frame.width * 0.34 , height: nil, heightConstant: 40)
        

        nextLetterButton.anchor(top: nil, leading: nil, bottom: view.safeAreaLayoutGuide.bottomAnchor, trailing: view.trailingAnchor )
        nextLetterButton.anchorSize(width: nil, widthConstant: view.frame.width * 0.34, height: nil, heightConstant: 40) //140

        calibrateLetterCellCollectionView.anchor(top: view.topAnchor, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor)
        
        view.sendSubviewToBack(calibrateLetterCellCollectionView)
    }
    
    
    @objc private func handleNext(){
        //Al clickear el boton se actualiza el valor de pageControl para despues ir a esa pagina.
        //En caso de que el pageControl sobrepase el total de numero de letras, el valor se mantendra en la cantidad del array(restando 1, porque inicia en 0 el contador) que contiene las letras para evitar ir a una pagina que no exista.
        pageControl = min(pageControl + 1, letter.count - 1)
        goToPage()
    }
        
    @objc private func handlePrev(){
//        //Al clickear el boton se actualiza el valor de pageControl para despues ir a esa pagina.
//        //En caso de que el pageControl llege a menor que 0 el valor se mantiene en 0 para evitar ir a una pagina que no exista.
//        pageControl = max(pageControl - 1, 0)
//        goToPage()
                
        print(stateToRecvData)
    }
    
    @objc func startButtonTapped(){
        stateToRecvData = .inactive
                
        //stop scanning after 3 seconds
        DispatchQueue.main.asyncAfter(deadline: .now() + 6.0) {
            stateToRecvData = .active
        }
    }
    @objc func doneButtonTapped(){
//        print("done")
        print(alphabetCalibrationData)
        
//        alphabetCalibrationData.forEach { print($0.target) }
        
    }
    
}

extension testCalibrateViewController : UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return letter.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! LetterCell
        
        cell.backgroundColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
        cell.doneButton.addTarget(self, action: #selector(doneButtonTapped), for: .touchDown)
        cell.startButton.addTarget(self, action: #selector(startButtonTapped), for: .touchDown)
        cell.tag = indexPath.row
//        print(indexPath.row, indexPath.item)
        cell.letterLabel.text = letter[indexPath.item]
                
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
