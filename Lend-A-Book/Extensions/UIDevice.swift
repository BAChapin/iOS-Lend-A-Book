//
//  UIDevice.swift
//  Lend-A-Book
//
//  Created by Brett Chapin on 5/15/20.
//  Copyright © 2020 Black Rose Productions. All rights reserved.
//

import UIKit

public enum DeviceType: String, CaseIterable {
    case iPhone6S
    case iPhone6SPlus
    case iPhoneSE
    case iPhone7
    case iPhone7Plus
    case iPhone8
    case iPhone8Plus
    case iPhoneX
    case iPhoneXS
    case iPhoneXSMax
    case iPhoneXR
    case iPhone11
    case iPhone11Pro
    case iPhone11ProMax
    case iPhoneSE2ndGen

    case iPodTouch6G

    case iPad5
    case iPad6
    case iPadMini
    case iPadMiniRetina
    case iPadMini3
    case iPadMini4

    case iPadAir
    case iPadAir2

    case iPadPro9Inch
    case iPadPro10p5Inch
    case iPadPro11Inch
    case iPadPro12Inch

    case simulator
    case notAvailable
    
    enum ScreenSize {
        case standard
        case tall
        case unsupported
        
        // 1.775
        // 2.165
        init(deviceType: DeviceType) {
            switch deviceType {
            case .iPhone6S, .iPhone6SPlus, .iPhoneSE, .iPhoneSE2ndGen, .iPhone7, .iPhone7Plus, .iPhone8, .iPhone8Plus, .iPodTouch6G: self = .standard
            case .iPhoneX, .iPhoneXS, .iPhoneXSMax, .iPhoneXR, iPhone11, .iPhone11Pro, .iPhone11ProMax: self = .tall
            default: self = .unsupported
            }
        }
        
        init() {
            let screenSize = UIScreen.main.bounds.size
            let ratio = screenSize.height / screenSize.width
            
            switch ratio {
            case 1.7..<2.0: self = .standard
            case 2.0..<2.5: self = .tall
            default: self = .unsupported
            }
        }
        
        var imagePostfix: String {
            switch self {
            case .standard: return "Standard"
            case .tall: return "Tall"
            case .unsupported: return ""
            }
        }
    }
    
    enum DeviceCategory {
        case iPhone
        case iPhoneX
        case iPad
        case unsupported
        
        init(deviceType: DeviceType) {
            switch deviceType {
            case .iPhone6S, .iPhone6SPlus, .iPhoneSE, .iPhoneSE2ndGen, .iPhone7, .iPhone7Plus, .iPhone8, .iPhone8Plus, .iPodTouch6G: self = .iPhone
            case .iPhoneX, .iPhoneXS, .iPhoneXSMax, .iPhoneXR, iPhone11, .iPhone11Pro, .iPhone11ProMax: self = .iPhoneX
            case .iPadPro9Inch, .iPadPro10p5Inch, .iPadPro11Inch, .iPadPro12Inch, .iPad6, .iPad5, .iPadMini4, .iPadAir2: self = .iPad
            default: self = .unsupported
            }
        }
    }
    
    public static var current: DeviceType {
        var systemInfo = utsname()
        uname(&systemInfo)
        
        let machine = systemInfo.machine
        let mirror = Mirror(reflecting: machine)
        var identifier = ""
        
        for child in mirror.children {
            if let value = child.value as? Int8, value != 0 {
                identifier.append(String(UnicodeScalar(UInt8(value))))
            }
        }
        
        return DeviceType(identifier: identifier)
    }
    
    var screenType: ScreenSize {
        return ScreenSize()
    }
    
    var category: DeviceCategory {
        return DeviceCategory(deviceType: self)
    }
    
