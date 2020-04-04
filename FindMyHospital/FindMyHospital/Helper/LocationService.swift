//
//  LocationService.swift
//  WOVO
//
//  Created by Debasish Mondal on 01/08/19.
//  Copyright © 2019 Indusnet Technologies. All rights reserved.
//

import Foundation
import CoreLocation

protocol LocationServiceDelegate: class {
    func trackingLocation(_ currentLocation: CLLocation)
    func trackingLocationDidFailWithError(_ error: Error)
}

class Locationservices: NSObject, CLLocationManagerDelegate {
    
    // shared instance
    static var sharedLocation = Locationservices()
    
    // instance
    var locationManager: CLLocationManager?
    var location: CLLocation?
    weak var delegate: LocationServiceDelegate?
    
    override init() {
        super.init()
        self.locationManager = CLLocationManager()
        guard let _locationManager  = self.locationManager else { return  }
        
        if CLLocationManager.authorizationStatus() == .notDetermined {
            _locationManager.requestAlwaysAuthorization()
        }
        _locationManager.desiredAccuracy = kCLLocationAccuracyBest
        _locationManager.delegate = self
        startDeviceUpdatingLocation()
    }
    
    // start update location
    func startDeviceUpdatingLocation() {
        guard getLocationPermission() else { return }
        print("Starting Location Updates")
        self.locationManager?.startUpdatingLocation()
    }
    
    // stop update location
    func stopDeviceUpdatingLocation() {
        print("Stop Location Updates")
        self.locationManager?.stopUpdatingLocation()
    }
    
    // check user permission
    func getLocationPermission () -> Bool {
        switch CLLocationManager.authorizationStatus() {
        case .authorizedAlways, .authorizedWhenInUse:
            return true
        case .denied, .restricted:
            return false
        case .notDetermined:
            return false
        default:
            return false
        }
    }
    
    // location manager delegate
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let _location = locations.last else { return  }
        location = _location
        updateLocation(currentLocation: _location)
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        updateLocationDidFailWithError(error: error)
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if (status == .denied  || status == .notDetermined) {
            manager.requestAlwaysAuthorization()
        } else {
            manager.startUpdatingLocation()
        }
    }
    
    // Private function
    private func updateLocation(currentLocation: CLLocation) {
        
        guard let _delegate = self.delegate else { return }
        
        _delegate.trackingLocation(currentLocation)
    }
    
    private func updateLocationDidFailWithError(error: Error) {
        
        guard let delegate = self.delegate else {
            return
        }
        delegate.trackingLocationDidFailWithError(error)
    }
}
