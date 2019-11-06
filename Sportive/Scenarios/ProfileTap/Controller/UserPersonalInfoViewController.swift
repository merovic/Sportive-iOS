//
//  UserPersonalInfoViewController.swift
//  Sportive
//
//  Created by Mustafa on 11/4/19.
//  Copyright © 2019 amirahmed. All rights reserved.
//

import UIKit
import NVActivityIndicatorView
import FirebaseStorage
class UserPersonalInfoViewController: UIViewController , NVActivityIndicatorViewable , UINavigationControllerDelegate , UIImagePickerControllerDelegate{

    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var nameTf: UITextField!
    @IBOutlet weak var emailTf: UITextField!
    @IBOutlet weak var passwordTf: UITextField!
    @IBOutlet weak var MobileTf: UITextField!
    
    @IBOutlet weak var editBtn: UIButton!
    let imagePicker = UIImagePickerController()
    var imgNumber = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        updateView()
    }
    
    func updateView(){
        ProfilePic.roundedPic(imageView: profileImage)
        ProfilePic.roundedButton1(button: editBtn)
        if let user = Centers.center {
            
            nameTf.text = user.name
            passwordTf.text = user.password
            MobileTf.text = user.phone
            emailTf.text = user.email
            profileImage.sd_setImage(with: URL(string: user.images), placeholderImage: UIImage(named:"user"))
            
        }
    }
    
    
    
    @IBAction func uploadProfileImg(_ sender: Any) {
        imgNumber = 1
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
        
    }
    
    @IBAction func editBtnPressed(_ sender: UIButton) {
        
        self.startAnimating()
               
               let user = Centers.center
        if let name = nameTf.text , let password = passwordTf.text, let mobile = MobileTf.text {
                   
                   APIClient.editUserOrCenterData(name: name, password: password, phone: mobile, long: user!.lang, lat: user!.lat, images: Centers.image ?? user?.images ?? "", desctiption: user?.des ?? "", id: user!.id) { (Result) in
                       
                       switch Result {
                       case .success( _):
                               DispatchQueue.main.async {
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
    
    
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        let image = info[.originalImage] as! UIImage
        profileImage.image = image
        
        let url = FirebaseUploader.uploadToFirebase(viewController: self, imagePicker: imagePicker, didFinishPickingMediaWithInfo: info, butNumber: imgNumber)
        print(url)
        
    }
}
