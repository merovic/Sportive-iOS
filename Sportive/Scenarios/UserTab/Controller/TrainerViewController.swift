//
//  TrainerViewController.swift
//  Sportive
//
//  Created by Mustafa on 11/4/19.
//  Copyright © 2019 amirahmed. All rights reserved.
//

import UIKit

class TrainerViewController: UIViewController {
    
    var user: LoginResponses?
    var tariner:[Tariner]?

    @IBOutlet weak var allTrainerTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        allTrainerTableView.delegate = self
        allTrainerTableView.dataSource = self
        user = Centers.center
        print("xfcghjkm,l;fghjmk,l.")
        
        getALLTariner()


        // Do any additional setup after loading the view.
    }

    
    
    
    func  getALLTariner(){
               
               APIClient.getAllTariner { (res) in
                   switch res {
                   case .success(let response):
                       DispatchQueue.main.async {
                         //  print(response)
                            self.tariner = response
                           print(self.tariner)
                        self.allTrainerTableView.reloadData()
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
