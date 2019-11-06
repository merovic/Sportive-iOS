//
//  DataOfCenterViewController.swift
//  Sportive
//
//  Created by Mustafa on 11/6/19.
//  Copyright © 2019 amirahmed. All rights reserved.
//

import UIKit
import MapKit
import SDWebImage
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
    
    
    var user:Center?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateView()
    }

    func updateView(){
        if let user = user {
            name.text = user.name
            emailLbl.text = user.email
            descirptionLbl.text = user.des.rawValue
            linkidInLbl.text = user.linkedIn
            FaceBookLbl.text = user.facebook
            webSiteLbl.text = user.website
            serviceLbl.text = user.services
            profileImage.sd_setImage(with: URL(string: user.images), placeholderImage: UIImage(named: "center"))
            getLocation()
        }
    }
    
    func getLocation(){
        if let lat = user?.lat , let long = user?.lang {
                   let location = CLLocationCoordinate2D(latitude: Double(lat)!, longitude: Double(long)!)
                   
                   let annotaion = MKPointAnnotation()
                   annotaion.coordinate = location
                   mapView.addAnnotation(annotaion)
                   
                   let region = MKCoordinateRegion.init(center: location, latitudinalMeters: 100000, longitudinalMeters: 100000)
                   mapView.setRegion(region, animated: true)
               }
        
    }
    
       
    
    @IBAction func JoinAction(_ sender: Any) {
    }
    
    @IBAction func addComment(_ sender: Any) {
    }
    
    
    
    
}
