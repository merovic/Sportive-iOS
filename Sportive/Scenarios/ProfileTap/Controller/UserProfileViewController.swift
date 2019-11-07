//
//  UserProfileViewController.swift
//  Sportive
//
//  Created by Mustafa on 11/4/19.
//  Copyright © 2019 amirahmed. All rights reserved.
//

import UIKit
import MapKit
import SDWebImage
class UserProfileViewController: UIViewController {
    
    
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var tableView1: UITableView!
    
    var user: LoginResponses?
    var centerArray: [Center]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getCenters()
    }
    
    //MARK: - Request all centers from API
    func getCenters(){
        user = Centers.center
        APIClient.getAllCenters { (result) in
            switch result {
                case .success(let response):
                   DispatchQueue.main.async {
                    self.centerArray = response
                    self.addLocations(locationArray: self.centerArray)
                    self.tableView1.reloadData()
                   }
                case .failure(let error):
                   DispatchQueue.main.async {
                       print(error.localizedDescription)
                   }
            }
        }
    }
    
    //MARK: - Add locations
    func addLocations(locationArray:[Center]?) {
        
        if let locations = locationArray {
            for location in locations.indices {
                if let lat:Double = Double(locations[location].lat) , let long = Double(locations[location].lang) {
                     addAnnotation(lat: lat, Long: long)
                }
            }
        }
        
    }
    
    //MARK: - Add Mark to the Map
    func addAnnotation(lat:Double , Long:Double){
        let location = CLLocationCoordinate2D(latitude: lat, longitude: Long )

        let annotaion = MKPointAnnotation()
        annotaion.coordinate = location
        mapView.addAnnotation(annotaion)
        let region = MKCoordinateRegion.init(center: location, latitudinalMeters: 1000000, longitudinalMeters: 1000000)
        mapView.setRegion(region, animated: true)
    }

    //MARK: - Do Segue
    @IBAction func profileButtonPressed(_ sender: Any) {
        if Centers.center?.type == "user" {
            performSegue(withIdentifier: "GoUser", sender: self)
            
        } else if Centers.center?.type == "trainer" {
            performSegue(withIdentifier: "GoTrainer", sender: self)
            
        }
    }
    
    //MARK: - Log Out
    @IBAction func logOut(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
}


//MARK: - TableView Set Up
extension UserProfileViewController: UITableViewDataSource , UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return centerArray?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
            
        if let center = centerArray?[indexPath.row] {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CentersTableViewCell
            cell.centerImage.sd_setImage(with: URL(string: center.images), placeholderImage: UIImage(named: "center"))
            cell.centerName.text = center.name
            cell.centerPhone.text = center.phone
            
            return cell
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(identifier: "DetailsView") as! DataOfCenterViewController
        vc.user = centerArray![indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
    
}
