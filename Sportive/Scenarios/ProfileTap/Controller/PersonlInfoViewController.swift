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
    @IBOutlet weak var descriptionLbl: UITextView!
    @IBOutlet weak var historyLbl: UITextView!
    @IBOutlet var uploadedImages: [UIImageView]!
    
    @IBOutlet weak var addBtn: UIButton!
    @IBOutlet weak var saveBtn: UIButton!
    @IBOutlet weak var editBtn: UIButton!
    var profileImageUrl: String?
    let imagePicker = UIImagePickerController()
    var imagePickedNumber = 0
    var image1: String?
    var image2: String?
    var image3: String?
    var image4: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        update()
        
        }
    
    
    //MARK: - Update View From Model
    func update(){
        
        imagePicker.delegate = self
        ProfilePic.roundedPic(imageView: profileImg)
        ProfilePic.roundedButton1(button: editBtn)
        ProfilePic.roundedButton1(button: saveBtn)
        ProfilePic.roundedButton2(button: addBtn)


        if let user = Centers.center {
            nameTf.text = user.name
            passwordTf.text = user.password
            mobileTf.text = user.phone
            emailTf.text = user.email
            descriptionLbl.text = user.des
            historyLbl.text = user.history
            profileImg.sd_setImage(with: URL(string: user.images), placeholderImage: UIImage(named: "user"))
            uploadedImages[0].sd_setImage(with: URL(string: user.img_1), placeholderImage: UIImage(named: "user"))
            uploadedImages[1].sd_setImage(with: URL(string: user.img_2), placeholderImage: UIImage(named: "user"))
            uploadedImages[2].sd_setImage(with: URL(string: user.img_3), placeholderImage: UIImage(named: "user"))
            uploadedImages[3].sd_setImage(with: URL(string: user.img_4), placeholderImage: UIImage(named: "user"))
            
        }
    }

   //MARK - IBAction
    
    //MARK: - Personal Section

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
            APIClient.updateCenter(desctiption: descriptionLbl.text ?? user.des , history: historyLbl.text ?? user.history, img_1: Centers.img1 ?? user.img_1, img_2: Centers.img2 ?? user.img_2, img_3: Centers.img3 ?? user.img_3, img_4: Centers.img4 ?? user.img_4, id: user.id) { (Result) in
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
    
    @IBAction func UploadImage(_ sender: UIButton) {
        imagePickedNumber = 1
        imagePicker.sourceType = .photoLibrary
       present(imagePicker, animated: true, completion: nil)
        
    }
    
    
    //MARK: - Profile Section
    
    //MARK: - Upload the 4 Images for personal Section
    
    @IBAction func Upload4Images(_ sender: UIButton) {
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
    
    @IBAction func addGameBtnPressed(_ sender: UIButton) {
      }
    
    
}

//MARK: - ImagePicker Set Up and Image Upload

extension PersonlInfoViewController: UIImagePickerControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[.originalImage] as! UIImage
        
        if imagePickedNumber == 1 {
           profileImg.image = image
            profileImageUrl = FirebaseUploader.uploadToFirebase(viewController: self, imagePicker: imagePicker, didFinishPickingMediaWithInfo: info, butNumber: imagePickedNumber)
            
        } else if imagePickedNumber == 2 {
            uploadedImages[0].image = image
            image1 = FirebaseUploader.uploadToFirebase(viewController: self, imagePicker: imagePicker, didFinishPickingMediaWithInfo: info, butNumber: imagePickedNumber)
        }else if imagePickedNumber == 3 {
            uploadedImages[1].image = image
            image1 = FirebaseUploader.uploadToFirebase(viewController: self, imagePicker: imagePicker, didFinishPickingMediaWithInfo: info, butNumber: imagePickedNumber)
        }else if imagePickedNumber == 4 {
            uploadedImages[2].image = image
            image1 = FirebaseUploader.uploadToFirebase(viewController: self, imagePicker: imagePicker, didFinishPickingMediaWithInfo: info, butNumber: imagePickedNumber)
        }else if imagePickedNumber == 5 {
            uploadedImages[3].image = image
            image1 = FirebaseUploader.uploadToFirebase(viewController: self, imagePicker: imagePicker, didFinishPickingMediaWithInfo: info, butNumber: imagePickedNumber)
        }
    }
    
}
