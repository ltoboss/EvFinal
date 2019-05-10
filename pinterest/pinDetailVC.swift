//
//  pinDetailVC.swift
//  pinterest
//
//  Created by Oscar on 4/15/19.
//  Copyright © 2019 Alumno IDS. All rights reserved.
//

import UIKit
import Vision

class pinDetailVC : UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(r: 255, g: 255, b: 255)
        
        //------------- Adding elements --------------
        view.addSubview(scroll)
        scroll.addSubview(pinContainer)
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
        scroll.contentSize.height = newImageHeight + 70
        
        //pinContainer
        pinContainer.topAnchor.constraint( equalTo: scroll.topAnchor, constant: 10 ).isActive = true
        pinContainer.centerXAnchor.constraint(equalTo: scroll.centerXAnchor).isActive = true
        pinContainer.heightAnchor.constraint(equalToConstant: newImageHeight + 50).isActive = true
        pinContainer.widthAnchor.constraint(equalTo: scroll.widthAnchor).isActive = true
        //pinContainer.backgroundColor = .red
        
        //pinImage
        pinImage.topAnchor.constraint(equalTo: pinContainer.topAnchor, constant: 10).isActive = true
        pinImage.centerXAnchor.constraint(equalTo: pinContainer.centerXAnchor).isActive = true
        pinImage.widthAnchor.constraint(equalTo: pinContainer.widthAnchor).isActive = true
        pinImage.heightAnchor.constraint(equalToConstant: newImageHeight).isActive = true
        
        //pinTitle
        pinTitle.topAnchor.constraint(equalTo: pinImage.bottomAnchor, constant: 10).isActive = true
        pinTitle.leftAnchor.constraint(equalTo: pinImage.leftAnchor, constant: 10).isActive = true
        pinTitle.widthAnchor.constraint(equalTo: pinImage.widthAnchor, multiplier: 7/10).isActive = true
        pinTitle.heightAnchor.constraint(equalToConstant: 20).isActive = true
        //pinTitle.backgroundColor = .green
        showDescriptor()
        
    }
    
    //****************** VARIABLES *********************
    lazy var scroll : UIScrollView = {
        let scrollV = UIScrollView()
        scrollV.translatesAutoresizingMaskIntoConstraints = false
        scrollV.contentSize.height = 3000
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
    func showDescriptor(){
        guard let model = try? VNCoreMLModel(for: SqueezeNet().model) else {return}
        let request = VNCoreMLRequest(model: model) { (finishedRequest, error) in
            
            guard let results = finishedRequest.results as? [VNClassificationObservation] else { return }
            guard let Observation = results.first else { return }
            print(Observation.identifier)
            DispatchQueue.main.async(execute: {
                self.pinTitle.text = "\(Observation.identifier)"
            })
        }
        if let cgImage = pinImage.image?.cgImage{
            try? VNImageRequestHandler(cgImage: cgImage , options: [ : ]).perform([request])
        }
    }
    
}
