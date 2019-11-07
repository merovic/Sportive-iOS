//
//  GammingAddedViewController.swift
//  Sportive
//
//  Created by Mustafa on 11/6/19.
//  Copyright © 2019 amirahmed. All rights reserved.
//

import UIKit

class GammingAddedViewController: UIViewController {
    
    var user: LoginResponses?

    @IBOutlet weak var nameOfTrainer: UITextField!
    @IBOutlet weak var nameOfGame: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
         user = Centers.center
    }
    
    @IBAction func addBtnPressed(_ sender: UIButton) {
        addGame()
    }
    
    func addGame () {
        DispatchQueue.main.async {
            if let nameGame = self.nameOfGame.text,!nameGame.isEmpty , let nameTrainer = self.nameOfTrainer.text,!nameTrainer.isEmpty , let id = self.user?.id  {
                    APIClient.AddGame(id_center: id, name_game: nameGame, coach: nameTrainer, completion:  { result in
                        switch result {
                            case .success(let response):
                             
                                DispatchQueue.main.async {
                                    print(response)
                                    self.navigationController?.popViewController(animated: true)
                                }
                        case.failure(let error):
                            print(error.localizedDescription)
                            Alert.show("Problem", massege: error.localizedDescription  , context: self)
                        }
                    })
            } else {
                
            }
                    
        }
    }
}
