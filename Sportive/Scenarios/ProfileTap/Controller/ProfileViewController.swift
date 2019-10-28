//
//  ProfileViewController.swift
//  Sportive
//
//  Created by Mustafa on 10/28/19.
//  Copyright © 2019 amirahmed. All rights reserved.
//

import UIKit
import MapKit
class ProfileViewController: UIViewController {
    
    //MARK - IBOutlet

    @IBOutlet weak var mapView: MKMapView!
    
    @IBOutlet weak var descriptionTf: UIView!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var historyTf: UITextView!
    
    @IBOutlet weak var tableView: UITableView!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    


}

//MARK - Extension
       

    //MARK - UITableViewDelegate

extension ProfileViewController : UITableViewDelegate {
    
}
     //MARK - UITableViewDataSource

extension ProfileViewController : UITableViewDataSource {
    //TODO: Declare numberOfRowsInSection here:

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }
    //TODO: Declare cellForRowAtIndexPath here:

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    
    
    
}
       //MARK - UICollectionViewDelegate
extension ProfileViewController : UICollectionViewDelegate {
    
}
    //MARK - UICollectionViewDataSource
extension ProfileViewController : UICollectionViewDataSource {
    //TODO: Declare numberOfRowsInSection here:
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        <#code#>
    }
    //TODO: Declare cellForItemAt here:

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        <#code#>
    }
    
    
}

