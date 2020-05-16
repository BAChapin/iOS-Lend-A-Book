//
//  Double.swift
//  Lend-A-Book
//
//  Created by Brett Chapin on 5/15/20.
//  Copyright © 2020 Black Rose Productions. All rights reserved.
//

import Foundation

let EARTH_EQUATORIAL_RADIUS: Double = 6378137.0
let WGS84_CONSTANT: Double = 0.99664719

extension Double {
    func convert(toMeters meters: Double) -> Double {
        let tanDegrees = tan(self.radians())
        let beta = tanDegrees * WGS84_CONSTANT
        let lengthOfDegree = cos(atan(beta)) * EARTH_EQUATORIAL_RADIUS * .pi / 180
        let measuresInDegreeLength = lengthOfDegree / meters
        return 1.0 / measuresInDegreeLength
    }
    
    func degree(forMeters meters: Double) -> Double {
        return meters / 111000
    }
    
    func radians() -> Double {
        return self * .pi / 180
    }
    
    func degrees() -> Double {
        return self * 180 / .pi
    }
}
