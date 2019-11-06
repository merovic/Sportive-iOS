//
//  ProfileViewController.swift
//  Sportive
//
//  Created by Mustafa on 10/28/19.
//  Copyright © 2019 amirahmed. All rights reserved.
//


import UIKit
import MapKit
import NVActivityIndicatorView
import SDWebImage

class ProfileViewController: UIViewController {
    
    //MARK - IBOutlet
    
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var Image: UIImageView!
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var historyTf: UITextView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var email: UILabel!
    @IBOutlet weak var phone: UILabel!
    @IBOutlet weak var descriptionTV: UITextView!
    
    var user: LoginResponses?
    var images:[String]?
    var games:[Game]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        collectionView.delegate = self
        collectionView.dataSource = self
        print("----------------------")
        user = Centers.center
        updateViewFromData()
       getGames()
    }
    
    
//MARK:- Update View From Model
    
    func updateViewFromData(){
        if let user = user {
            nameLbl.text = user.name
            email.text = user.email
            phone.text = user.phone
            descriptionTV.text = user.des
            historyTf.text = user.history
            Image.sd_setImage(with: URL(string: user.images), placeholderImage: UIImage(named: "center"))
            images = [user.img_1 ,user.img_2 ,user.img_3 ,user.img_4]
            
            useLocationOnMap()
        }
        
    }
    //MARK: - Add Mark To The Map
    func useLocationOnMap(){
        if let lat = user?.lat , let long = user?.lang {
            let location = CLLocationCoordinate2D(latitude: Double(lat)!, longitude: Double(long)!)
            
            let annotaion = MKPointAnnotation()
            annotaion.coordinate = location
            mapView.addAnnotation(annotaion)
            
            let region = MKCoordinateRegion.init(center: location, latitudinalMeters: 100000, longitudinalMeters: 100000)
            mapView.setRegion(region, animated: true)
            
            collectionView.reloadData()
            tableView.reloadData()
        }
    }
    
    //MARK: - Get All Games From API
    func getGames(){
        if let Id = user?.id{
            APIClient.getGames(id_center: Id) { (Result) in
                switch Result {
                case .success(let response):
                  DispatchQueue.main.async {
                       print(response)
                    self.games = response
                    self.tableView.reloadData()
                    
                   }
                    
                    
                case .failure(let error):
                    DispatchQueue.main.async {
                        print(error.localizedDescription)
                    }
                }
            }
        }
        
    }
}



//MARK - Extension
       
     //MARK: - Tabel View Set Up

extension ProfileViewController : UITableViewDataSource , UITableViewDelegate{
    //TODO: Declare numberOfRowsInSection here:

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return games?.count ?? 0
    }
    
    //TODO: Declare cellForRowAtIndexPath here:
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        
        let cell = tableView.dequeueReusableCell(withIdentifier: "GameTableViewCell", for: indexPath) as! GameTableViewCell
            cell.gameNameLbl.text = games?[indexPath.row].nameGame
            cell.trainerLbl.text = games?[indexPath.row].coach
            
            return cell
        }
    }
    
    




    //MARK - CollectionView Set Up
extension ProfileViewController : UICollectionViewDataSource,UICollectionViewDelegate {
    //TODO: Declare numberOfRowsInSection here:
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images?.count ?? 0
    }
    
    //TODO: Declare cellForItemAt here:
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCollectionViewCell", for: indexPath) as! ImageCollectionViewCell
//        cell.imageView.layer.masksToBounds = true
//        cell.imageView.contentMode = .scaleAspectFit
        cell.imageView.sd_setImage(with: URL(string: images![indexPath.row]), placeholderImage: UIImage(named: "user"))
        
        return cell
    }
    
    
}

