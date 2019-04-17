//
//  pinCell.swift
//  pinterest
//
//  Created by Alumno IDS on 4/4/19.
//  Copyright © 2019 Alumno IDS. All rights reserved.
//

import UIKit


class pinCell : UICollectionViewCell {
    override init (frame: CGRect){
        super.init(frame: frame)
        setup()
    }
    
    func setup(){
        //Set image
        self.addSubview(imageView1)
        self.addSubview(label1)
        
        imageView1.topAnchor.constraint(equalTo: self.topAnchor, constant: (17 * (1/3) )).isActive = true
        imageView1.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        imageView1.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 8/10).isActive = true
        //imageView1.leftAnchor.constraint(equalTo: self.leftAnchor, constant: (self.frame.width / 10)).isActive = true
        //imageView1.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -(self.frame.width / 10)).isActive = true
        imageView1.heightAnchor.constraint(equalToConstant: self.bounds.height - 34).isActive = true
        //imageView1.bottomAnchor.constraint(equalTo: label1.bottomAnchor, constant: -(17/3))
        //imageView1.heightAnchor.constraint(equalToConstant: 500)
        
        //Set label
        
        label1.topAnchor.constraint(equalTo: imageView1.bottomAnchor, constant: (17 / 3 )).isActive = true
        label1.leftAnchor.constraint(equalTo: imageView1.leftAnchor).isActive = true
        label1.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 80/100).isActive = true
        label1.heightAnchor.constraint(equalToConstant: 17).isActive = true
        //label1.backgroundColor = .red //Coloracion de prueba
        
        //Set image de puntitos
        self.addSubview(imageViewOptions)
        imageViewOptions.centerYAnchor.constraint(equalTo: label1.centerYAnchor).isActive = true
        imageViewOptions.rightAnchor.constraint(equalTo: imageView1.rightAnchor).isActive = true
        imageViewOptions.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 7/100).isActive = true
        imageViewOptions.heightAnchor.constraint(equalTo: self.widthAnchor, multiplier: 7/100).isActive = true
        
        //Propieades de celda en general
        self.backgroundColor = .white
        //self.backgroundColor = .orange
        
    }
    
    func updateCellHeight(_ newWidth: CGFloat, currentHeight: CGFloat, currentWidth: CGFloat) -> CGFloat{
        var newHeight : CGFloat = (newWidth * currentHeight) / currentWidth
        newHeight = 2000
        return newHeight
    }
    
    func animateCell(duration: CGFloat, delay: CGFloat, newX: CGFloat, newY: CGFloat, newWidth: CGFloat, newHeight: CGFloat){
        
        UIView.animate(withDuration: TimeInterval(duration), delay: TimeInterval(delay), options: .curveEaseOut, animations: {
            let newFrame = CGRect(x: newX, y: newY, width: newWidth, height: newHeight)
            self.imageView1.frame = newFrame
            //let newPoint = CGPoint(x: (self.view.frame.width/10), y: (17 / 3))
            //newImageFrame = CGRect(x: (self.view.frame.width/10), y: (17 / 3), width: (self.view.frame.width * 0.8), height: 1000)  //CGRect(origin: newPoint, size: )
            //cell.frame = newFrame
            
            //cell.imageView1.frame.size.height = cell.updateCellHeight( self.view.frame.size.width, currentHeight: self.imagenes[indexPath.item].size.height, currentWidth: self.imagenes[indexPath.item].size.width)
            //cell.alpha = 0
            
            
        }, completion: {finished in
            //cell.frame = originalFrame
            //cell.alpha = 1
        })
    }
    
    
    //Imagen
    let imageView1 : UIImageView = {
        let imageView2 = UIImageView()
        imageView2.image = #imageLiteral(resourceName: "pinterestPin")
        imageView2.translatesAutoresizingMaskIntoConstraints = false
        return imageView2
    }()
    
    //Label
    let label1 : UILabel = {
        let label2 = UILabel()
        label2.textColor = .black
        label2.translatesAutoresizingMaskIntoConstraints = false
        return label2
    }()
    
    //Imagen de puntitos
    let imageViewOptions : UIImageView = {
        let imageView3 = UIImageView()
        imageView3.image = #imageLiteral(resourceName: "3Puntos")
        imageView3.translatesAutoresizingMaskIntoConstraints = false
        return imageView3
    }()
    
    required init?(coder aDecoder: NSCoder){
        fatalError("init(coder:) has not been implemented")
    }
}
