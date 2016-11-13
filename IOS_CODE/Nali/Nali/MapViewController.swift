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
        // show self
        self.map.showsUserLocation = true
        
        
        let theirLocation:CLLocationCoordinate2D = CLLocationCoordinate2DMake(dummyLocation.coordinate.latitude, dummyLocation.coordinate.longitude)
        // show them
        let annotation = MKPointAnnotation()
        annotation.coordinate = theirLocation
        self.map.addAnnotation(annotation)
        
        // update the arrow
        let rotationAngleRad: CGFloat = calculateAngle(location1: location, location2: dummyLocation)
        UIView.animate(withDuration: 0.5, animations: ({
            self.arrow.transform = CGAffineTransform.init(rotationAngle: rotationAngleRad)
        }))
        
    }
    
    func degreesToRadians (angle:CGFloat) -> CGFloat{
        return  angle * .pi / 180
    }
    
    // returns rad
    func calculateAngle(location1: CLLocation, location2: CLLocation) -> CGFloat{
        let a = sin(location2.coordinate.longitude-location1.coordinate.longitude) * cos(location2.coordinate.latitude)
        let b = cos(location1.coordinate.latitude) * sin(location2.coordinate.latitude) - sin(location1.coordinate.latitude)*cos(location2.coordinate.latitude)*cos(location2.coordinate.longitude-location1.coordinate.longitude)
        return  CGFloat(atan2(a,b))
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
