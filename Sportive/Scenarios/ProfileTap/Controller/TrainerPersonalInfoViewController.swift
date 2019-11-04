//
//  TrainerPersonalInfoViewController.swift
//  Sportive
//
//  Created by Mustafa on 11/4/19.
//  Copyright © 2019 amirahmed. All rights reserved.
//

import UIKit

class TrainerPersonalInfoViewController: UIViewController {

    @IBOutlet weak var profileImage: UIImageView!
    
    @IBOutlet weak var nameLbl: UITextField!
    
    @IBOutlet weak var emailLbl: UITextField!
    
    @IBOutlet weak var passwordLbl: UITextField!
    
    @IBOutlet weak var mobileLbl: UITextField!
    
    @IBOutlet weak var desLbl: UITextView!
    @IBOutlet weak var hisLbl: UITextView!
    
    
    @IBOutlet var imges: [UIImageView]!
    
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

    @IBAction func editBtnPressed(_ sender: UIButton) {
    }
    @IBAction func uploadProfileImage(_ sender: UIButton) {
    }
    
    @IBAction func uploadImages(_ sender: UIButton) {
    }
    
    @IBAction func saveBtn(_ sender: UIButton) {
    }
    
}
