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

    @IBOutlet weak var distanceLabel: UILabel!
    @IBOutlet weak var arrow: UIImageView!
    
    let manager = CLLocationManager()
    var distanceLeft:CGFloat = 0;
    
    // dummy coordinates for testing purposes
    let dummyLocation: CLLocation = CLLocation(latitude: 37.3307498, longitude: -122.03054302)
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let location = locations[0]
        // print statement for debugging
        print ("Longitude:",location.coordinate.longitude, ", Latitude:", location.coordinate.latitude, "Heading: ", location.course)
        let rotationAngleDeg: CGFloat = CGFloat(location.course)
        let rotationAngleRad: CGFloat = degreesToRadians(angle: rotationAngleDeg)
        UIView.animate(withDuration: 0.5, animations: ({
            self.arrow.transform = CGAffineTransform.init(rotationAngle: rotationAngleRad)
        }))
        

        distanceLeft = euclidianDistance(location1: dummyLocation, location2: location);
        self.distanceLabel.text = "Distance to Friend"
    }
    
    func degreesToRadians (angle:CGFloat) -> CGFloat{
        return  angle * .pi / 180
    }
    
    func euclidianDistance(location1: CLLocation, location2: CLLocation) -> CGFloat{
            return 0
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
