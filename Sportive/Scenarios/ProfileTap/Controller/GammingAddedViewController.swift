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

    @IBAction func addBtnPressed(_ sender: UIButton) {
        addGame()
    }
    
    func addGame () {
        
        
        
        DispatchQueue.main.async {
                    // Test Login request
            if let nameGame = self.nameOfGame.text,!nameGame.isEmpty , let nameTrainer = self.nameOfTrainer.text,!nameTrainer.isEmpty , let id = self.user?.id  {
                    
                    APIClient.AddGame(id_center: id, name_game: nameGame, coach: nameTrainer, completion:  { result in
                                    switch result {
                                    case .success(let response):
                                     
                                        DispatchQueue.main.async {
                                            print(response)
                                            self.dismiss(animated: true, completion: nil)
                                      
                                        }
                                    case.failure(let error):
                                        print(error.localizedDescription)
                                     //    Alert.show("Problem", massege: error.localizedDescription  , context: self)
                                    }
                                })
                    }else{
                    
         
                    }
                    
                }
        
        
        
        
        
        
        
        
        
        
        
        
    }
}
