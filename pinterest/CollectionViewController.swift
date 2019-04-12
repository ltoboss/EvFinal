//
//  CollectionViewController.swift
//  pinterest
//
//  Created by Oscar on 4/3/19.
//  Copyright © 2019 Alumno IDS. All rights reserved.
//

import UIKit

var currentImageWidthCell : CGFloat = 0
var currentImageHeightCell : CGFloat = 0

class CollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    let cellId = "cellId"
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        if let layout = collectionView?.collectionViewLayout as? PinterestLayout {
            layout.delegate = self
        }
        print("------- setteando controller ------")
        collectionView?.backgroundColor = .black
        collectionView?.register(pinCell.self, forCellWithReuseIdentifier: cellId )
        
    }
    
    let pines = ["Coche", "Pokemon GO", "Consejos", "Galaxia", "Lego car", "Paisaje", "San Agustin", "Laptop"]
    let imagenes = [#imageLiteral(resourceName: "auto_2"), #imageLiteral(resourceName: "meme_pokemon"), #imageLiteral(resourceName: "consejos fin de semestre 1"), #imageLiteral(resourceName: "Galaxia-Monstruosa"), #imageLiteral(resourceName: "lego_car"), #imageLiteral(resourceName: "paisaje"), #imageLiteral(resourceName: "san-agustin-de-hipona"), #imageLiteral(resourceName: "laptop_acer")]
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pines.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! pinCell
        print("------- setteando custom cell ------")
        
        cell.label1.text = pines[indexPath.item]
        let imageToUse : UIImage = imagenes[indexPath.item]
        cell.imageView1.image = imageToUse
        cell.imageView1.translatesAutoresizingMaskIntoConstraints = false
        
        currentImageWidthCell = cell.imageView1.bounds.width
        currentImageHeightCell = cell.imageView1.bounds.height
        
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
            
            var imageHeight : CGFloat = (((view.frame.width / 2) - 16) * heightMultiplier) + (17 * 1.06)
            
            //imageHeight = 500
            
            //cellSize = CGSize(width: (view.frame.width / 2) - 16, height: ((view.frame.width / 2) * heightMultiplier) + (view.frame.height * 0.04) + 17)
            cellSize = CGSize(width: (view.frame.width / 2) - 16, height:imageHeight)
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
        
        print("sacamos height de imagen \(indexPath.item)")
        return imagenes[indexPath.item].size.height
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        widthForPhotoAtIndexPath indexPath:IndexPath) -> CGFloat {
        
        return imagenes[indexPath.item].size.height
    }
    
}
