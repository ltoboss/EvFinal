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
        
        if let layout = collectionView?.collectionViewLayout as? PinterestLayout {
            layout.delegate = self
        }
        
        collectionView?.backgroundColor = .black
        collectionView?.register(pinCell.self, forCellWithReuseIdentifier: cellId )
        
    }
    
    let pines = ["Coche", "Java", "Casa"]//, "C#", "Laptop", "Escritorio", "Almohada", "PC"]
    let imagenes = [#imageLiteral(resourceName: "auto_2"), #imageLiteral(resourceName: "meme_pokemon"), #imageLiteral(resourceName: "consejos fin de semestre 1")]
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pines.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! pinCell
        cell.label1.text = pines[indexPath.item]
        //cell.sizeLabel.text = "abc"
        
        if indexPath.item == 0 {
            let newImage : UIImage = imagenes[0]
            cell.imageView1.image = #imageLiteral(resourceName: "auto_2")
            cell.imageView1.image = newImage
            cell.imageView1.translatesAutoresizingMaskIntoConstraints = false
        }
        
        /*
        let currentItem = indexPath.item
        if indexPath.item > 1 {
            let upperIndexPath = IndexPath(item: currentItem - 2, section: 0)
            cell.topAnchor.constraint(equalTo: (collectionView.cellForItem(at: upperIndexPath)?.bottomAnchor)!).isActive = true
            
        }*/
        
        print("\(indexPath.item) asignar cell")
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        print("\(indexPath.item) size cell")
        //return CGSize(width: (view.frame.width / 2) - 16, height: ((view.frame.width / 2) * 1.2 ) - 16)
        
        
        return setSize(indexPathPosition: indexPath)
    }
    
    
    
    func setSize(indexPathPosition : IndexPath) -> CGSize{
        var cellSize : CGSize = CGSize(width: (view.frame.width / 2) - 16, height: ((view.frame.width / 2) * 1.2 ) - 16)
        //var cellHeight
        
        if indexPathPosition.item == 0 {
            let newImage : UIImage = imagenes[0]
            let assetWidht = newImage.size.width
            let heightMultiplier = newImage.size.height / newImage.size.width
            
            //cellSize = CGSize(width: (view.frame.width / 2) - 16, height: ((view.frame.width / 2) * heightMultiplier) + (view.frame.height * 0.04) + 17)
            cellSize = CGSize(width: (view.frame.width / 2) - 16, height: ( ((view.frame.width / 2) - 16) * heightMultiplier )  )
            //var cellHeight = (((view.frame.width / 2) - 16) * heightMultiplier)
            //print("cell height final \(cellHeight)")
            
        }
        
        
        
        return cellSize
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
    }
    
}


extension CollectionViewController: PinterestLayoutDelegate {
    func collectionView(_ collectionView: UICollectionView,
                        heightForPhotoAtIndexPath indexPath:IndexPath) -> CGFloat {
        
        return imagenes[indexPath.item].size.height
    }
}
