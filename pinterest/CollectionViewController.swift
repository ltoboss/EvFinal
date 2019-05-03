//
//  CollectionViewController.swift
//  pinterest
//
//  Created by Oscar on 4/3/19.
//  Copyright © 2019 Alumno IDS. All rights reserved.
//

import UIKit
import Firebase

class CollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    let cellId = "cellId"
    
    var imagensCells = [pinCell]()
    var urlsList = [String]()
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        if let layout = collectionView?.collectionViewLayout as? PinterestLayout {
            layout.delegate = self
        }
        //print("------- setteando controller ------")
        collectionView?.backgroundColor = .white
        collectionView?.register(pinCell.self, forCellWithReuseIdentifier: cellId )
        
        
        /*
        Database.database().reference().child("imagesURLS").observe(.childAdded)
        { (snapshot) in
            let newPinCell = pinCell()
            newPinCell.setSnapValues(snapshot: snapshot)
            newPinCell.backgroundColor = .red
            self.imagensCells.append(newPinCell)
            print(snapshot.value)
            DispatchQueue.main.async {
                self.collectionView?.reloadData()
            }
            
            
        }*/
        
        let URLSRef = Database.database().reference().child("imagesURLS")
        URLSRef.observe(DataEventType.value, with: {(snapshot)  in
            if snapshot.childrenCount > 0 {
                //self.imagensCells.removeAll()
                self.urlsList.removeAll()
                
                for pines in snapshot.children.allObjects as! [DataSnapshot]{
                    let pinObject = pines.value as? [String: AnyObject]
                    let pinName = pinObject?["nombre"] as! String!
                    let pinType = pinObject?["type"] as! String!
                    //let pinURL = pinObject?["url"]
                    let imageToDownload = pinName! + "." + pinType!
                    self.urlsList.append(imageToDownload)
                    print("nueva imagen: \(imageToDownload)")
                }
                
            }
            
        })
        
        
        
        
        
    }
    
    var imageReference : StorageReference {
        return Storage.storage().reference().child("MEMES")
    }
    
    
    
    let pines = ["Coche", "Pokemon GO", "Consejos", "Galaxia", "Lego car", "Paisaje", "San Agustin", "Laptop"]
    let imagenes = [#imageLiteral(resourceName: "auto_2"), #imageLiteral(resourceName: "meme_pokemon"), #imageLiteral(resourceName: "consejos fin de semestre 1"), #imageLiteral(resourceName: "Galaxia-Monstruosa"), #imageLiteral(resourceName: "lego_car"), #imageLiteral(resourceName: "paisaje"), #imageLiteral(resourceName: "san-agustin-de-hipona"), #imageLiteral(resourceName: "laptop_acer")]
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pines.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! pinCell
        
        cell.label1.text = pines[indexPath.item]
        
        
        
        
        //downloadImage(withURL: urlTest!){ image in imageToUse = image!}
        
        
        var imageToUse : UIImage = imagenes[indexPath.item]
        
        //imageToUse = downloadImagen()
        
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
        //changeScreen(indexPath: indexPath)
        
        
    }
    
    func changeScreen(indexPath: IndexPath){
        var animateTransition : Bool = true
        
        let transition = CATransition()
        transition.duration = 0.2
        transition.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        transition.type = kCATransitionFade
        //transition.subtype = kCATransition
        self.navigationController!.view.layer.add(transition, forKey: nil)
        
        let pinDVC = pinDetailVC()
        pinDVC.pinImage.image = imagenes[indexPath.item]
        pinDVC.pinTitle.text = pines[indexPath.item]
        animateTransition = false
        self.navigationController?.pushViewController(pinDVC, animated: animateTransition)
        //self.present(pinDVC, animated: true, completion: nil)
    }
    
    func animateCell(_ collectionView: UICollectionView, indexPath : IndexPath){
        let cell = collectionView.cellForItem(at: indexPath) as! pinCell
        collectionView.bringSubview(toFront: cell)
        //cell.bringSubview(toFront: cell.imageView1)
        var zoomTopConstraint = cell.imageView1.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 85)
        var zoomLeftConstraint = cell.imageView1.leftAnchor.constraint(equalTo: self.view.leftAnchor)
        var zoomRightConstraint = cell.imageView1.rightAnchor.constraint(equalTo: self.view.rightAnchor)
        var zoomHeightConstraint = cell.imageView1.heightAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: (self.imagenes[indexPath.item].size.height / self.imagenes[indexPath.item].size.width) )
        
        
        UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseOut, animations: {
           
            //cell.alpha = 0
            
            zoomTopConstraint.isActive = true
            zoomLeftConstraint.isActive = true
            zoomRightConstraint.isActive = true
            zoomHeightConstraint.isActive = true
            self.view.layoutIfNeeded()
            
        }, completion: {finished in
            //cell.imageView1.frame = imageOriginalFrame
            cell.alpha = 1
            cell.backgroundColor = .white
            zoomTopConstraint.isActive = false
            zoomLeftConstraint.isActive = false
            zoomRightConstraint.isActive = false
            zoomHeightConstraint.isActive = false
            self.changeScreen(indexPath: indexPath)
            
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
