//
//  ActivitesViewController.swift
//  Sportive
//
//  Created by Ali Mohamed on 10/28/19.
//  Copyright © 2019 amirahmed. All rights reserved.
//

import UIKit

class ActivitesViewController: UIViewController {
    


    @IBOutlet weak var ActivitiesTableView: UITableView!
    
    var user: LoginResponses?
    var actives:[AllActive]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ActivitiesTableView.delegate = self
        ActivitiesTableView.dataSource = self
        
        user = Centers.center
        allActive()

    }
    
    //MARK: - Request activities from API
    func allActive()  {
        
        if let id = user?.id{
            DispatchQueue.main.async {
                APIClient.getAllActive(id: id, completion: { result in
                    switch result{
                        case .success(let response):
                            DispatchQueue.main.async {
                                print(response)
                                    self.actives = response
                                    self.ActivitiesTableView.reloadData()
                                    ProfilePic.emptyData(TabelView: self.ActivitiesTableView, View: self.view, MessageText: "No Activities")

                                   }
                         case .failure(let error):
                            print(error.localizedDescription)
                                ProfilePic.emptyData(TabelView: self.ActivitiesTableView, View: self.view, MessageText: "No Activities")
                    }
                })
            }
        }
    }

    //MARK: - Log Out
    @IBAction func logOut(_ sender: UIBarButtonItem) {
         self.dismiss(animated: true, completion: nil)
    }
    
}


// MARK: - TableView Set Up
extension ActivitesViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return actives?.count ?? 0

    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! ActivitiesTableViewCell
        cell.statusLbl.text = actives?[indexPath.row].message
        cell.emailLbl.text = actives?[indexPath.row].email
        cell.ImageView.sd_setImage(with: URL(string: actives?[indexPath.row].images ?? ""), placeholderImage: UIImage(named: "user"))
        cell.rateButtonPressed.text = actives?[indexPath.row].type
  
        return cell
    }
 
}
