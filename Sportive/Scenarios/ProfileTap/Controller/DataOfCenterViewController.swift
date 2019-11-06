//
//  DataOfCenterViewController.swift
//  Sportive
//
//  Created by Mustafa on 11/6/19.
//  Copyright © 2019 amirahmed. All rights reserved.
//

import UIKit
import MapKit

class DataOfCenterViewController: UIViewController {
    
    @IBOutlet weak var profileImage: UIImageView!
    
    @IBOutlet weak var name: UILabel!
    
    @IBOutlet weak var emailLbl: UILabel!
    
    @IBOutlet weak var mapView: MKMapView!
    
    @IBOutlet weak var descirptionLbl: UILabel!
    
    @IBOutlet weak var linkidInLbl: UILabel!
    @IBOutlet weak var webSiteLbl: UILabel!
    
    @IBOutlet weak var serviceLbl: UILabel!
    
    @IBOutlet weak var FaceBookLbl: UILabel!
    
    
    @IBOutlet weak var coolectionView: UICollectionView!
    
    
    @IBOutlet weak var historyLbl: UILabel!
    
    
    @IBOutlet weak var TableViewOfGamming: UITableView!
    
    @IBOutlet weak var TableViewOfComment: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

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

    @IBAction func JoinAction(_ sender: Any) {
    }
    
    @IBAction func addComment(_ sender: Any) {
    }
    
    
    
    
}
