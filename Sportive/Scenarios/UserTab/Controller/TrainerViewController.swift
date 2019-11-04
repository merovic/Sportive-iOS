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
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    


}


//MARK: - TableView Set Up
extension TrainerViewController: UITableViewDelegate , UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! UserTableViewCell
        
        
        return cell
    }
    
    
}
