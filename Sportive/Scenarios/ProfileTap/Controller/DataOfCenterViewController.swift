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
    @IBOutlet weak var joinBtn: UIButton!
    @IBOutlet weak var commentBtn: UIButton!
    
    
    var user: Center?
    var images: [String]?
    var games: [Game]?
    override func viewDidLoad() {
        super.viewDidLoad()
        updateView()
        getGames()
    }

    func updateView(){
        ProfilePic.roundedButton1(button: joinBtn)
        ProfilePic.roundedButton2(button: commentBtn)
        if let user = user {
            name.text = user.name
            emailLbl.text = user.email
            descirptionLbl.text = user.des.rawValue
            linkidInLbl.text = user.linkedIn
            FaceBookLbl.text = user.facebook
            webSiteLbl.text = user.website
            serviceLbl.text = user.services
            profileImage.sd_setImage(with: URL(string: user.images), placeholderImage: UIImage(named: "center"))
            images = [user.img1,user.img2,user.img3,user.img4]
            getLocation()
             
//            getComments()
        }
    }
    
    func getLocation(){
        if let lat = user?.lat , let long = user?.lang {
            let lat = Double(lat) ?? 0
            let long = Double(long) ?? 0
                   let location = CLLocationCoordinate2D(latitude: lat, longitude: long)
                   
                   let annotaion = MKPointAnnotation()
                   annotaion.coordinate = location
                   mapView.addAnnotation(annotaion)
                   
                   let region = MKCoordinateRegion.init(center: location, latitudinalMeters: 100000, longitudinalMeters: 100000)
                   mapView.setRegion(region, animated: true)
               }
        
    }
    
    func getGames(){
        if let Id = user?.id{
            APIClient.getGames(id_center: Id) { (Result) in
                switch Result {
                case .success(let response):
                  DispatchQueue.main.async {
                    print(response)
                    print(Id)
                    }
                    
                    
                case .failure(let error):
                    DispatchQueue.main.async {
                        print(error.localizedDescription)
                    }
                }
            }
        }
        
    }
    
//    func getComments(){
//        if let id = user?.id {
//            APIClient.getComments(id: id) { (result) in
//                switch result {
//                case .success(let response):
//                    DispatchQueue.main.async {
//                        print("response================== \(response)")
//                    }
//                case .failure(let error) :
//                    DispatchQueue.global().async {
//                        print(error.localizedDescription)
//                    }
//                }
//            }
//        }
//    }
    @IBAction func JoinAction(_ sender: Any) {
    }
    
    @IBAction func addComment(_ sender: Any) {
    }
    
    
    
    
}
extension DataOfCenterViewController: UICollectionViewDataSource , UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images?.count ?? 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CenterProfileCellCollectionViewCell", for: indexPath) as! CenterProfileCellCollectionViewCell
        cell.centerImage.sd_setImage(with: URL(string: images?[indexPath.row] ?? "") , placeholderImage: UIImage(named: "back"))
        return cell
    }
}

extension DataOfCenterViewController: UITableViewDataSource , UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if tableView.tag == 1 {
            return games?.count ?? 0
        } else if tableView.tag == 2 {
            return 0
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let game = games {
            let cell = tableView.dequeueReusableCell(withIdentifier: "CenteProfileGammingTableViewCell", for: indexPath) as! CenteProfileGammingTableViewCell
            cell.gameNameLbl.text = game[indexPath.row].nameGame
            cell.trainerLbl.text = game[indexPath.row].coach
        }
     return UITableViewCell()
    }
    
    
    
}
