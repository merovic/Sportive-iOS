//
//  TrainerViewController.swift
//  Sportive
//
//  Created by Mustafa on 11/4/19.
//  Copyright © 2019 amirahmed. All rights reserved.
//

import UIKit

class TrainerViewController: UIViewController {

    @IBOutlet weak var allTrainerTableView: UITableView!
    
    var user: LoginResponses?
    var tariner:[Tariner]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getALLTariner()
    }

    //MARK: - Get all trainers from API
    func  getALLTariner(){
        user = Centers.center
            APIClient.getAllTariner { (res) in
                switch res {
                    case .success(let response):
                        DispatchQueue.main.async {
                            self.tariner = response
                            self.allTrainerTableView.reloadData()
                            ProfilePic.emptyData(TabelView: self.allTrainerTableView, View: self.view, MessageText: "No Trainers")

                        }
                   case .failure(let error):
                        DispatchQueue.main.async {
                        print(error.localizedDescription)
                        ProfilePic.emptyData(TabelView: self.allTrainerTableView, View: self.view, MessageText: "No Trainers")
                        }
                }
            }
    }
    
    //MARK: - Log Out
    @IBAction func logOut(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }

    @IBAction func showProfile(_ sender: UIBarButtonItem) {
        
        if user?.type == "user" {
            performSegue(withIdentifier: "user", sender: self)
        } else if user?.type == "trainer" {
            performSegue(withIdentifier: "trainer", sender: self)
        }
    }
    
}


//MARK: - TableView Set Up
extension TrainerViewController: UITableViewDelegate , UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tariner?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TrainerTableViewCell", for: indexPath) as! TrainerTableViewCell
       
        cell.nameLbl.text = tariner?[indexPath.row].name
        cell.emailLbl.text = tariner?[indexPath.row].email
        cell.profileImage.sd_setImage(with: URL(string: tariner?[indexPath.row].images ?? ""), placeholderImage: UIImage(named: "user"))
        
        return cell
    }
    
    
}
