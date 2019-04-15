//
//  pinDetailVC.swift
//  pinterest
//
//  Created by Oscar on 4/15/19.
//  Copyright © 2019 Alumno IDS. All rights reserved.
//

import UIKit

class pinDetailVC : UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(r: 255, g: 255, b: 255)
        
        //------------- Adding elements --------------
        view.addSubview(pinContainer)
        view.addSubview(pinImage)
        view.addSubview(pinTitle)
        
        
        
        
        //------------- Setting elements ---------------
        //pinContainer.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        pinContainer.topAnchor.constraint( equalTo: view.topAnchor, constant: (view.frame.width * (1/10)) ).isActive = true
        pinContainer.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        //pinContainer.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 9/10).isActive = true
        pinContainer.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 9/10).isActive = true
        
        //pinImage
        //pinImage.image
        pinImage.topAnchor.constraint(equalTo: pinContainer.topAnchor, constant: 10).isActive = true
        pinImage.centerXAnchor.constraint(equalTo: pinContainer.centerXAnchor).isActive = true
        pinImage.widthAnchor.constraint(equalTo: pinContainer.widthAnchor, multiplier: 9/10).isActive = true
        let originalWidth = pinImage.image!.size.width
        let originalHeight = pinImage.image!.size.height
        let newImageWidth = view.frame.width * (9/10) * (9/10)
        let newImageHeight = (newImageWidth * originalHeight) / originalWidth
        pinImage.heightAnchor.constraint(equalToConstant: newImageHeight).isActive = true
        
        //Setting height of container
        pinContainer.heightAnchor.constraint(equalToConstant: newImageHeight + 50).isActive = true
        
        
        //pinTitle
        pinTitle.topAnchor.constraint(equalTo: pinImage.bottomAnchor, constant: 10).isActive = true
        pinTitle.leftAnchor.constraint(equalTo: pinImage.leftAnchor).isActive = true
        pinTitle.widthAnchor.constraint(equalTo: pinImage.widthAnchor, multiplier: 8/10).isActive = true
        pinTitle.heightAnchor.constraint(equalToConstant: 20).isActive = true
        pinTitle.backgroundColor = .green
        
        
        
        
        //general view settings
        pinContainer.backgroundColor = .red
        
    }
    
    //****************** VARIABLES *********************
    let pinContainer : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.cornerRadius = 5
        view.layer.masksToBounds = true
        return view
    }()
    
    let pinImage : UIImageView = {
        let imageV = UIImageView()
        imageV.image = #imageLiteral(resourceName: "pinterestLogo")
        imageV.translatesAutoresizingMaskIntoConstraints = false
        return imageV
    }()
    
    let pinTitle : UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    
}
