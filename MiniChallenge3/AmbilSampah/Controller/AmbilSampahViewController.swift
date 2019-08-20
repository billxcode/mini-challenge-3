//
//  AmbilSampahViewController.swift
//  MiniChallenge3
//
//  Created by Nanda Mochammad on 20/08/19.
//  Copyright © 2019 Batavia Hack Town. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

class AmbilSampahViewController: UIViewController, CLLocationManagerDelegate {
    
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
//        configureLocation()
    }
    
    @IBAction func lokasiSayaBtn(_ sender: Any) {
        
        if CLLocationManager.locationServicesEnabled(){
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.distanceFilter = 100
            locationManager.startUpdatingLocation()
        }
        
    }
    
    @IBAction func cariPelangganBtn(_ sender: Any) {
        
    }
    
    @IBAction func ambilSampahBtn(_ sender: Any) {
        
    }
    
    func configureLocation(){
        locationManager.requestWhenInUseAuthorization()
    }
    
    func fetchLocation(from location: CLLocation, completion: @escaping(_ latitude: Double?, _ longitude:Double?, _ error:Error?) -> ()){
        CLGeocoder().reverseGeocodeLocation(location) {placemarks,error in
            completion(placemarks?.first?.location?.coordinate.latitude,
                       placemarks?.first?.location?.coordinate.longitude,
                       error)
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location: CLLocation = manager.location else{return}
        
        fetchLocation(from: location) { (city, country, error) in
            guard let city = city, let country = country, error == nil else{return}
            
            print("City: ", city, " Country: ", country)
            self.addMarkerInLocation()
        }
    }
    
    func addMarkerInLocation(){
        
    }

    
}

extension AmbilSampahViewController{
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBar(withTitle: "AmbilSampah")
    }
}
