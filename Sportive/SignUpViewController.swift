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

    
    @IBAction func nameAction(_ sender: UITextField) {
        if sender.text!.count <= 2 {
            rongVaildateTextField(textField: sender)
                }else {
            successVaildateTextField(textField: sender)
                                 }
    }
    
    
    
    @IBAction func locationAction(_ sender: UITextField) {
       performSegue(withIdentifier: "goTomap", sender: self)
        
    }
    
    
    @IBAction func mobileAction(_ sender: UITextField) {
        if sender.text!.count <= 10 {
                   rongVaildateTextField(textField: sender)
                   }else {
               successVaildateTextField(textField: sender)
                                 }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goTomap" {
            let vc = segue.destination as! MapKitViewController
            vc.delegate = self
        }
    }
    
   
    
    @IBAction func emailAction(_ sender: UITextField) {
        let emailValid = vaildateEmail(emailStr: sender.text!)
        if emailValid {
            successVaildateTextField(textField: sender)
        }else {
            rongVaildateTextField(textField: sender)
        }
    }
    
    @IBAction func passAction(_ sender: UITextField) {
        if sender.text!.count < 8 {
            rongVaildateTextField(textField: sender)
            }else {
        successVaildateTextField(textField: sender)
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
               if let name = self.nameTF.text,!name.isEmpty , let email = self.emailTF.text,!email.isEmpty ,  let password = self.passwordTF.text,!password.isEmpty , let mobil = self.mobileTF.text,!mobil.isEmpty , let location = self.locationTF.text,!location.isEmpty {
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
    
    
    
    
    func rongVaildateTextField(textField : UITextField)  {
        textField.layer.borderWidth = 4
        textField.layer.borderColor = #colorLiteral(red: 0.5807225108, green: 0.066734083, blue: 0, alpha: 1)
    }
    
    func successVaildateTextField(textField : UITextField)  {
        textField.layer.borderWidth = 4
        textField.layer.borderColor = #colorLiteral(red: 0, green: 0.5628422499, blue: 0.3188166618, alpha: 1)
    }
    
    
    func vaildateEmail(emailStr : String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegex)
        return emailPred.evaluate(with: emailStr)
        
    }
    
    
   
    
}


extension SignUpViewController :  CanReceive {
    func dataReceived(lat: String, long: String) {
        latLocation = lat
        longLocation = long
    }
    
   
    
    
}
