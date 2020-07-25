//
//  MapItem.swift
//  Lend-A-Book
//
//  Created by Brett Chapin on 7/23/20.
//

import SwiftUI
import MapKit

struct Marker: Identifiable {
    let id = UUID()
    var location: MapMarker
}

let place = [Marker(location: MapMarker(coordinate: CLLocationCoordinate2D(latitude: 41.0797, longitude: -85.1394), tint: .red)),
             Marker(location: MapMarker(coordinate: CLLocationCoordinate2D(latitude: 41.0789, longitude: -85.1394), tint: .blue)),
             Marker(location: MapMarker (coordinate: CLLocationCoordinate2D(latitude: 41.0793, longitude: -85.1390), tint: .green)),
             Marker(location: MapMarker(coordinate: CLLocationCoordinate2D(latitude: 41.0793, longitude: -85.1398), tint: .black))]
