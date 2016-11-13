//
//  MapViewController.swift
//  Nali
//
//  Created by Jonathan Adalin on 2016-11-12.
//  Copyright © 2016 parchican. All rights reserved.
//

import UIKit
import Foundation
import CoreLocation
import MapKit

class MapViewController: UIViewController,CLLocationManagerDelegate {
    
    @IBOutlet weak var map: MKMapView!
    @IBOutlet weak var arrow: UIImageView!
    
    let manager = CLLocationManager()

    let dummyLocation: CLLocation = CLLocation(latitude: 37.3307498, longitude: -122.03054302)
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let location = locations[0]
        
        // update the map
        let span:MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: 0.01,longitudeDelta: 0.01)
        let myLocation:CLLocationCoordinate2D = CLLocationCoordinate2DMake(location.coordinate.latitude, location.coordinate.longitude)
        let region:MKCoordinateRegion = MKCoordinateRegionMake(myLocation,span)
        map.setRegion(region, animated:true)
        
        self.map.showsUserLocation = true
        
        // update the arrow
        let rotationAngleDeg: CGFloat = CGFloat(location.course)
        let rotationAngleRad: CGFloat = degreesToRadians(angle: rotationAngleDeg)
        UIView.animate(withDuration: 0.5, animations: ({
            self.arrow.transform = CGAffineTransform.init(rotationAngle: rotationAngleRad)
        }))
        
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
