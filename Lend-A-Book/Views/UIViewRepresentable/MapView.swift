//
//  MapView.swift
//  Lend-A-Book
//
//  Created by Brett Chapin on 5/15/20.
//  Copyright © 2020 Black Rose Productions. All rights reserved.
//

import SwiftUI
import MapKit
import CoreLocation

struct MapView: UIViewRepresentable {
    
    @Binding var currentLocation: CLLocationCoordinate2D
    @Binding var spanMeters: Double
    
    var span: MKCoordinateSpan {
        return MKCoordinateSpan(latitudeDelta: Double().degree(forMeters: spanMeters), longitudeDelta: currentLocation.longitude.convert(toMeters: spanMeters))
    }
    
    func makeUIView(context: Context) -> MKMapView {
        let map = MKMapView()
        map.showsUserLocation = true
        map.userTrackingMode = .none
        map.delegate = context.coordinator
        return map
    }
    
    func updateUIView(_ uiView: MKMapView, context: Context) {
        let region = MKCoordinateRegion(center: currentLocation, span: span)
        uiView.setRegion(region, animated: true)
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    private func updateAnnotations(from mapView: MKMapView) {
        // TODO: Use this to update annotations
    }
    
    func setCenter(_ location: CLLocationCoordinate2D, animated: Bool) {
        // TODO: Update the MapView's center
    }
}

extension MapView {
    final class Coordinator: NSObject, MKMapViewDelegate {
        var control: MapView
        
        init(_ control: MapView) {
            self.control = control
        }
        
        func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
            // TODO: Add didSelect functionality for displaying a detail view of some kind to the user for that location.
        }
    }
}
