//
//  ActivitesUserOrTrainerViewController.swift
//  Sportive
//
//  Created by Mustafa on 11/4/19.
//  Copyright © 2019 amirahmed. All rights reserved.
//

import UIKit

class ActivitesUserOrTrainerViewController: UIViewController {
    var user: LoginResponses?
    var actives:[AllActive]?

    
    @IBOutlet weak var activityTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        user = Centers.center
               allActive()
    }
    

    func allActive()  {
           
             if let id = user?.id{
               DispatchQueue.main.async {
                   APIClient.getAllActive(id: id, completion: { result in
                              switch result{
                                  case .success(let response):
                                          DispatchQueue.main.async {
                                              print(response)
                                           self.actives = response
                                           self.activityTableView.reloadData()
                                           
                                          }
                                      case .failure(let error):
                                          print(error.localizedDescription)

                                      }
                                       })
                                         
                      
           }
       }
           
       }
}



extension ActivitesUserOrTrainerViewController : UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return actives?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ActivitiesUserOrTrainerTableViewCell", for: indexPath) as! ActivitiesUserOrTrainerTableViewCell
        cell.massageLbl.text = actives?[indexPath.row].message
        cell.emailLbl.text = actives?[indexPath.row].email
        cell.profileImage.sd_setImage(with: URL(string: actives?[indexPath.row].images ?? ""), placeholderImage: UIImage(named: "user"))
        cell.typeLbl.text = actives?[indexPath.row].type
        
        
        
        return cell
    }
    
}




