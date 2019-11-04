//
//  UserPersonalInfoViewController.swift
//  Sportive
//
//  Created by Mustafa on 11/4/19.
//  Copyright © 2019 amirahmed. All rights reserved.
//

import UIKit

class UserPersonalInfoViewController: UIViewController {

    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var nameTf: UITextField!
    
    @IBOutlet weak var emailTf: UITextField!
    
    @IBOutlet weak var passwordTf: UITextField!
    
    @IBOutlet weak var MobileTf: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func uploadProfileImg(_ sender: Any) {
    }
    
    @IBAction func editBtnPressed(_ sender: UIButton) {
    }
    
}
