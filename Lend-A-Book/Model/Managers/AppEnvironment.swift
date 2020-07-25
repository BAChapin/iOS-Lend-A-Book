//
//  AppEnvirnment.swift
//  Lend-A-Book
//
//  Created by Brett Chapin on 7/24/20.
//

import SwiftUI
import MapKit

class AppEnvironment: NSObject, ObservableObject, CLLocationManagerDelegate {
    
    @Published var currentLocation: CLLocationCoordinate2D = CLLocationCoordinate2D()
    @Published var mapRegion: MKCoordinateRegion = MKCoordinateRegion()
    @Published var spanMeters: Double = 500
    var locationServicesEnabled: Bool = false
    
    
    private let locationService = CLLocationManager()
    private var lastAuthorizationStatus: CLAuthorizationStatus = .notDetermined
    
    override init() {
        super.init()
        self.locationServicesEnabled = CLLocationManager.locationServicesEnabled()
        locationService.delegate = self
        guard let loc = locationService.location?.coordinate else { return }
        self.currentLocation = loc
        print("Location - current: \(currentLocation)")
        self.mapRegion = MKCoordinateRegion(center: currentLocation, latitudinalMeters: spanMeters, longitudinalMeters: spanMeters)
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        self.lastAuthorizationStatus = manager.authorizationStatus()
        
        switch manager.authorizationStatus() {
        case .notDetermined:
            print("CLLocationManager - authorization not determined")
            self.getLocationPermission()
        case .restricted:
            print("CLLocationManager - authorization restricted")
        case .denied:
            print("CLLocationManager - authorization denied")
        case .authorizedAlways, .authorizedWhenInUse:
            guard let loc = locationService.location?.coordinate else { return }
            self.currentLocation = loc
        @unknown default:
            fatalError("Unknown result in \(#function)")
        }
    }
    
    func getLocationPermission() {
        locationService.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        locationService.requestWhenInUseAuthorization()
        guard let loc = locationService.location?.coordinate else { return }
        self.currentLocation = loc
    }
    
    func relocateUser() {
        getLocationPermission()
        if locationServicesEnabled {
            self.mapRegion = MKCoordinateRegion(center: currentLocation, latitudinalMeters: spanMeters, longitudinalMeters: spanMeters)
        }
    }
    
}
