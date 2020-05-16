//
//  View.swift
//  Lend-A-Book
//
//  Created by Brett Chapin on 5/15/20.
//  Copyright © 2020 Black Rose Productions. All rights reserved.
//

import SwiftUI

extension View {
    var screen: CGSize {
        return UIScreen.main.bounds.size
    }
    
    func endEditing(_ force: Bool) {
        UIApplication.shared.windows.forEach({ $0.endEditing(force) })
    }
    
    func resignFirstResponder() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
