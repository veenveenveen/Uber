//
//  FxLocation.swift
//  Uber
//
//  Created by 黄启明 on 2016/10/28.
//  Copyright © 2016年 huatengIOT. All rights reserved.
//

import UIKit
import CoreLocation

class FxLocation: NSObject, CLLocationManagerDelegate {
    
    var locationManager: CLLocationManager?
    
    func startLocation() {
        if CLLocationManager.locationServicesEnabled() {
            locationManager = CLLocationManager()
            locationManager?.delegate = self
            locationManager?.desiredAccuracy = kCLLocationAccuracyBest
            locationManager?.distanceFilter = 100
            locationManager?.requestAlwaysAuthorization()
            locationManager?.startUpdatingLocation()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        FxLog(message: "\(status)")
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let location = locations.first
        searchAddress(location: location!)
        locationManager?.stopUpdatingLocation()
        
    }
    
    func searchAddress(location: CLLocation) {
        let ge: CLGeocoder = CLGeocoder()
        ge.reverseGeocodeLocation(location, completionHandler: { (placemarks: [CLPlacemark]?, error: Error?) in
            if placemarks != nil {
                for mark in placemarks! {
                    FxLog(message: "\(mark)")
                }
            }
        })
        
    }
    
}
