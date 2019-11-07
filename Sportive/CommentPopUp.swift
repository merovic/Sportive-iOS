//
//  PopUp.swift
//  Sportive
//
//  Created by Ali Mohamed on 11/7/19.
//  Copyright © 2019 amirahmed. All rights reserved.
//

import UIKit
import Cosmos

class CommentPopUp: UIViewController {

    @IBOutlet weak var rateView: CosmosView!
    @IBOutlet weak var commentTf: UITextField!
    @IBOutlet weak var submitBtn: UIButton!
    
    var centerOrTrainerId = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        ProfilePic.roundedButton2(button: submitBtn)

    }
    
    @IBAction func addComment(_ sender: UIButton) {
        if let user = Centers.center {
            
            APIClient.addComment(id_user: user.id, id_center_or_trainer: centerOrTrainerId, comment: commentTf.text ?? "", rate: String(rateView.rating)) { (result) in
                switch result {
                case .success(let response):
                    DispatchQueue.main.async {
                        if response == "True" {
                            self.dismiss(animated: true, completion: nil)
                        } else if response == "False" {
                            print(response)
                        }
                    }
                case .failure(let error):
                    print(error)
                }
            }
        }
    }
    
}
