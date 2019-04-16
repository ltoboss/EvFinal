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
        view.addSubview(scroll)
        view.addSubview(pinContainer)
        pinContainer.addSubview(pinImage)
        pinContainer.addSubview(pinTitle)
        
        //-------------- Getting basic data --------------
        let originalWidth = pinImage.image!.size.width
        let originalHeight = pinImage.image!.size.height
        let newImageWidth = view.frame.width
        let newImageHeight = (newImageWidth * originalHeight) / originalWidth
        
        //------------- Setting elements ---------------
        //scroll
        scroll.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        scroll.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        scroll.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        scroll.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        scroll.contentSize.height = 10000
        
        //pinContainer
        //pinContainer.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        pinContainer.topAnchor.constraint( equalTo: scroll.topAnchor, constant: 10 + (view.frame.width * (1/10)) ).isActive = true
        pinContainer.centerXAnchor.constraint(equalTo: scroll.centerXAnchor).isActive = true
        pinContainer.heightAnchor.constraint(equalToConstant: newImageHeight + 50).isActive = true
        //pinContainer.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 9/10).isActive = true
        pinContainer.widthAnchor.constraint(equalTo: scroll.widthAnchor).isActive = true
        //pinContainer.backgroundColor = .red
        
        //pinImage
        pinImage.topAnchor.constraint(equalTo: pinContainer.topAnchor, constant: 10).isActive = true
        pinImage.centerXAnchor.constraint(equalTo: pinContainer.centerXAnchor).isActive = true
        pinImage.widthAnchor.constraint(equalTo: pinContainer.widthAnchor).isActive = true
        pinImage.heightAnchor.constraint(equalToConstant: newImageHeight).isActive = true
        
        //pinTitle
        pinTitle.topAnchor.constraint(equalTo: pinImage.bottomAnchor, constant: 10).isActive = true
        pinTitle.leftAnchor.constraint(equalTo: pinImage.leftAnchor).isActive = true
        pinTitle.widthAnchor.constraint(equalTo: pinImage.widthAnchor, multiplier: 8/10).isActive = true
        pinTitle.heightAnchor.constraint(equalToConstant: 20).isActive = true
        //pinTitle.backgroundColor = .green
    }
    
    //****************** VARIABLES *********************
    let scroll : UIScrollView = {
        let scrollV = UIScrollView()
        scrollV.translatesAutoresizingMaskIntoConstraints = false
        scrollV.backgroundColor = .white
        return scrollV
    }()
    
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
