//
//  SignUpViewController.swift
//  Sportive
//
//  Created by Ali Mohamed on 10/28/19.
//  Copyright © 2019 amirahmed. All rights reserved.
//

import UIKit
import BEMCheckBox
import NVActivityIndicatorView


class SignUpViewController: UIViewController   {
 
    var type : String = ""
    
    var latLocation : String = ""
    var longLocation : String = ""
    
    
    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var mobileTF: UITextField!
    @IBOutlet weak var locationTF: UITextField!
    
    
    @IBOutlet weak var centerCk: BEMCheckBox!
    
    @IBOutlet weak var userCk: BEMCheckBox!
    
    @IBOutlet weak var tarinerCk: BEMCheckBox!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    

        
    }
    
    @IBAction func checkBoxChange(_ sender: BEMCheckBox) {
        let check = sender.tag
           if check == 1 {
               type = "center"
               userCk.on = false
               tarinerCk.on = false

           } else if check == 2 {
               type = "user"
               centerCk.on = false
               tarinerCk.on = false


           } else {
               type = "trainer"
                centerCk.on = false
               userCk.on = false
           }
        
    }

    

    
    
    
    @IBAction func locationAction(_ sender: UITextField) {
       performSegue(withIdentifier: "goTomap", sender: self)
        
    }
    
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goTomap" {
            let vc = segue.destination as! MapKitViewController
            vc.delegate = self
        }
    }
    
   

    @IBAction func signUpButtonPressed(_ sender: UIButton) {
        register()
        
    }
    @IBAction func logInButtonPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
        
    }
    
    
    
    
    func register (){
           DispatchQueue.main.async {
               // Test Login request
            if let name = self.nameTF.text,!name.isEmpty , let email = self.emailTF.text,!email.isEmpty ,  let password = self.passwordTF.text,!password.isEmpty , let mobil = self.mobileTF.text,!mobil.isEmpty ,self.latLocation != "" , self.longLocation != "" {
                APIClient.Register(name: name, email: email, password: password, phone: mobil, type: self.type, long: self.longLocation, lat: self.latLocation, images: "", famous: "", desctiption: "", history: "", img_1: "", img_2: "", img_3: "", img_4: "",completion: { result in
                               switch result {
                               case .success(let response):
                                   DispatchQueue.main.async {
                                       print(response)
                                    self.dismiss(animated: true, completion: nil)
                                       
                                   }
                               case.failure(let error):
                                   print(error.localizedDescription)
                                    Alert.show("Problem", massege: error.localizedDescription  , context: self)
                               }
                           })
               }else{
                Alert.show("Problem", massege: " Text isEmpty ", context: self)
                
    
               }
               
           }
       }
    
    
    

    
}


extension SignUpViewController :  CanReceive {
    func dataReceived(lat: String, long: String) {
        latLocation = lat
        longLocation = long
    }
    
   
    
    
}
