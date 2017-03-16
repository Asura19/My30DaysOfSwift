//
//  ViewController.swift
//  Where
//
//  Created by Phoenix on 2017/3/16.
//  Copyright © 2017年 Wolkamo. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet weak var locationLabel: UILabel!
    
    var locationManager: CLLocationManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    
    @IBAction func findeMyLocation(_ sender: UIButton) {
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        self.locationLabel.text = "Error " + error.localizedDescription
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if locations.count > 0 {
            self.handle(location: locations.first!)
        }
    }
    
    func handle(location: CLLocation) {
        CLGeocoder().reverseGeocodeLocation(location, completionHandler: { (placeMarks, error) in
            if (error != nil) {
                self.locationLabel.text = "Reverse geocoder failed with error" + error!.localizedDescription
                return
            }
            
            if placeMarks!.count > 0 {
                if let place = placeMarks?[0] {
                    
                    self.locationManager.stopUpdatingLocation()
                    
                    let locality = (place.locality != nil) ? place.locality : ""
                    let postalCode = (place.postalCode != nil) ? place.postalCode : ""
                    let administrativeArea = (place.administrativeArea != nil) ? place.administrativeArea : ""
                    let country = (place.country != nil) ? place.country : ""
                    
                    self.locationLabel.text = postalCode! + " " + locality!
                    self.locationLabel.text?.append("\n" + administrativeArea! + ", " + country!)
                }
            }
            else {
                self.locationLabel.text = "Problem with the data received from geocoder"
            }
        })
    }

}

