//
//  NextVC.swift
//  GitExample
//
//  Created by Office Mac on 2/2/18.
//  Copyright © 2018 Office Mac. All rights reserved.
//



import UIKit
import CoreLocation
import MapKit


class NextVC: UIViewController ,CLLocationManagerDelegate{
    var locationManager:CLLocationManager!

    
    @IBOutlet weak var my_map: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
       // my_map.delegate = self as! MKMapViewDelegate
        print("In next view Controller")
        
//        locationManager = CLLocationManager()
//        locationManager.delegate = self
//        locationManager.desiredAccuracy = kCLLocationAccuracyBest
//        locationManager.requestAlwaysAuthorization()
//
//        if CLLocationManager.locationServicesEnabled() {
//            //locationManager.startUpdatingHeading()
//            locationManager.startUpdatingLocation()
//        }
        
        
        
       setupLocationManager()

        
        //
        // Do any additional setup after loading the view.
    }
    
    
    
    
    func setupLocationManager(){
        locationManager = CLLocationManager()
        locationManager.delegate = self
        self.locationManager.requestAlwaysAuthorization()
        locationManager.desiredAccuracy =  kCLLocationAccuracyBest
        locationManager.startUpdatingLocation()
        
        if CLLocationManager.authorizationStatus() != .authorizedAlways     // Check authorization for location tracking
        {
            locationManager.requestAlwaysAuthorization()                    // LocationManager will callbackdidChange... once user responds
        } else {
            locationManager.startUpdatingLocation()
        }
        
        if CLLocationManager.locationServicesEnabled() {
            switch(CLLocationManager.authorizationStatus()) {
            case .notDetermined, .restricted, .denied:
                print("No access")
            case .authorizedAlways, .authorizedWhenInUse:
                print("Access")
            }
        } else {
            print("Location services are not enabled")
        }
        
    }
    
    
    
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .notDetermined:
            // If status has not yet been determied, ask for authorization
            manager.requestWhenInUseAuthorization()
            break
        case .authorizedWhenInUse:
            // If authorized when in use
            manager.startUpdatingLocation()
            break
        case .authorizedAlways:
           // lbl_locationContent.text = "Great, location services are now enabled! Tap 'OK' to continue"
            // If always authorized
            manager.startUpdatingLocation()
            break
        case .restricted:
            // If restricted by e.g. parental controls. User can't enable Location Services
            break
        case .denied:
            
            
            // If user denied your app access to Location Services, but can grant access from Settings.app
            break
        default:
            break
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error)
    {
         print("didFailWithError")
    }

    /*
    // MARK: - Navigation
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
}