    public var displayName: String {
        switch self {
        case .iPhone6S: return "iPhone 6S"
        case .iPhone6SPlus: return "iPhone 6S Plus"
        case .iPhoneSE: return "iPhone SE"
        case .iPhone7: return "iPhone 7"
        case .iPhone7Plus: return "iPhone 7 Plus"
        case .iPhone8: return "iPhone 8"
        case .iPhone8Plus: return "iPhone 8 Plus"
        case .iPhoneX: return "iPhone X"
        case .iPhoneXS: return "iPhone XS"
        case .iPhoneXSMax: return "iPhone XS Max"
        case .iPhoneXR: return "iPhone XR"
        case .iPad5: return "iPad 5"
        case .iPad6: return "iPad 6"
        case .iPadMini: return "iPad Mini"
        case .iPadMiniRetina: return "iPad Mini Retina"
        case .iPadMini3: return "iPad Mini 3"
        case .iPadMini4: return "iPad Mini 4"
        case .iPadAir: return "iPad Air"
        case .iPadAir2: return "iPad Air 2"
        case .iPadPro9Inch: return "iPad Pro 9 Inch"
        case .iPadPro10p5Inch: return "iPad Pro 10.5 Inch"
        case .iPadPro11Inch: return "iPad Pro 11 Inch"
        case .iPadPro12Inch: return "iPad Pro 12 Inch"
        case .simulator: return "Simulator"
        case .notAvailable: return "Not Available"
        case .iPodTouch6G: return "iPod Touch (7th Gen)"
        case .iPhone11: return "iPhone 11"
        case .iPhone11Pro: return "iPhone 11 Pro"
        case .iPhone11ProMax: return "iPhone 11 Pro Max"
        case .iPhoneSE2ndGen: return "iPhone SE 2nd Gen"
        }
    }
    
    internal var identifiers: [String] {
        switch self {
        case .notAvailable: return []
        case .simulator: return ["i386", "x86_64"]

        case .iPhone6S: return ["iPhone8,1"]
        case .iPhone6SPlus: return ["iPhone8,2"]
        case .iPhoneSE: return ["iPhone8,4"]
        case .iPhone7: return ["iPhone9,1", "iPhone9,3"]
        case .iPhone7Plus: return ["iPhone9,2", "iPhone9,4"]
        case .iPhone8: return ["iPhone10,1", "iPhone10,4"]
        case .iPhone8Plus: return ["iPhone10,2", "iPhone10,5"]
        case .iPhoneX: return ["iPhone10,3", "iPhone10,6"]
        case .iPhoneXS: return ["iPhone11,2"]
        case .iPhoneXSMax: return ["iPhone11,4", "iPhone11,6"]
        case .iPhoneXR: return ["iPhone11,8"]
            
        case .iPodTouch6G: return ["iPod7,1"]
            
        case .iPad5: return ["iPad6,11", "iPad6,12"]
        case .iPad6: return ["iPad7,5", "iPad7,6"]
        case .iPadMini: return ["iPad2,5", "iPad2,6", "iPad2,7"]
        case .iPadMiniRetina: return ["iPad4,4", "iPad4,5", "iPad4,6"]
        case .iPadMini3: return ["iPad4,7", "iPad4,8", "iPad4,9"]
        case .iPadMini4: return ["iPad5,1", "iPad5,2"]
        case .iPadAir: return ["iPad4,1", "iPad4,2", "iPad4,3"]
        case .iPadAir2: return ["iPad5,3", "iPad5,4"]
        case .iPadPro9Inch: return ["iPad6,3", "iPad6,4"]
        case .iPadPro10p5Inch: return ["iPad7,3", "iPad7,4"]
        case .iPadPro11Inch: return ["iPad8,1", "iPad8,2", "iPad8,3", "iPad8,4"]
        case .iPadPro12Inch: return ["iPad6,7", "iPad6,8", "iPad7,1", "iPad7,2", "iPad8,5", "iPad8,6", "iPad8,7", "iPad8,8"]
        case .iPhone11: return ["iPhone12,1"]
        case .iPhone11Pro: return ["iPhone12,3"]
        case .iPhone11ProMax: return ["iPhone12,5"]
        case .iPhoneSE2ndGen: return ["iPhone12,8"]
        }
    }
    
    internal init(identifier: String) {
        for device in DeviceType.allCases {
            for deviceId in device.identifiers {
                guard identifier == deviceId else { continue }
                self = device
                return
            }
        }
        self = .notAvailable
    }
}

extension UIDevice {
    static var deviceType: DeviceType {
        return DeviceType.current
    }
}
