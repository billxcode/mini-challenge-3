//
//  AmbilSampahVC.swift
//  MiniChallenge3
//
//  Created by Nanda Mochammad on 20/08/19.
//  Copyright © 2019 Batavia Hack Town. All rights reserved.
//

import UIKit
//1. import mapkit n core location
import MapKit
import CoreLocation

//5. add CLLocationManagerDelegate
class AmbilSampahVC: UIViewController, CLLocationManagerDelegate{
    
    @IBOutlet weak var mapKitView: MKMapView!
    
    //2. create CLLocationManager
    let manager = CLLocationManager()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getLocation()
        

    }
    
    @IBAction func lokasiSayaBtn(_ sender: Any) {
        getLocation()
    }
    
    func getLocation() {
        mapKitView.showsUserLocation = true
        
        //6. set our location manager to update
        if CLLocationManager.locationServicesEnabled() {
            if CLLocationManager.authorizationStatus() == .restricted ||
                CLLocationManager.authorizationStatus() == .denied ||
                CLLocationManager.authorizationStatus() == .notDetermined {
                
                //3.4. Call the auth here
                manager.requestAlwaysAuthorization()
                manager.requestWhenInUseAuthorization()
                
            }
            
            manager.desiredAccuracy = kCLLocationAccuracyBest
            manager.delegate = self
            manager.distanceFilter = 20
            manager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            
            manager.startUpdatingLocation()
            
        } else {
            print("PLease turn on location services or GPS")
        }
    }
}

extension AmbilSampahVC{
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBar(withTitle: "Ambil Sampah", destination: self)
    }
    
    //7. declare the location manager didUpdateLocation method
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        self.manager.stopUpdatingLocation()
        
        guard let locValue: CLLocationCoordinate2D = manager.location?.coordinate else { return }
        print("locations = \(locValue.latitude) \(locValue.longitude)")

        let centerLocation = CLLocationCoordinate2D(latitude: locValue.latitude, longitude: locValue.longitude)
        let region = MKCoordinateRegion(center: centerLocation, span: MKCoordinateSpan(latitudeDelta: 0.002, longitudeDelta: 0.002))
        
        //bring camera to this position
        self.mapKitView.setRegion(region, animated: true)
        
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Unable to access your current location")
    }
    
    
}
