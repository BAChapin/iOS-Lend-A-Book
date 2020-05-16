//
//  FloatingNavButton.swift
//  Lend-A-Book
//
//  Created by Brett Chapin on 5/16/20.
//  Copyright © 2020 Black Rose Productions. All rights reserved.
//

import SwiftUI

struct FloatingNavButton: View {
    
    var type: ButtonType
    
    var body: some View {
        Image(systemName: type.icon)
            .frame(width: 35, height: 35, alignment: .center)
            .padding(10)
            .scaledToFill()
            .foregroundColor(Color("Black"))
    }
}
