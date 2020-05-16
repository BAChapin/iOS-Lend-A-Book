//
//  Environment.swift
//  Lend-A-Book
//
//  Created by Brett Chapin on 5/15/20.
//  Copyright © 2020 Black Rose Productions. All rights reserved.
//

import UIKit

enum Environment {
    case development
    case production
    case testing
}

extension UIDevice {
    static var environment: Environment {
        guard let path = Bundle.main.appStoreReceiptURL?.path else {
            return .testing
        }
        
        return path.contains("CoreSimulator") || path.contains("sandboxReceipt") ? .development : .production
    }
}
