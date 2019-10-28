//
//  PersonlInfoViewController.swift
//  Sportive
//
//  Created by Mustafa on 10/28/19.
//  Copyright © 2019 amirahmed. All rights reserved.
//

import UIKit

class PersonlInfoViewController: UIViewController {
    
    //MARK - IBOutlet

    
    @IBOutlet weak var profileImg: UIImageView!
    @IBOutlet weak var nameTf: UITextField!
    
    @IBOutlet weak var emailTf: UITextField!
    
    @IBOutlet weak var passwordTf: UITextField!
    
    
    @IBOutlet weak var mobileTf: UITextField!
    
    @IBOutlet weak var profileLbl1: UILabel!
    
    @IBOutlet weak var profileLbl2: UILabel!
    @IBOutlet var uploadedImages: [UIImageView]!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

   //MARK - IBAction

    @IBAction func editBtnPressed(_ sender: UIButton) {
    }
    
    
    @IBAction func saveBtnPressed(_ sender: UIButton) {
    }
    
    @IBAction func addGameBtnPressed(_ sender: UIButton) {
    }
    
}
