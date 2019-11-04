//
//  LoginViewController.swift
//  Sportive
//
//  Created by Mustafa on 10/28/19.
//  Copyright © 2019 amirahmed. All rights reserved.
//

import UIKit
import NVActivityIndicatorView
import SwiftyJSON

class LoginViewController: UIViewController,NVActivityIndicatorViewable {
    
    
    var user: LoginResponse!
    let loginResponses   = LoginResponses()
    //MARK - IBOutlet
    
    @IBOutlet weak var yourEmailTf: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        passwordTF.isSecureTextEntry = true
    }
    
    //MARK - IBAction
    @IBAction func logInButtonPressed(_ sender: UIButton) {
        login ()
    }
    @IBAction func signUpButtonPressed(_ sender: UIButton) {
    }
    @IBAction func forgetPasswordPressed(_ sender: UIButton) {
    }
   

//MARK: - Log In And Get Data From API
    func login (){
        self.startAnimating()
        DispatchQueue.main.async {
            // Test Login request
            if let email = self.yourEmailTf.text,!email.isEmpty , let password = self.passwordTF.text,!password.isEmpty {
                APIClient.loginUser(email: email, password: password , completion: { result in
                switch result {
                    case .success(let response):

                        DispatchQueue.main.async {
                            
                            do {
                                    let json = try JSON(data: Data(response.utf8))
                                self.updateLoginData(json: json)
                                print(json)
                                let type : String = json[0]["type"].string!
                                
                               if type == "user" ||  type == "trainer" {
                                self.performSegue(withIdentifier: "GoToUer", sender: self)
                                } else if type == "center" {
                                    self.performSegue(withIdentifier: "goToHome", sender: self)
                                    self.stopAnimating()
                                }
                            
                            } catch let parseError as NSError {
                                print("JSON Error \(parseError.localizedDescription)")
                            }
                            
                            self.stopAnimating()
                        }
                    case .failure(let error):
                    print(error.localizedDescription)
                    self.stopAnimating()

                    }
                })
                

            }else{
                self.stopAnimating()
            }
            
        }
    }
    
    //Write the updateLoginData method here:
       func updateLoginData(json : JSON)  {
           
        if   json [0] ["type"].string != nil {
            
             loginResponses.id = json [0] ["id"].intValue
             loginResponses.name = json [0] ["name"].stringValue
             loginResponses.email = json [0] ["email"].stringValue
             loginResponses.password = json [0] ["password"].stringValue
             loginResponses.phone = json [0] ["phone"].stringValue
             loginResponses.type = json [0] ["type"].stringValue
             loginResponses.lang = json [0] ["lang"].stringValue
             loginResponses.lat = json [0] ["lat"].stringValue
             loginResponses.images = json [0] ["images"].stringValue
             loginResponses.famous = json [0] ["famous"].stringValue
             loginResponses.Datee = json [0] ["Datee"].stringValue
             loginResponses.des = json [0] ["des"].stringValue
             loginResponses.history = json [0] ["history"].stringValue
             loginResponses.img_1 = json [0] ["img_1"].stringValue
             loginResponses.img_2 = json [0] ["img_2"].stringValue
             loginResponses.img_3 = json [0] ["img_3"].stringValue
             loginResponses.img_4 = json [0] ["img_4"].stringValue
             loginResponses.linked_in = json [0] ["linked_in"].stringValue
             loginResponses.facebook = json [0] ["facebook"].stringValue
             loginResponses.services = json [0] ["services"].stringValue
             loginResponses.website = json [0] ["website"].stringValue
            
             Centers.center = loginResponses
            
           } else {
              
           }
       }
    
   //MARK: - Prepare For Segue and Present it as fullscreen
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
          if segue.identifier == "goToHome" {
              let vc = segue.destination as! CenterTabBar
              vc.modalPresentationStyle = .fullScreen
              
          }
      }
    
}

