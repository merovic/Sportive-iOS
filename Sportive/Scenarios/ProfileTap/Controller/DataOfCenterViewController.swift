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
import SwiftyJSON

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
    @IBOutlet weak var viewGame: UIView!
    @IBOutlet weak var gameTableView: UITableView!
    @IBOutlet weak var viewComment: UIView!
    @IBOutlet weak var commentTabelView: UITableView!
    
    var user: Center?
    var images: [String]?
    var games = [Gam]()
    var comment:[CommentElement]?
    override func viewDidLoad() {
        super.viewDidLoad()
        updateView()
        getComments()
        
        
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
            getAllGame()
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
    
    
    func getAllGame() {
        if let user = user?.id {
        APIClient.games(id_center: user, completion: {
            
               result in
               switch result {
               case .success(let response):
                   DispatchQueue.main.async {
//                    ProfilePic.emptyData(TabelView: self.gameTableView, View: self.viewGame, MessageText: "No Games")
                       do {
                            let jsonArray = try JSON(data: Data(response.utf8))
                        
                        for json in 0..<jsonArray.count {
                            let gam = Gam()
                            
                            gam.id = jsonArray[json]["id"].intValue
                            gam.idCenter = jsonArray[json]["id_center"].intValue
                            gam.nameGame = jsonArray[json]["name_game"].stringValue
                            gam.coach = jsonArray[json]["coach"].stringValue
                            gam.datee = jsonArray[json]["Datee"].stringValue
                            
                            self.games.append(gam)
                            self.TableViewOfGamming.reloadData()
                        }
                       
                       } catch let parseError as NSError {
                           print("JSON Error \(parseError.localizedDescription)")
                       }
                   }
               case .failure(let error):
               print(error.localizedDescription)
                ProfilePic.emptyData(TabelView: self.gameTableView, View: self.viewGame, MessageText: "No Games")
               }
           })
           
       }
    }
    func getComments(){
        if let id = user?.id {
            APIClient.getComments(id: id) { (result) in
                switch result {
                case .success(let response):
                    DispatchQueue.main.async {
                        print("response================== \(response)")
                        self.comment = response
                        self.TableViewOfComment.reloadData()
                    }
                case .failure(let error) :
                    DispatchQueue.global().async {
                        print(error.localizedDescription)
                    }
                }
            }
        }
    }

 
    
    @IBAction func JoinAction(_ sender: Any) {
    }
    
    @IBAction func addComment(_ sender: Any) {
    }
    
}


//MARK: - CollectionView Delegate
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


//MARK: - TabelView Set Up
extension DataOfCenterViewController: UITableViewDataSource , UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if tableView.tag == 1 {
            return games.count
        } else if tableView.tag == 2 {
            return comment?.count ?? 0
            
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if tableView.tag == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "CenteProfileGammingTableViewCell", for: indexPath) as! CenteProfileGammingTableViewCell
                      cell.gameNameLbl.text = games[indexPath.row].nameGame
                      cell.trainerLbl.text = games[indexPath.row].coach
            return cell
        } else if tableView.tag == 2 {
            if let comments = comment?[indexPath.row] {
                let cell = tableView.dequeueReusableCell(withIdentifier: "CommentTableViewCell", for: indexPath) as! CommentTableViewCell
                cell.rateDegreeLbl.text = "\(comments.rate)/5"
                cell.nameLbl.text = comments.name
                cell.profileImage.sd_setImage(with: URL(string: comments.images), placeholderImage: UIImage(named: "user"))
                cell.textViewComment.text = comments.comment
                let rateStar = Double(comments.rate)
                cell.rateStar.rating = rateStar ?? 0.0

                
                           return cell
            }
            
        
        }
        
     return UITableViewCell()
    }
    
    
    
}
