//
//  CollectionViewController.swift
//  pinterest
//
//  Created by Oscar on 4/3/19.
//  Copyright © 2019 Alumno IDS. All rights reserved.
//

import UIKit

class CollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    let cellId = "cellId"
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        /*collectionView?.dataSource = self
        collectionView?.delegate = self*/
        
        collectionView?.backgroundColor = .black
        collectionView?.register(pinCell.self, forCellWithReuseIdentifier: cellId )
    }
    
    let pines = ["Coche", "Java", "Casa", "C#", "Laptop", "Escritorio", "Almohada", "PC"]
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pines.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! pinCell
        cell.label1.text = pines[indexPath.item]
        //settear pin
        /*let pinImage = #imageLiteral(resourceName: "pinterestPin")
        let backgroundView = UIImageView(frame:CGRect(x: 0, y: 0, width: cell.bounds.width, height: cell.bounds.width))
        backgroundView.image = pinImage
        cell.contentView.addSubview(backgroundView)*/
        
        /*
        //settear imagen de opciones
        let pinOptionsImage = #imageLiteral(resourceName: "3Puntos")
        let pinOptionsImageView = UIImageView(frame: CGRect(x: cell.bounds.size.width * 0.8, y: cell.bounds.size.height * 0.8, width: cell.bounds.size.width * 0.16, height: cell.bounds.size.height * 0.16))
        pinOptionsImageView.image = pinOptionsImage
        cell.contentView.addSubview(pinOptionsImageView)
        
        //settear label
        let nameLabel = UILabel(frame: CGRect(x: cell.bounds.size.width * 0.02, y: cell.bounds.size.height * 0.8, width: cell.bounds.size.width * 0.93, height: cell.bounds.size.height * 0.16))
        nameLabel.text =  pines[indexPath.item]
        //nameLabel.textAlignment = .center
        cell.contentView.addSubview(nameLabel)*/
        
        //cell.backgroundColor = .white
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (view.frame.width / 2) - 16, height: ((view.frame.width / 2) * 1.2 ) - 16)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
    }
    
    
}
