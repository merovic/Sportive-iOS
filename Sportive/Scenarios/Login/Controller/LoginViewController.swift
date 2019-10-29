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

        // Do any additional setup after loading the view.
    }
    

    //MARK - IBAction

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
    
   
    func login ()
    {
        
        self.startAnimating()
        
        DispatchQueue.main.async {
            // Test Login request
            
            if let email = self.yourEmailTf.text , let password = self.passwordTF.text {
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
            }
        
        }
    }
}
