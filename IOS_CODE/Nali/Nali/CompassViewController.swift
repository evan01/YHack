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
import Foundation

class CompassViewController: UIViewController, CLLocationManagerDelegate {

    
    //todo , fix this hacky hardcoded friend name to the name of the selected friend in the form
    var frndName = ""
    var frndUserNm = ""
    
    @IBOutlet weak var friendsName: UILabel!
    @IBOutlet weak var distanceLabel: UILabel!
    @IBOutlet weak var arrow: UIImageView!
    @IBOutlet weak var decodedDistLabel: UILabel!
    
    
    let manager = CLLocationManager()
    var distanceLeft:Int = 0;
    
    // dummy coordinates for testing purposes
    var dummyLocation: CLLocation = CLLocation(latitude: 37.3307498, longitude: -122.03054302)
    let nC = NetworkClient()
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        friendsName.text = self.frndName
        dummyLocation = nC.getFriendsPosition(friend: frndUserNm)
        
        let location = locations[0]
        // print statement for debugging
        print ("Longitude:",location.coordinate.longitude, ", Latitude:", location.coordinate.latitude, "Heading: ", location.course)
        let rotationAngleDeg: CGFloat = CGFloat(location.course)
        let rotationAngleRad: CGFloat = degreesToRadians(angle: rotationAngleDeg)
        UIView.animate(withDuration: 0.5, animations: ({
            self.arrow.transform = CGAffineTransform.init(rotationAngle: rotationAngleRad)
        }))
        
        distanceLeft = Int(ceil(haversineFormula(location1: dummyLocation, location2: location)))
        if (distanceLeft < 20) {
            self.decodedDistLabel.text = "So close!"
        } else if (distanceLeft < 80) {
            self.decodedDistLabel.text = "Almost there!"
        } else {
            self.decodedDistLabel.text = "Keep going!"
        }
        self.distanceLabel.text = "\(distanceLeft) m"
    }
    
    func degreesToRadians (angle:CGFloat) -> CGFloat{
        return  angle * .pi / 180
    }
    
    func haversineFormula(location1: CLLocation, location2: CLLocation) -> CGFloat{
        let R : Double = 6378.137; // Radius of earth in km
        let dLat = location2.coordinate.latitude * .pi / 180 - location1.coordinate.latitude * .pi / 180
        let dLon = location2.coordinate.longitude * .pi / 180 - location2.coordinate.longitude * .pi / 180
        let a = sin(dLat/2) * sin(dLat/2) +
            cos(location1.coordinate.latitude * .pi / 180) * cos(location2.coordinate.latitude * .pi / 180) *
            sin(dLon/2) * sin(dLon/2)
        let c = 2 * atan2(sqrt(a), sqrt(1-a));
        let d = R * c;
        return CGFloat(d * 1000.0); // return in meters
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
    
    @IBAction func goBackToMainScreen(_ sender: Any) {
        let mainMenu = self.storyboard?.instantiateViewController(withIdentifier: "MAIN_MENU")
        self.present(mainMenu!, animated: true, completion: nil)
    }
}
