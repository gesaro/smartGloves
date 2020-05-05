//
//  idiomViewController.swift
//  smartGloves
//
//  Created by Gerardo on 22/04/20.
//  Copyright © 2020 Gerardo. All rights reserved.
//

import UIKit

struct customData {
    var countryflagImage : UIImage
    var idiomLabel : String
    var countryNameLabel: String
}

private let reuseIdentifier = "Cell"

class idiomViewController: BaseViewController {
    
    
    let data = [
        customData(countryflagImage: #imageLiteral(resourceName: "Mexico"), idiomLabel : "Español", countryNameLabel: "México"),
        customData(countryflagImage: #imageLiteral(resourceName: "EU.png"), idiomLabel : "Ingles", countryNameLabel: "Estados unidos"),
        customData(countryflagImage: #imageLiteral(resourceName: "Brasil.png"), idiomLabel : "Portugues", countryNameLabel: "Brasil"),
        customData(countryflagImage: #imageLiteral(resourceName: "China.png"), idiomLabel : "Mandarin", countryNameLabel: "China"),
        customData(countryflagImage: #imageLiteral(resourceName: "Rusia"), idiomLabel : "Ruso", countryNameLabel: "Rusia"),
        customData(countryflagImage: #imageLiteral(resourceName: "Rusia"), idiomLabel : "Ruso", countryNameLabel: "Rusia"),
//        customData(countryflagImage: UIImage(systemName: "link") ??  #imageLiteral(resourceName: "Rusia"), idiomLabel : "Ruso", countryNameLabel: "Rusia")
    ]
    
    let topConteinerView = UIView()
    
    let backgroundContainerImageView : UIImageView = {
      let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "back3")
        return imageView
    }()
    
    let titleLabel : UILabel = {
        let label = SGTitleLabel()
        label.text = "Idioma"
        return label
    }()
    
    let cell : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        view.register(IdiomCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        return view
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        //Se agregan las vistas creadas anteriormente a la vista principal
        view.addSubview(topConteinerView)
        topConteinerView.addSubview(backgroundContainerImageView)
        topConteinerView.addSubview(titleLabel)
        
        view.addSubview(cell)
        cell.delegate = self
        cell.dataSource = self

        setupLayout()

    }
    
    
    func setupLayout(){
        
        //Restricciones del topContentView
        topConteinerView.anchor(top: view.topAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor)
        topConteinerView.anchorSize(width: nil, height: view.heightAnchor, heightMultiplier: 0.32)

        //Restricciones del backgroundImageView dentro del topConteinerView
        backgroundContainerImageView.fillView(to: topConteinerView)

        //Restricciones del titleLabel dentro del topConteinerView
        titleLabel.anchor(top: nil, leading: topConteinerView.leadingAnchor, leadingConstant: 12, bottom: nil, trailing: topConteinerView.trailingAnchor, trailingConstant: -12)
        titleLabel.anchorCenter(centerX: nil, centerY: topConteinerView.centerYAnchor)
        titleLabel.anchorSize(width: nil, height: nil, heightConstant: 50)

        //Restricciones de la celula
        cell.anchor(top: topConteinerView.bottomAnchor, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor)
        
        view.sendSubviewToBack(backgroundContainerImageView)
    }

}

extension idiomViewController : UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! IdiomCell
//        cell.idiomLabel.text = idioma[indexPath.item]
        let idiom = data[indexPath.item]
        
        cell.countryFlagImageView.image = idiom.countryflagImage
        cell.idiomLabel.text = idiom.idiomLabel
        cell.countryLabel.text = idiom.countryNameLabel
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width - 30, height: view.frame.width * 0.22)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: view.frame.height * 0.06, left: 0, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) as? IdiomCell {
            cell.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.09581014555)

            cell.animationPulsate2(view: cell, scaleX: 0.97, y: 0.97, duration: 1.0, springWithDamping: 0.2, springVelocity: 6)

        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) as? IdiomCell {
            cell.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        }
    }
    
}

