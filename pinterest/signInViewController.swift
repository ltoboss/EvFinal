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
        view.backgroundColor = UIColor(r: 0, g: 0, b: 0)
        //let padding1:CGFloat = 10
        
        labelInstruction.text = "Ingresa tu password"
        labelInstruction.textColor = .white
        
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
        logInButton.layer.cornerRadius = 10
        
    }
    
    //****************** VARIABLES *********************
    let passwordTextField : UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.placeholder = "Password"
        tf.isSecureTextEntry = true
        tf.backgroundColor = .white
        
        tf.text = "usuario55"
        return tf
    }()
    
    lazy var logInButton : UIButton = {
        let ub = UIButton()
        ub.backgroundColor = UIColor(red: 61/255, green: 91/255, blue: 153/255, alpha: 1)
        ub.setTitleColor(.white, for: .normal)
        ub.setTitle("Siguiente", for: .normal)
        ub.translatesAutoresizingMaskIntoConstraints = false
        ub.addTarget(self, action: #selector(handleButton), for: .touchUpInside)
        return ub
    }()
    
    let labelInstruction = UILabel(frame: CGRect(x: 10, y: 70, width: 300, height: 21))
    
    //****************** FUNCIONES *********************
    
    // -------------- Al presionar el boton --------------------
    @objc func handleButton(_ sender:UIButton){
        if passwordTextField.text != "" {
            userL?.password = passwordTextField.text
            activeScreen = screens.Mail //Esta seria mas bien preventiva. Checar si afecta
            
            
            
            
            Auth.auth().signIn(withEmail: userL!.mail!, password: userL!.password!){
                (user, error) in
                if error != nil {
                    print(error)
                    //self.logInButton.setTitle("login no salio", for: .normal)
                    
                } else {
                    print("++++++++ login exitoso")
                    
                    //self.navigationController?.pushViewController(collectionViewC, animated: true)
                    userL?.uid = user!.user.uid
                    print("uid es \(userL?.uid)")
                    
                    
                    
                    
                    let uploadVC = UploadImageVC()
                    //self.navigationController?.pushViewController(uploadVC, animated: true)
                    //self.logInButton.setTitle("ya salio", for: .normal)
                    
                    self.loadPines()
                    
                    /*if self.loadPines() > 0 {
                        let layout = PinterestLayout()
                        let collectionViewC = CollectionViewController(collectionViewLayout: layout)
                        self.navigationController?.pushViewController(collectionViewC, animated: true)
                    }*/
                    
                    
                    
                    
                    
                    
                }
            }
            
        }
    }
    
    
    
    func run(after seconds: Int, completion: @escaping () -> Void){
        let deadline = DispatchTime.now() + .seconds(seconds)
        DispatchQueue.main.asyncAfter(deadline: deadline) {
            completion()
        }
    }
    
    
    
    //================== Cargar datos de BD
    func loadPines() -> Int {
        let URLSRef = Database.database().reference().child("imagesURLS")
        
        //print("++++++probar load aqui")
        URLSRef.observe(DataEventType.value, with: {(snapshot)  in
            if snapshot.childrenCount > 0 {
                //print("aqui ya tenemos el snapshot")
                
                imagenesArray.removeAll()
                urlsList.removeAll()
                messagesArray.removeAll()
                
                for pines in snapshot.children.allObjects as! [DataSnapshot]{
                    let pinObject = pines.value as? [String: AnyObject]
                    var pinName = pinObject?["nombre"] as! String!
                    var pinType = pinObject?["type"] as! String!
                    var currentMessage = pinObject?["message"] as! String!
                    messagesArray.append(currentMessage!)
                    var imageToDownload = pinName! + "." + pinType!
                    //imageToDownload = "A890070B-6C88-4B39-92A9-A84DC26F755D.jpg"
                    urlsList.append(imageToDownload)
                    
                    storageRef = Storage.storage().reference().child("MEMES/\(imageToDownload)")
                    storageRef.getData(maxSize: 3 * 1024 * 1024) { data, error in
                        if let error = error {
                            //print("-------- hubo un error al descargar \(imageToDownload). el error fue \(error)")
                            print("error, sustituyendo imagen")
                            var imagenSustituto = #imageLiteral(resourceName: "laptop_acer")
                            imagenesArray.append(imagenSustituto as! UIImage)
                        } else {
                            // Data for "images/island.jpg" is returned
                            let image = UIImage(data: data!)
                            imagenesArray.append(image as! UIImage)
                        }
                    }
                    print("nueva imagen: \(imageToDownload) cuenta nueva de urlsList \(urlsList.count)")
                }
                
                
                self.run(after: 3){
                    
                    let layout = PinterestLayout()
                    let collectionViewC = CollectionViewController(collectionViewLayout: layout)
                    self.navigationController?.pushViewController(collectionViewC, animated: true)                }
                
            } else {
                self.logInButton.setTitle("algo salio mal", for: .normal)
            }
            
        })
        
        
        
        
        
        return urlsList.count
    }
    
    
    // -------------- Al regresar a la pantalla anterior ---------------
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        if self.isMovingFromParentViewController {
            activeScreen = screens.Mail
        }
    }
    
}


