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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

     
    }

}

//MARK: - TableView Set Up
extension UserViewController: UITableViewDelegate , UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! UserTableViewCell
        
        
        return cell
    }
    
    
}
