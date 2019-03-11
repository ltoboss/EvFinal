//
//  ViewController.swift
//  pinterest
//
//  Created by Alumno IDS on 3/7/19.
//  Copyright © 2019 Alumno IDS. All rights reserved.
//

import UIKit
import Firebase

var userL:userLocal?
var signInScreen:Int = 0


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        view.backgroundColor = UIColor(r: 255, g: 255, b: 255)
        //let padding1:CGFloat = 10
        
        let pinterestBackground = #imageLiteral(resourceName: "collageBackground")
        let backgroundView = UIImageView(image: pinterestBackground)
        backgroundView.frame = CGRect(x: 0, y:40, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width * 0.75)
        view.addSubview(backgroundView)
        
        
        
        //add subview
        view.addSubview(buttonContainerView)
        view.addSubview(firstButton)
        
        buttonContainerView.addSubview(emailButton)
        buttonContainerView.addSubview(facebookButton)
        buttonContainerView.addSubview(googleButton)
        let pinterestImage = #imageLiteral(resourceName: "pinterestLogo")
        
        //let imagen:UIImageView = pinterestImage
        
        //let imageName = "yourImage.png"
        //let image = UIImage(named: imageName)
        let imageView = UIImageView(image: pinterestImage)
        imageView.frame = CGRect(x: UIScreen.main.bounds.width * 0.34, y:UIScreen.main.bounds.height * 0.2, width: 130, height: 130)
        imageView.center = CGPoint(x: UIScreen.main.bounds.width * 0.5, y:UIScreen.main.bounds.height * 0.35)
        view.addSubview(imageView)
        
        //imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true        //constraints
        // constraints for input
        
        buttonContainerView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 90).isActive = true
        //buttonContainerView.heightAnchor.constraint(equalTo: view.centerYAnchor, constant: -50).isActive = true
        buttonContainerView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        buttonContainerView.heightAnchor.constraint(equalToConstant: 190).isActive = true
        buttonContainerView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -30).isActive = true
        
        
        firstButton.topAnchor.constraint(equalTo: buttonContainerView.bottomAnchor, constant: 70).isActive = true
        firstButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        firstButton.leftAnchor.constraint(equalTo: buttonContainerView.leftAnchor).isActive = true
        firstButton.rightAnchor.constraint(equalTo: buttonContainerView.rightAnchor).isActive = true
        firstButton.layer.cornerRadius = 10
        
        
        emailButton.topAnchor.constraint(equalTo: buttonContainerView.topAnchor, constant: -10).isActive = true
        emailButton.widthAnchor.constraint(equalTo: buttonContainerView.widthAnchor).isActive = true
        emailButton.heightAnchor.constraint(equalTo: buttonContainerView.heightAnchor, multiplier: 1/3).isActive = true
        emailButton.leftAnchor.constraint(equalTo: buttonContainerView.leftAnchor).isActive = true
        emailButton.rightAnchor.constraint(equalTo: buttonContainerView.rightAnchor).isActive = true
        emailButton.layer.cornerRadius = 10
        
        
        facebookButton.topAnchor.constraint(equalTo: emailButton.bottomAnchor, constant: 10).isActive = true
        facebookButton.widthAnchor.constraint(equalTo: buttonContainerView.widthAnchor).isActive = true
        facebookButton.heightAnchor.constraint(equalTo: buttonContainerView.heightAnchor, multiplier: 1/3).isActive = true
        //facebookButton.setLeftPaddingPoints(padding1)//Padding
        facebookButton.leftAnchor.constraint(equalTo: buttonContainerView.leftAnchor).isActive = true
        facebookButton.rightAnchor.constraint(equalTo: buttonContainerView.rightAnchor).isActive = true
        facebookButton.layer.cornerRadius = 10
        //facebookButton.isHidden = true
        
        
        googleButton.topAnchor.constraint(equalTo: facebookButton.bottomAnchor, constant: 10).isActive = true
        googleButton.widthAnchor.constraint(equalTo: buttonContainerView.widthAnchor).isActive = true
        googleButton.heightAnchor.constraint(equalTo: buttonContainerView.heightAnchor, multiplier: 1/3).isActive = true
        
        googleButton.leftAnchor.constraint(equalTo: buttonContainerView.leftAnchor).isActive = true
        googleButton.rightAnchor.constraint(equalTo: buttonContainerView.rightAnchor).isActive = true
        googleButton.layer.cornerRadius = 10
        
    }
    
    
    //
    let backButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.done, target: nil, action:#selector(handleButton))
    
    
    let buttonContainerView : UIView =  {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.cornerRadius = 5
        view.layer.masksToBounds = true
        return view
    }()
    
    lazy var emailButton : UIButton = {
        let ub = UIButton()
        ub.backgroundColor = UIColor(red: 255/255, green: 20/255, blue: 0/255, alpha: 1)
        ub.setTitle("Continuar con el correo electronico", for: .normal)
        ub.translatesAutoresizingMaskIntoConstraints = false
        //ub.addTarget(self, action: #selector(handleButton), for: .touchUpInside)
        ub.addTarget(self, action: #selector(handleButton), for: .touchUpInside)//Esta linea la metiste TU
        return ub
    }()
    
    lazy var facebookButton : UIButton = {
        let ub = UIButton()
        ub.backgroundColor = UIColor(red: 80/255, green: 101/255, blue: 161/255, alpha: 1)
        ub.setTitle("Continuar con Facebook", for: .normal)
        ub.translatesAutoresizingMaskIntoConstraints = false
        //ub.addTarget(self, action: #selector(handleButton), for: .touchUpInside)
        ub.addTarget(self, action: #selector(handleButton), for: .touchUpInside)//Esta linea la metiste TU
        return ub
    }()
    
    lazy var googleButton : UIButton = {
        let ub = UIButton()
        ub.backgroundColor = UIColor(red: 30/255, green: 101/255, blue: 161/255, alpha: 1)
        ub.setTitle("Continuar con Google", for: .normal)
        ub.translatesAutoresizingMaskIntoConstraints = false
        //ub.addTarget(self, action: #selector(handleButton), for: .touchUpInside)
        ub.addTarget(self, action: #selector(handleButton), for: .touchUpInside)
        //Esta linea la metiste TU
        return ub
    }()
    
    lazy var firstButton : UIButton = {
        let ub = UIButton()
        ub.backgroundColor = UIColor(red: 200/255, green: 200/255, blue: 200/255, alpha: 1)
        ub.setTitleColor(.white, for: .normal)
        ub.setTitle("Iniciar sesion", for: .normal)
        ub.translatesAutoresizingMaskIntoConstraints = false
        //ub.addTarget(self, action: #selector(handleButton), for: .touchUpInside)
        ub.addTarget(self, action: #selector(handleButton), for: .touchUpInside)//Esta linea la metiste TU
        return ub
    }()
    
    //let label1 = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
    
    
    
    @objc func handleButton(_ sender:UIButton){
        
        if sender == firstButton {
            
            signInScreen = 0
            let datosViewC = datosViewController()
            self.navigationController?.pushViewController(datosViewC, animated: true)
        }
        
        
        /*
        guard let email = emailTextField.text, let password = passwordTextField.text, let name = nameTextField.text else {
            print("Not valid")
            return
        }
        
        
        var data:AuthDataResultCallback
        Auth.auth().createUser(withEmail: email, password: password) { (user, error) in
            
            var user2 = user?.user
            if error != nil {
                print("ira esto")
                print(error)
                return
            }
            
            guard let uid = user2?.uid else {
                print("algo salio mal")
                return
            }
            
            //sucessfully
            var ref = Database.database().reference(fromURL: "https://pinterest3-7db31.firebaseio.com/")
            let values = ["name" :name, "email": email]
            let usersRef = ref.child("users").child(uid)
            
            usersRef.updateChildValues(values, withCompletionBlock: { (error, databaseRef:DatabaseReference?) in
                if  error != nil {
                    print("esto salio muy mal")
                    print(error)
                }
            })
            
            
            //Incluir mensaje dummy
            let mensaje = ["mensaje" : "soy un mensaje dummy", "uid" : uid]
            let mensajeRef = ref.child("messages").child(uid)
            mensajeRef.updateChildValues(mensaje)
            
            
            // successfully included
            print("Saved user successfully into our database")
            print("El nombre es: \(self.nameTextField.text)")
            print("El correo es: \(self.emailTextField.text)")
            print("El contrasena es: \(self.passwordTextField.text)")
            
        }*/
    }
    
    //

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


//
extension UIColor {
    
    convenience init(r:CGFloat, g: CGFloat, b: CGFloat) {
        self.init(red: r/255, green: g/255, blue: b/255, alpha: 1)
    }
    
}

extension UITextField {
    func setLeftPaddingPoints(_ amount:CGFloat){
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
    func setRightPaddingPoints(_ amount:CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.rightView = paddingView
        self.rightViewMode = .always
    }
}
