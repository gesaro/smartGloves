//
//  CalibrationTutorialViewController.swift
//  smartGloves
//
//  Created by Gerardo on 27/05/20.
//  Copyright © 2020 Gerardo. All rights reserved.
//

import UIKit

private let reuseIdentifier = "tutorialCell"

let image = ["tutorialImage0", "tutorialImage1", "tutorialImage2", "tutorialImage3"]


class CalibrationTutorialViewController: UIViewController {
    
        let calibrationTutorialCellCollectionView : UICollectionView = {
            let layout = UICollectionViewFlowLayout()
            layout.scrollDirection = .horizontal
            let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
            view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            view.register(CalibrationTutorialCell.self, forCellWithReuseIdentifier: reuseIdentifier)
            view.isPagingEnabled = true
            return view
        }()
    
     let titleLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Arial", size: 20)
        label.text = "Demostración"
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
    
        
        
    let prevPageButton : UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("ANTERIOR", for: .normal)
        button.titleLabel?.font = UIFont(name: "Avenir", size: 15)
        button.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(prevButtonTapped), for: .touchDown)
        return button
    }()
    
    let pageControl: UIPageControl = {
       let pc = UIPageControl()
        pc.currentPage = 0
        pc.numberOfPages = image.count
        pc.currentPageIndicatorTintColor = UIColor(red: 232/255, green: 68/255, blue: 133/255, alpha: 1)
        pc.pageIndicatorTintColor = .black
        return pc
    }()

    
    let nextPageButton : UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("SIGUIENTE", for: .normal)
        button.titleLabel?.font = UIFont(name: "Avenir", size: 15)
        button.setTitleColor(#colorLiteral(red: 0.9098039216, green: 0.2596280571, blue: 0.3835557644, alpha: 1), for: .normal)
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(nextButtonTapped), for: .touchDown)
        return button
    }()
                  
            
    override func viewDidLoad() {
        super.viewDidLoad()
        
        [titleLabel, doneButton, prevPageButton, pageControl, nextPageButton, calibrationTutorialCellCollectionView].forEach { view.addSubview($0) }
        calibrationTutorialCellCollectionView.delegate = self
        calibrationTutorialCellCollectionView.dataSource = self
        
        setupLayout()
    }

    func setupLayout(){
        
        
        
        titleLabel.anchor(top: view.topAnchor, topConstant: 1, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor)
        titleLabel.anchorSize(width: nil, height: nil, heightConstant: 30) //140
        
        doneButton.anchor(top: view.topAnchor,  leading: nil, bottom: nil, trailing: view.trailingAnchor, trailingConstant: 0)
        doneButton.anchorSize(width: nil, widthConstant: 70, height: nil, heightConstant: 35) //140
                
        prevPageButton.anchor(top: nil, leading: view.leadingAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, bottomConstant: -5 ,trailing: nil)
        prevPageButton.anchorSize(width: nil, widthConstant: view.frame.width * 0.34 , height: nil, heightConstant: 40)
        
        pageControl.anchor(top: nil, leading: prevPageButton.trailingAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, bottomConstant: -5, trailing: nextPageButton.leadingAnchor)
        

        nextPageButton.anchor(top: nil, leading: nil, bottom: view.safeAreaLayoutGuide.bottomAnchor, bottomConstant: -10, trailing: view.trailingAnchor )
        nextPageButton.anchorSize(width: nil, widthConstant: view.frame.width * 0.34, height: nil, heightConstant: 40) //140

        calibrationTutorialCellCollectionView.anchor(top: view.topAnchor, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor)
        
        
        view.sendSubviewToBack(calibrationTutorialCellCollectionView)
    }
        
        
    @objc private func nextButtonTapped(){
        //Al clickear el boton se actualiza el valor de pageControl para despues ir a esa pagina.
        //En caso de que el pageControl sobrepase el total de numero de letras, el valor se mantendra en la cantidad del array(restando 1, porque inicia en 0 el contador) que contiene las letras para evitar ir a una pagina que no exista.
        let nextIndex = min(pageControl.currentPage + 1, image.count - 1)
        let indexPath = IndexPath(item: nextIndex, section: 0)
        pageControl.currentPage = nextIndex
        calibrationTutorialCellCollectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
        
    @objc private func prevButtonTapped(){
        //Al clickear el boton se actualiza el valor de pageControl para despues ir a esa pagina.
        //En caso de que el pageControl llege a menor que 0 el valor se mantiene en 0 para evitar ir a una pagina que no exista.
        let nextIndex = max(pageControl.currentPage - 1, 0)
        let indexPath = IndexPath(item: nextIndex, section: 0)
        pageControl.currentPage = nextIndex
        calibrationTutorialCellCollectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
                    
        
    @objc func doneButtonTapped(){
        dismiss(animated: true, completion: nil)
    }
}

extension CalibrationTutorialViewController : UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return image.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! CalibrationTutorialCell
        
        cell.imageView.image = UIImage(named: image[indexPath.item])
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: view.frame.width, height: collectionView.frame.height)
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
        pageControl.currentPage = Int(x / view.frame.width)
    }
}

