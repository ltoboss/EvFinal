//
//  testDownloadImage.swift
//  pinterest
//
//  Created by Oscar on 5/3/19.
//  Copyright © 2019 Alumno IDS. All rights reserved.
//

import Foundation
import UIKit
import Firebase



class testDownloadImage: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(r: 255, g: 255, b: 255)
        
        let storageRef = Storage.storage().reference().child("MEMES/5A70E10D-8500-45C0-8405-31AF2105E644.jpg")
        
        
        
        
        let pinterestBackground = #imageLiteral(resourceName: "collageBackground")
        let backgroundView = UIImageView()
        backgroundView.frame = CGRect(x: 0, y:40, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width * 0.75)
        print("-------------------prmero")
        
        // Download in memory with a maximum allowed size of 1MB (1 * 1024 * 1024 bytes)
        storageRef.getData(maxSize: 1 * 1024 * 1024) { data, error in
            if let error = error {
                // Uh-oh, an error occurred!
                print("hubo un error al descargar. Fue \(error)")
            } else {
                // Data for "images/island.jpg" is returned
                let image = UIImage(data: data!)
                backgroundView.image = image as! UIImage
                print("la imagen se llama \(image?.size)")
                print("-----------------en teoria todo bien")
            }
        }
        print("llego aqui")
        view.addSubview(backgroundView)
        backgroundView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        backgroundView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        backgroundView.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
        backgroundView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        
    }
    
    
    
}
