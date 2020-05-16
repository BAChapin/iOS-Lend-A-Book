//
//  ButtonType.swift
//  Lend-A-Book
//
//  Created by Brett Chapin on 5/16/20.
//  Copyright © 2020 Black Rose Productions. All rights reserved.
//

import Foundation

enum ButtonType {
    case settings
    case profile
    case location
    case search
    
    var icon: String {
        switch self {
        case .search:   return "magnifyingglass"
        case .settings: return "gear"
        case .location: return "location.fill"
        case .profile:  return "person.fill"
        }
    }
}
