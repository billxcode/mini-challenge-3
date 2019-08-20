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

        // Do any additional setup after loading the view.
    }
    
    @IBAction func lokasiSayaBtn(_ sender: Any) {
        if CLLocationManager.locationServicesEnabled(){
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
        }
        
        configureLocation()
    }
    
    @IBAction func cariPelangganBtn(_ sender: Any) {
        
    }
    
    @IBAction func ambilSampahBtn(_ sender: Any) {
        
    }
    
    func configureLocation(){
        locationManager.requestWhenInUseAuthorization()
    }
    
    func fetchLocation(from location: CLLocation, completion: @escaping(_ city: String?, _ country:String?, _ error:Error?) -> ()){
        CLGeocoder().reverseGeocodeLocation(location) {placemarks,error in
            completion(placemarks?.first?.locality,
                       placemarks?.first?.country,
                       error)
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location: CLLocation = manager.location else{return}
        
        fetchLocation(from: location) { (city, country, error) in
            guard let city = city, let country = country, error == nil else{return}
            
            print("City: ", city, " Country: ", country)
        }
    }

    
}

extension AmbilSampahViewController{
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBar(withTitle: "AmbilSampah")
    }
}
