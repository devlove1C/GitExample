//
//  MapVC.swift
//  GitExample
//
//  Created by Office Mac on 2/2/18.
//  Copyright © 2018 Office Mac. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit
class MapVC: UIViewController ,CLLocationManagerDelegate{

    var locationManager = CLLocationManager()

    override func viewDidLoad() {
        super.viewDidLoad()
     
        print("In  Map viewController")

        
        
        
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            //locationManager.startUpdatingHeading()
            locationManager.startUpdatingLocation()
        }
        // Do any additional setup after loading the view.
    
    }
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedWhenInUse {
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.startUpdatingLocation()
            let locValue: CLLocationCoordinate2D = (manager.location?.coordinate)!
            print("locations = \(locValue.latitude) \(locValue.longitude)")
        }//if authorized
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
