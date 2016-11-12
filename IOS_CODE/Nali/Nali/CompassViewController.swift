//
//  CompassViewController.swift
//  Nali
//
//  Created by Evan Knox on 2016-11-11.
//  Copyright © 2016 parchican. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit
import CoreLocation


class CompassViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet weak var arrow: UIImageView!
    
    let manager = CLLocationManager()
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let location = locations[0]
        print ("Longitude:",location.coordinate.longitude, ", Latitude:", location.coordinate.latitude, "Heading:", location.course)
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
