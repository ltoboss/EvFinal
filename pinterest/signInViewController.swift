//
//  signInViewController.swift
//  pinterest
//
//  Created by Alumno IDS on 3/14/19.
//  Copyright © 2019 Alumno IDS. All rights reserved.
//

import Foundation
import UIKit
import Firebase



class singInViewController: UIViewController {
    
    
    
    
    
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        if self.isMovingFromParentViewController {
            switch signInScreen {
            case 1: signInScreen = 0
            case 2: signInScreen = 1
            default: signInScreen = 0
            }
            
        }
    }
}
