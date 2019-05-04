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
    //var urlsList = [String]()
    
    func testFunc(){
        //print("++++++ ejecutamos testFunc")
    }
    
    var URLSRef : DatabaseReference = Database.database().reference().child("imagesURLS")
    
    
    
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        
        //loadPines()
        
        
        
        
        
        
        //print("++++ Aqui cargamos viewDIdLoad")
        if let layout = collectionView?.collectionViewLayout as? PinterestLayout {
            layout.delegate = self
        }
        //print("------- setteando controller ------")
        collectionView?.backgroundColor = .white
        collectionView?.register(pinCell.self, forCellWithReuseIdentifier: cellId )
        
        
        self.collectionView?.reloadData()
    }
    
    var imageReference : StorageReference {
        return Storage.storage().reference().child("MEMES")
    }
    
    
    
    let pines = ["Coche", "Pokemon GO", "Consejos", "Galaxia", "Lego car", "Paisaje", "San Agustin", "Laptop"]
    let imagenes = [#imageLiteral(resourceName: "auto_2"), #imageLiteral(resourceName: "meme_pokemon"), #imageLiteral(resourceName: "consejos fin de semestre 1"), #imageLiteral(resourceName: "Galaxia-Monstruosa"), #imageLiteral(resourceName: "lego_car"), #imageLiteral(resourceName: "paisaje"), #imageLiteral(resourceName: "san-agustin-de-hipona"), #imageLiteral(resourceName: "laptop_acer")]
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print("++++ Aqui cargamos numberOfItems")
        //print("=========== la cuenta de urlsList es \(urlsList.count)")
        return urlsList.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        //print("++++ Aqui cargamos cellforItemAt")
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! pinCell
        
        cell.label1.text = pines[indexPath.item]
        
        let storageRef = Storage.storage().reference().child("MEMES/\(urlsList[indexPath.item])")
        storageRef.getData(maxSize: 3 * 1024 * 1024) { data, error in
            if let error = error {
                // Uh-oh, an error occurred!
                print("-------- hubo un error al descargar \(indexPath.item). Fue \(error)")
            } else {
                // Data for "images/island.jpg" is returned
                let image = UIImage(data: data!)
                cell.imageView1.image = image as! UIImage
                print("++++++++ la imagen se llama \(urlsList[indexPath.item])")
            }
        }
        
        
        //downloadImage(withURL: urlTest!){ image in imageToUse = image!}
        
        
        var imageToUse : UIImage = imagenes[indexPath.item]
        
        
        
        
        //var storageRef = Storage.storage().reference().child("MEMES/5A70E10D-8500-45C0-8405-31AF2105E644.jpg")
        
        
        
        //imageToUse = downloadImagen()
        
        cell.imageView1.image = imageToUse
        cell.imageView1.translatesAutoresizingMaskIntoConstraints = false
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        //print("++++ Aqui cargamos inserForSectionAt")
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
