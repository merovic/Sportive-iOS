//
//  UserViewController.swift
//  Sportive
//
//  Created by Ali Mohamed on 10/28/19.
//  Copyright © 2019 amirahmed. All rights reserved.
//

import UIKit

class UserViewController: UIViewController {
    
    var user: LoginResponses?
    var tariner:[Tariner]?

    @IBOutlet weak var UserTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UserTableView.delegate = self
        UserTableView.dataSource = self
        user = Centers.center
        getALLTariner()
    }
    
    
    func  getALLTariner(){
           
           APIClient.getAllTariner { (res) in
               switch res {
               case .success(let response):
                   DispatchQueue.main.async {
                     //  print(response)
                        self.tariner = response
                       print(self.tariner)
                    self.UserTableView.reloadData()
                   }
                   case .failure(let error):
                   DispatchQueue.main.async {
                       print(error.localizedDescription)
                   }
               }
           }

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
