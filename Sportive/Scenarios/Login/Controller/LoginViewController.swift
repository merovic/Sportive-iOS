//
//  LoginViewController.swift
//  Sportive
//
//  Created by Mustafa on 10/28/19.
//  Copyright © 2019 amirahmed. All rights reserved.
//

import UIKit
import NVActivityIndicatorView

class LoginViewController: UIViewController,NVActivityIndicatorViewable {
    
    
    var user: LoginResponse!
    //MARK - IBOutlet
    
    @IBOutlet weak var yourEmailTf: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        passwordTF.isSecureTextEntry = true
        // Do any additional setup after loading the view.
    }
    
    //MARK - IBAction

    @IBAction func emailAction(_ sender: UITextField) {
        let emailValid = vaildateEmail(emailStr: sender.text!)
        if emailValid {
            successVaildateTextField(textField: sender)
        }else {
            rongVaildateTextField(textField: sender)
        }
 
    }
    
    @IBAction func passwordAction(_ sender: UITextField) {
        if sender.text!.count < 8 {
                       rongVaildateTextField(textField: sender)
                   }else {
                       successVaildateTextField(textField: sender)
                   }
 
    }
    

    @IBAction func logInButtonPressed(_ sender: UIButton) {
        login ()
    }
    @IBAction func signUpButtonPressed(_ sender: UIButton) {
    }
    @IBAction func forgetPasswordPressed(_ sender: UIButton) {
        
        DispatchQueue.main.async {
            APIClient.getAllCenters { (resulr) in
                switch resulr{
                    case .success(let response):
                            DispatchQueue.main.async {
                             //   user.append(response[0].)
                                print(response)
                            }
                        case .failure(let error):
                            print(error.localizedDescription)

                        }
                    }
            
        }
        
    }
   
    func login (){
        self.startAnimating()
        DispatchQueue.main.async {
            // Test Login request
            if let email = self.yourEmailTf.text,!email.isEmpty , let password = self.passwordTF.text,!password.isEmpty {
                APIClient.loginUser(email:email ,password:password,completion: { result in
                            switch result {
                            case .success(let response):
                                DispatchQueue.main.async {
                                 //   user.append(response[0].)
                                    self.user = response[0]
                                    print(self.user)
                                self.performSegue(withIdentifier: "goToHome", sender: self)
                                    self.stopAnimating()
                                }
                            case .failure(let error):
                                print(error.localizedDescription)
                                self.stopAnimating()
                            }
                        })
            }else{
                
                self.rongVaildateTextField(textField: self.yourEmailTf)
                self.rongVaildateTextField(textField: self.passwordTF)
                self.stopAnimating()
 
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

