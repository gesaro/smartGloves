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
//        customData(countryflagImage: UIImage(systemName: "link") ??  #imageLiteral(resourceName: "Rusia"), idiomLabel : "Ruso", countryNameLabel: "Rusia")
    ]
    
    let topConteinerView : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let backgroundContainerImageView : UIImageView = {
      let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = #imageLiteral(resourceName: "back3")

        return imageView
    }()
    
    let titleLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Idioma"
        label.font = UIFont(name: "Arial Rounded MT Bold", size: 37)
        label.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        label.textAlignment = .center
        return label
    }()
    
    let cell : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.register(IdiomCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        return view
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Se agregan las vistas creadas anteriormente a la vista principal
        view.addSubview(topConteinerView)
        topConteinerView.addSubview(backgroundContainerImageView)
        backgroundContainerImageView.pin(to: view)
        topConteinerView.addSubview(titleLabel)
        
        view.addSubview(cell)
        cell.delegate = self
        cell.dataSource = self

        setupLayout()


    }
    
    
    func setupLayout(){
        NSLayoutConstraint.activate([
            //Restricciones del topContentView
            topConteinerView.topAnchor.constraint(equalTo: view.topAnchor),
            topConteinerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            topConteinerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            topConteinerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.32),
            
//            //Restricciones del backgroundImageView dentro del topConteinerView
//            backgroundContainerImageView.topAnchor.constraint(equalTo: topConteinerView.topAnchor),
//            backgroundContainerImageView.leadingAnchor.constraint(equalTo: topConteinerView.leadingAnchor),
//            backgroundContainerImageView.trailingAnchor.constraint(equalTo: topConteinerView.trailingAnchor),
//            backgroundContainerImageView.bottomAnchor.constraint(equalTo: topConteinerView.bottomAnchor),
            
            //Restricciones del titleLabel dentro del topConteinerView
            titleLabel.centerYAnchor.constraint(equalTo: topConteinerView.centerYAnchor),
            titleLabel.leftAnchor.constraint(equalTo: topConteinerView.leftAnchor, constant: 12),
            titleLabel.rightAnchor.constraint(equalTo: topConteinerView.rightAnchor, constant: -12),
            titleLabel.heightAnchor.constraint(equalToConstant: 50),
            
            cell.topAnchor.constraint(equalTo: topConteinerView.bottomAnchor),
            cell.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            cell.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            cell.trailingAnchor.constraint(equalTo: view.trailingAnchor)

        ])
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
//        print(indexPath.item)
//        cell.backgroundColor = .purple
//        cell.backgroundColor = .red
//        cell.selectItem(at: indexPath.item, animated: true, scrollPosition: .bottom)
        
        cell.backgroundColor = .white
        
        if let cell = collectionView.cellForItem(at: indexPath) as? IdiomCell {
            cell.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.09581014555)
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) as? IdiomCell {
            cell.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        }
    }
    
}

