//
//  signInViewController.swift
//  pinterest
//
//  Created by Alumno IDS on 3/14/19.
//  Copyright © 2019 Alumno IDS. All rights reserved.
//

import UIKit
import Firebase

class singInViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Inicia sesion"
        view.backgroundColor = UIColor(r: 255, g: 255, b: 255)
        //let padding1:CGFloat = 10
        
        labelInstruction.text = "Ingresa tu password"
        
        //add subview
        self.view.addSubview(labelInstruction)
        view.addSubview(passwordTextField)
        view.addSubview(logInButton)
        
        //constraints
        // constraints for input
        passwordTextField.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -220).isActive = true
        passwordTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        passwordTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        passwordTextField.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -30).isActive = true
        //passwordTextField.setLeftPaddingPoints(padding1)//Padding
        
        logInButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 210).isActive = true
        logInButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        logInButton.leftAnchor.constraint(equalTo: passwordTextField.leftAnchor).isActive = true
        logInButton.rightAnchor.constraint(equalTo: passwordTextField.rightAnchor).isActive = true
        //logInButton.layer.cornerRadius = 10
    }
    
    //****************** VARIABLES *********************
    let passwordTextField : UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.placeholder = "Password"
        tf.isSecureTextEntry = true
        tf.backgroundColor = .white
        return tf
    }()
    
    lazy var logInButton : UIButton = {
        let ub = UIButton()
        ub.backgroundColor = UIColor(red: 219/255, green: 50/255, blue: 54/255, alpha: 1)
        ub.setTitleColor(.white, for: .normal)
        ub.setTitle("Siguiente", for: .normal)
        ub.translatesAutoresizingMaskIntoConstraints = false
        //ub.addTarget(self, action: #selector(handleButton), for: .touchUpInside)
        ub.addTarget(self, action: #selector(handleButton), for: .touchUpInside)//Esta linea la metiste TU
        return ub
    }()
    
    let labelInstruction = UILabel(frame: CGRect(x: 10, y: 70, width: 300, height: 21))
    
    
    
    
    //****************** FUNCIONES *********************
    
    // -------------- Al presionar el boton --------------------
    @objc func handleButton(_ sender:UIButton){
        if passwordTextField.text != "" {
            userL?.password = passwordTextField.text
            signInScreen = 0
            let datosViewC = datosViewController()
            self.navigationController?.pushViewController(datosViewC, animated: true)
        }
    }
    
    
    // -------------- Al regresar a la pantallas anterior ---------------
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        if self.isMovingFromParentViewController {
            signInScreen = 0
            /*switch signInScreen {
            case 1: signInScreen = 0
            case 2: signInScreen = 1
            default: signInScreen = 0
            }*/
        }
    }
    
    
    
    
}
