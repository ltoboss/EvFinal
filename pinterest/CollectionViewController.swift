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
        //print("------- setteando controller ------")
        collectionView?.backgroundColor = .white
        collectionView?.register(pinCell.self, forCellWithReuseIdentifier: cellId )
        
    }
    
    let pines = ["Coche", "Pokemon GO", "Consejos", "Galaxia", "Lego car", "Paisaje", "San Agustin", "Laptop"]
    let imagenes = [#imageLiteral(resourceName: "auto_2"), #imageLiteral(resourceName: "meme_pokemon"), #imageLiteral(resourceName: "consejos fin de semestre 1"), #imageLiteral(resourceName: "Galaxia-Monstruosa"), #imageLiteral(resourceName: "lego_car"), #imageLiteral(resourceName: "paisaje"), #imageLiteral(resourceName: "san-agustin-de-hipona"), #imageLiteral(resourceName: "laptop_acer")]
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pines.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! pinCell
        
        cell.label1.text = pines[indexPath.item]
        let imageToUse : UIImage = imagenes[indexPath.item]
        cell.imageView1.image = imageToUse
        cell.imageView1.translatesAutoresizingMaskIntoConstraints = false
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //print("seleccionaste \(pines[indexPath.item])")
        animateCell(collectionView, indexPath: indexPath)
        changeScreen(indexPath: indexPath)
        
    }
    
    func changeScreen(indexPath: IndexPath){
        let pinDVC = pinDetailVC()
        pinDVC.pinImage.image = imagenes[indexPath.item]
        pinDVC.pinTitle.text = pines[indexPath.item]
        //self.navigationController?.pushViewController(pinDVC, animated: true)
        
    }
    
    func animateCell(_ collectionView: UICollectionView, indexPath : IndexPath){
        let cell = collectionView.cellForItem(at: indexPath) as! pinCell
        cell.backgroundColor = .blue
        let currentCellWidth = cell.frame.size.width
        let currentCellHeight = cell.frame.size.height
        //print("size width:\(cell.frame.size.width)  height:\(cell.frame.size.height)")
        
        let newImageHeight2 = (self.view.frame.size.width * cell.bounds.height) / cell.bounds.width
        //print("++++++newImageHeight = ( \(self.view.frame.size.width) *  \(cell.bounds.height) ) / \(cell.bounds.width) = \(   ((self.view.frame.size.width * cell.bounds.height) / cell.bounds.width)  )")
        var newFrame = cell.frame
        let originalFrame = cell.frame
        let imageOriginalFrame = cell.imageView1.frame
        var newImageFrame = cell.imageView1.frame
        
        
        var zoomTopConstraint = cell.imageView1.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 70)
        var zoomLeftConstraint = cell.imageView1.leftAnchor.constraint(equalTo: self.view.leftAnchor)
        var zoomRightConstraint = cell.imageView1.rightAnchor.constraint(equalTo: self.view.rightAnchor)
        //var zoomHeightConstraint = cell.imageView1.heightAnchor.constraint(equalToConstant: ((self.imagenes[indexPath.item].size.height * self.view.frame.width) / self.imagenes[indexPath.item].size.width) )
        var zoomHeightConstraint = cell.imageView1.heightAnchor.constraint(equalToConstant: 2000 )
        
        newFrame = CGRect(x: 0, y: 10, width: (currentCellWidth * 2), height: (currentCellHeight * 2))
        //cell.frame = newFrame
        UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseOut, animations: {
           // cell.animateCell(duration: 1, delay: 0, newX: (self.view.frame.width/10), newY: (17/3), newWidth: (self.view.frame.width * 0.8), newHeight: 1000)
            
            newImageFrame = CGRect(x: 0, y: 0, width: (self.view.frame.width * 0.8), height: 1000)
            
            //cell.frame = newFrame
            //cell.imageView1.frame = newFrame//newImageFrame
            
            //cell.frame = newFrame
            //cell.imageView1.frame.size.height = cell.updateCellHeight( self.view.frame.size.width, currentHeight: self.imagenes[indexPath.item].size.height, currentWidth: self.imagenes[indexPath.item].size.width)
            //cell.alpha = 0
            zoomTopConstraint.isActive = true
            zoomLeftConstraint.isActive = true
            zoomRightConstraint.isActive = true
            zoomHeightConstraint.isActive = true
            //print()
            self.view.layoutIfNeeded()
            
        }, completion: {finished in
            cell.frame = originalFrame
            cell.imageView1.frame = imageOriginalFrame
            cell.alpha = 1
            cell.backgroundColor = .white
            zoomTopConstraint.isActive = false
            zoomLeftConstraint.isActive = false
            zoomRightConstraint.isActive = false
            zoomHeightConstraint.isActive = false
        })
    }
    
}


extension CollectionViewController: PinterestLayoutDelegate {
    func collectionView(_ collectionView: UICollectionView,
                        heightForPhotoAtIndexPath indexPath:IndexPath) -> CGFloat {
        //print("sacamos height de imagen \(indexPath.item)")
        return imagenes[indexPath.item].size.height
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        widthForPhotoAtIndexPath indexPath:IndexPath) -> CGFloat {
        return imagenes[indexPath.item].size.width
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        currentPhotoWidth indexPath:IndexPath) -> CGFloat {
        return (((view.frame.width / 2) - 16) * 0.8)
        
    }
}
