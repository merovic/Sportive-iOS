//
//  MapKitViewController.swift
//  Sportive
//
//  Created by Ali Mohamed on 10/30/19.
//  Copyright © 2019 amirahmed. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation
class MapKitViewController: UIViewController , CLLocationManagerDelegate{

    var lat:String = ""
    var long:String = ""
   
    @IBOutlet weak var mapView: MKMapView!
    let locationManger = CLLocationManager()
    let regionInMeters: Double = 1000000
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        addPinToMap()
    }
    
    
    
    //-------------------------------------
    
    
    // buttons on storyboard
    
    @IBAction func getLocation(_ sender: UIButton) {
        
        checkLocationIsEnabled()
        deleteAnnotation()
        
    }
    
    
    
    @IBAction func doneChoosingLocation(_ sender:
        UIButton) {
        
        
    }
    
    
    
    //----------------------------------
    
    
    // gestrue recognizer and adding pins to mapview
    
    func addPinToMap(){
        let tapGesture = UILongPressGestureRecognizer(target: self, action: #selector(longTap))
        tapGesture.minimumPressDuration = 0.5
        mapView.addGestureRecognizer(tapGesture)
    }
    
    @objc func longTap(sender: UIGestureRecognizer){
        print("tap")
        if sender.state == .began {
            let locationInView = sender.location(in: mapView)
            let locationOnMap = mapView.convert(locationInView, toCoordinateFrom: mapView)
            lat = String(locationOnMap.latitude)
            long = String(locationOnMap.longitude)
            
            print(lat,long)
            deleteAnnotation()
            addAnnotation(location: locationOnMap)
            
        }
    }
    func deleteAnnotation() {
        self.mapView.removeAnnotations(mapView.annotations)
    }

    func addAnnotation(location: CLLocationCoordinate2D){
        
            let annotation = MKPointAnnotation()
            annotation.coordinate = location
            self.mapView.addAnnotation(annotation)
    }
    
    
    
    //------------------------------------
    
    
    
    
    func CLLocationSetUp(){
        
        locationManger.delegate = self
        locationManger.desiredAccuracy = kCLLocationAccuracyBest
        
    }
    
    func checkLocationIsEnabled(){
        if CLLocationManager.locationServicesEnabled() {
           CLLocationSetUp()
            checkLocationAuthorization()
        } else {
            
        }
    }
    
    func centerViewOnUserLocation() {
        if let location = locationManger.location?.coordinate {
            let region = MKCoordinateRegion.init(center: location, latitudinalMeters: regionInMeters, longitudinalMeters: regionInMeters)
            mapView.setRegion(region, animated: true)
        }
    }

    func checkLocationAuthorization()  {
        switch CLLocationManager.authorizationStatus() {
        case .authorizedAlways:
            break
        case .authorizedWhenInUse:
//            mapView.showsUserLocation = true
            locationManger.startUpdatingLocation()
        case .denied:
            break
        case .notDetermined:
            locationManger.requestWhenInUseAuthorization()
        default:
            break
        }
    }

    
    
    // corelocation methodes
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
         guard let location = locations.last else { return }
               let region = MKCoordinateRegion.init(center: location.coordinate, latitudinalMeters: regionInMeters, longitudinalMeters: regionInMeters)
        lat = String(location.coordinate.latitude)
        long = String(location.coordinate.longitude)
        print(lat, long)
               mapView.setRegion(region, animated: true)
    }
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        checkLocationAuthorization()
    }
    
}
