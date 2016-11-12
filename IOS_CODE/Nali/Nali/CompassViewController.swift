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
    
    var lastAngle: CGFloat = 0
    var currentAngle: CGFloat = 0
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let location = locations[0]
        currentAngle = CGFloat(location.course)
        // print statement for debugging
        print ("Longitude:",location.coordinate.longitude, ", Latitude:", location.coordinate.latitude, "Heading: ",currentAngle)
        let rotationAngleDeg: CGFloat = currentAngle - lastAngle
        let rotationAngleRad: CGFloat = degreesToRadians(angle: rotationAngleDeg)
        UIView.animate(withDuration: 0.5, animations: ({
            self.arrow.transform = CGAffineTransform.init(rotationAngle: rotationAngleRad)
        }))
        lastAngle = currentAngle
        }
    
    func degreesToRadians (angle:CGFloat) -> CGFloat{
        return  angle * .pi / 180
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
