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
        
        
        let nameLabel = UILabel(frame: CGRect(x: cell.bounds.size.width * 0.02, y: cell.bounds.size.height * 0.8, width: cell.bounds.size.width * 0.93, height: cell.bounds.size.height * 0.16))
        
        nameLabel.text = "celda"
        //nameLabel.textAlignment = .center
        cell.contentView.addSubview(nameLabel)
        //nameLabel.bottomAnchor(equalTo: cell.bottomAnchor).isActive = true
        
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
        //self.addSubview(nameLabel)
        
        //nameLabel.frame = CGRect(x: 0, y:40, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width * 0.75)
        //nameLabel.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 10, paddingLeft: 10, paddingBottom: 10, paddingRight: 10, width: 0, height:0)
        
    }
    /*let label = UILabel()
     label.text = "nombre"
     //label.textAlignment = .center
     label.textColor = .white
     return label*/
    
    
    
    required init?(coder aDecoder: NSCoder){
        fatalError("init(coder:) has not been implemented")
    }
}
