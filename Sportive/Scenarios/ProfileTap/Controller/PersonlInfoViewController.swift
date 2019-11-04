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
import FirebaseStorage

class PersonlInfoViewController: UIViewController , NVActivityIndicatorViewable , UINavigationControllerDelegate{
    
    //MARK - IBOutlet

    
    @IBOutlet weak var profileImg: UIImageView!
    @IBOutlet weak var nameTf: UITextField!
    @IBOutlet weak var emailTf: UITextField!
    @IBOutlet weak var passwordTf: UITextField!
    @IBOutlet weak var mobileTf: UITextField!
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var historyLbl: UILabel!
    @IBOutlet var uploadedImages: [UIImageView]!
    
    var profileImageUrl: String?
    var imagesUrl = [URL]()
    let imagePicker = UIImagePickerController()
    var imagePickedNumber = 0
    var image1: String?
    var image2: String?
    var image3: String?
    var image4: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagePicker.delegate = self
        update()
        
        }
    
    
    
    func update(){
        if let user = Centers.center {
            nameTf.text = user.name
            passwordTf.text = user.password
            mobileTf.text = user.phone
            emailTf.text = user.email
            profileImg.sd_setImage(with: URL(string: user.images), placeholderImage: UIImage(named: "user"))
            uploadedImages[0].sd_setImage(with: URL(string: user.img_1), placeholderImage: UIImage(named: "user"))
            uploadedImages[1].sd_setImage(with: URL(string: user.img_2), placeholderImage: UIImage(named: "user"))
            uploadedImages[2].sd_setImage(with: URL(string: user.img_3), placeholderImage: UIImage(named: "user"))
            uploadedImages[3].sd_setImage(with: URL(string: user.img_4), placeholderImage: UIImage(named: "user"))
            
        }
        
        
        
        
    }

   //MARK - IBAction

    @IBAction func editBtnPressed(_ sender: UIButton) {
    
        self.startAnimating()
        
        let user = Centers.center
        if let name = nameTf.text , let password = passwordTf.text , let mobile = mobileTf.text {
            
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
    
    @IBAction func saveBtnPressed(_ sender: UIButton) {
        if let user = Centers.center {
            APIClient.updateCenter(desctiption: descriptionLbl.text ?? user.des , history: historyLbl.text ?? user.history, img_1: Centers.img1 ?? user.img_1, img_2: image2 ?? user.img_2, img_3: image3 ?? user.img_3, img_4: image4 ?? user.img_4, id: user.id) { (Result) in
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
    
    @IBAction func addGameBtnPressed(_ sender: UIButton) {
    }
    
    @IBAction func UploadImage(_ sender: UIButton) {
        imagePickedNumber = 1
        imagePicker.sourceType = .photoLibrary
       present(imagePicker, animated: true, completion: nil)
        
    }
    
    @IBAction func Upload4Images(_ sender: UIButton) {
        imagePickedNumber = 2
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
    }
    
}
extension PersonlInfoViewController: UIImagePickerControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[.originalImage] as! UIImage
        
        if imagePickedNumber == 1 {
           profileImg.image = image
            profileImageUrl = FirebaseUploader.uploadToFirebase(viewController: self, imagePicker: imagePicker, didFinishPickingMediaWithInfo: info, butNumber: imagePickedNumber)
        } else if imagePickedNumber == 2 {
            uploadedImages[0].image = image
            image1 = FirebaseUploader.uploadToFirebase(viewController: self, imagePicker: imagePicker, didFinishPickingMediaWithInfo: info, butNumber: imagePickedNumber)
            
            image1 = Centers.image
        }
        
    }
    
}
