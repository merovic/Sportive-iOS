//
//  PersonlInfoViewController.swift
//  Sportive
//
//  Created by Mustafa on 10/28/19.
//  Copyright © 2019 amirahmed. All rights reserved.
//

import UIKit
import NVActivityIndicatorView
import SDWebImage
class PersonlInfoViewController: UIViewController , NVActivityIndicatorViewable {
    
    //MARK - IBOutlet

    
    @IBOutlet weak var profileImg: UIImageView!
    @IBOutlet weak var nameTf: UITextField!
    @IBOutlet weak var emailTf: UITextField!
    @IBOutlet weak var passwordTf: UITextField!
    @IBOutlet weak var mobileTf: UITextField!
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var historyLbl: UILabel!
    @IBOutlet var uploadedImages: [UIImageView]!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        update()
        }
    
    
    
    func update(){
        if let user = Centers.center {
            nameTf.text = user.name
            passwordTf.text = user.password
            mobileTf.text = user.phone
            emailTf.text = user.email
            uploadedImages[0].sd_setImage(with: URL(string: user.img_1), placeholderImage: UIImage(named: "user"))
            
            
        }
        
        
        
        
    }

   //MARK - IBAction

    @IBAction func editBtnPressed(_ sender: UIButton) {
    
        self.startAnimating()
        
        let user = Centers.center
        if let name = nameTf.text , let password = passwordTf.text , let mobile = mobileTf.text {
            
            APIClient.editUserOrCenterData(name: name, password: password, phone: mobile, long: user!.lang, lat: user!.lat, images: "", desctiption: user?.des ?? "", id: user!.id) { (Result) in
                
                switch Result {
                    case .success(let response):
                        DispatchQueue.main.async {
                            print(response)
                            self.stopAnimating()
                            Alert.show("Sucess", massege: "Changes Saved Successfuly", context: self)
                        }
                    case .failure(let error):
                        self.stopAnimating()
                        print(error.localizedDescription)
                        Alert.show("Failed", massege: "can not save changes", context: self)
                    }
                }
        }
    }
    
    @IBAction func saveBtnPressed(_ sender: UIButton) {
        
        
    }
    
    @IBAction func addGameBtnPressed(_ sender: UIButton) {
    }
    
    @IBAction func UploadImage(_ sender: UIButton) {
    }
    
    @IBAction func Upload4Images(_ sender: UIButton) {
    }
    
}
