//
//  CollectionViewController.swift
//  pinterest
//
//  Created by Oscar on 4/3/19.
//  Copyright © 2019 Alumno IDS. All rights reserved.
//

import UIKit

//
//  CollectionViewController.swift
//  pinterest
//
//  Created by Oscar on 4/2/19.
//  Copyright © 2019 Alumno IDS. All rights reserved.
//

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
        
        //settear pin
        let pinImage = #imageLiteral(resourceName: "pinterestPin")
        let backgroundView = UIImageView(frame:CGRect(x: 0, y: 0, width: cell.bounds.width, height: cell.bounds.width))
        backgroundView.image = pinImage
        /*let backgroundView = UIImageView(image: pinImage)
         backgroundView.frame = CGRect(x: cell.bounds.size.width, y:0, width: cell.bounds.width, height: cell.bounds.height * 0.8)*/
        cell.contentView.addSubview(backgroundView)
        
        
        
        //settear label
        let nameLabel = UILabel(frame: CGRect(x: cell.bounds.size.width * 0.02, y: cell.bounds.size.height * 0.8, width: cell.bounds.size.width * 0.93, height: cell.bounds.size.height * 0.16))
        nameLabel.text =  pines[indexPath.item] //"celda"
        //nameLabel.textAlignment = .center
        cell.contentView.addSubview(nameLabel)
        
        cell.backgroundColor = .white
        
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (view.frame.width / 2) - 16, height: ((view.frame.width / 2) * 1.2 ) - 16)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
    }
    
    
}



class pinCell : UICollectionViewCell {
    override init (frame: CGRect){
        super.init(frame: frame)
        setup()
    }
    
    func setup(){
        //self.backgroundColor = .gray
        
        //self.addSubview(imagenPin)
      
        //imagenPin.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        //imagenPin.backgroundColor = UIColor.blue
        
        
    }
    /*
    let imagenPin: UIImageView = {
       let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        let pinImage = #imageLiteral(resourceName: "pinterestPin")
        iv.image = pinImage
        iv.backgroundColor = UIColor.red
        return iv
    }()*/
    
    
    required init?(coder aDecoder: NSCoder){
        fatalError("init(coder:) has not been implemented")
    }
}
