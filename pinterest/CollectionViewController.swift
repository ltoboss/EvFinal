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
        
        collectionView?.backgroundColor = .white
        collectionView?.register(pinCell.self, forCellWithReuseIdentifier: cellId )
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! pinCell
        
        //settear label
        let nameLabel = UILabel(frame: CGRect(x: cell.bounds.size.width * 0.02, y: cell.bounds.size.height * 0.8, width: cell.bounds.size.width * 0.93, height: cell.bounds.size.height * 0.16))
        nameLabel.text = "celda"
        //nameLabel.textAlignment = .center
        cell.contentView.addSubview(nameLabel)
        
        //settear pin
        /*let pinImage = #imageLiteral(resourceName: "pinterestPin")
        let backgroundView = UIImageView(frame:CGRect(x: cell.bounds.size.width, y:0, width: cell.bounds.width, height: cell.bounds.height * 0.8))
        backgroundView.image = pinImage*/
        /*let backgroundView = UIImageView(image: pinImage)
        backgroundView.frame = CGRect(x: cell.bounds.size.width, y:0, width: cell.bounds.width, height: cell.bounds.height * 0.8)*/
        //cell.contentView.addSubview(backgroundView)
        
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (view.frame.width / 2) - 16, height: 100)
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
        self.backgroundColor = .gray
        
        self.addSubview(imagenPin)
      
        imagenPin.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        imagenPin.backgroundColor = UIColor.blue
        
        
    }
    /*let label = UILabel()
     label.text = "nombre"
     //label.textAlignment = .center
     label.textColor = .white
     return label*/
    let imagenPin: UIImageView = {
       let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        let pinImage = #imageLiteral(resourceName: "pinterestPin")
        iv.image = pinImage
        iv.backgroundColor = UIColor.red
        return iv
    }()
    
    
    required init?(coder aDecoder: NSCoder){
        fatalError("init(coder:) has not been implemented")
    }
}
