//
//  TrainerPersonalInfoViewController.swift
//  Sportive
//
//  Created by Mustafa on 11/4/19.
//  Copyright © 2019 amirahmed. All rights reserved.
//

import UIKit
import NVActivityIndicatorView
import SDWebImage
import FirebaseStorage

class TrainerPersonalInfoViewController: UIViewController , UIImagePickerControllerDelegate , UINavigationControllerDelegate , NVActivityIndicatorViewable {

    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var nameLbl: UITextField!
    @IBOutlet weak var emailLbl: UITextField!
    @IBOutlet weak var passwordLbl: UITextField!
    @IBOutlet weak var mobileLbl: UITextField!
    @IBOutlet weak var desLbl: UITextView!
    @IBOutlet weak var hisLbl: UITextView!
    @IBOutlet var imges: [UIImageView]!
    @IBOutlet weak var editBtn: UIButton!
    
    @IBOutlet weak var saveBtn: UIButton!
    let imagePicker = UIImagePickerController()
    var imagePickedNumber = 0

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateView()
    }

    func updateView(){
        ProfilePic.roundedButton1(button: editBtn)
        ProfilePic.roundedButton1(button: saveBtn)
        
        imagePicker.delegate = self
        
        ProfilePic.roundedPic(imageView: profileImage)
        if let user = Centers.center {
            nameLbl.text = user.name
            passwordLbl.text = user.password
            mobileLbl.text = user.phone
            emailLbl.text = user.email
            hisLbl.text = user.history
            desLbl.text = user.des
            profileImage.sd_setImage(with: URL(string: user.images), placeholderImage: UIImage(named: "user"))
            imges[0].sd_setImage(with: URL(string: user.img_1), placeholderImage: UIImage(named: "user"))
            imges[1].sd_setImage(with: URL(string: user.img_2), placeholderImage: UIImage(named: "user"))
            imges[2].sd_setImage(with: URL(string: user.img_3), placeholderImage: UIImage(named: "user"))
            imges[3].sd_setImage(with: URL(string: user.img_4), placeholderImage: UIImage(named: "user"))
        }
    }

    @IBAction func editBtnPressed(_ sender: UIButton) {
        self.startAnimating()
               
               let user = Centers.center
               if let name = nameLbl.text , let password = passwordLbl.text , let mobile = mobileLbl.text {
                   
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
    @IBAction func uploadProfileImage(_ sender: UIButton) {
        imagePickedNumber = 1
         imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
        
    }
    
    @IBAction func uploadImages(_ sender: UIButton) {
        if sender.tag == 2 {
            imagePickedNumber = sender.tag
             imagePicker.sourceType = .photoLibrary
            present(imagePicker, animated: true, completion: nil)
        } else if sender.tag == 3 {
            imagePickedNumber = sender.tag
                        imagePicker.sourceType = .photoLibrary
                       present(imagePicker, animated: true, completion: nil)
        } else if sender.tag == 4 {
            imagePickedNumber = sender.tag
                        imagePicker.sourceType = .photoLibrary
                       present(imagePicker, animated: true, completion: nil)
        } else if sender.tag == 5 {
            imagePickedNumber = sender.tag
                        imagePicker.sourceType = .photoLibrary
                       present(imagePicker, animated: true, completion: nil)
        }
    }
    
    @IBAction func saveBtn(_ sender: UIButton) {
        
        if let user = Centers.center {
            APIClient.updateCenter(desctiption: desLbl.text ?? user.des , history: hisLbl.text ?? user.history, img_1: Centers.img1 ?? user.img_1, img_2: Centers.img2 ?? user.img_2, img_3: Centers.img3 ?? user.img_3, img_4: Centers.img4 ?? user.img_4, id: user.id) { (Result) in
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
        if imagePickedNumber == 1 {
            let image = info[.originalImage] as! UIImage
            profileImage.image = image
            
            _ = FirebaseUploader.uploadToFirebase(viewController: self, imagePicker: imagePicker, didFinishPickingMediaWithInfo: info, butNumber: imagePickedNumber)
        }
        if imagePickedNumber == 2 {
            let image = info[.originalImage] as! UIImage
            imges[0].image = image
            _ = FirebaseUploader.uploadToFirebase(viewController: self, imagePicker: imagePicker, didFinishPickingMediaWithInfo: info, butNumber: imagePickedNumber)
        }
        if imagePickedNumber == 3 {
            let image = info[.originalImage] as! UIImage
            imges[1].image = image
            _ = FirebaseUploader.uploadToFirebase(viewController: self, imagePicker: imagePicker, didFinishPickingMediaWithInfo: info, butNumber: imagePickedNumber)
        }
        if imagePickedNumber == 4 {
            let image = info[.originalImage] as! UIImage
            imges[2].image = image
            _ = FirebaseUploader.uploadToFirebase(viewController: self, imagePicker: imagePicker, didFinishPickingMediaWithInfo: info, butNumber: imagePickedNumber)
        }
        if imagePickedNumber == 5 {
            let image = info[.originalImage] as! UIImage
            imges[3].image = image
            _ = FirebaseUploader.uploadToFirebase(viewController: self, imagePicker: imagePicker, didFinishPickingMediaWithInfo: info, butNumber: imagePickedNumber)
        }
    }
    
    
    
    
}
