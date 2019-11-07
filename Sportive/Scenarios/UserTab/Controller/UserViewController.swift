//
//  UserViewController.swift
//  Sportive
//
//  Created by Ali Mohamed on 10/28/19.
//  Copyright © 2019 amirahmed. All rights reserved.
//

import UIKit

class UserViewController: UIViewController {

    @IBOutlet weak var UserTableView: UITableView!
    
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
                        self.UserTableView.reloadData()
                        ProfilePic.emptyData(TabelView: self.UserTableView, View: self.view, MessageText: "No Trainers")
                    
                   }
               case .failure(let error):
                   DispatchQueue.main.async {
                        print(error.localizedDescription)
                        ProfilePic.emptyData(TabelView: self.UserTableView, View: self.view, MessageText: "No Trainers")
                   }
           }
       }

    }
    //MARK: - Log Out
    @IBAction func logOut(_ sender: UIBarButtonItem) {
         self.dismiss(animated: true, completion: nil)
    }
}


//MARK: - TableView Set Up
extension UserViewController: UITableViewDelegate , UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return tariner?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! UserTableViewCell
        
        cell.nameLbl.text = tariner?[indexPath.row].name
        cell.emailLbl.text = tariner?[indexPath.row].email
        cell.ImageView.sd_setImage(with: URL(string: tariner?[indexPath.row].images ?? ""), placeholderImage: UIImage(named: "user"))
        
        return cell
    }
    
    
}
