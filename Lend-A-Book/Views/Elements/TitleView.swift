//
//  TitleView.swift
//  Lend-A-Book
//
//  Created by Brett Chapin on 5/16/20.
//  Copyright © 2020 Black Rose Productions. All rights reserved.
//

import SwiftUI

struct TitleView: View {
    
    var font: Font = .titleFont
    
    var body: some View {
        VStack(spacing: 0) {
            Text("Lend")
                .font(font)
                .foregroundColor(.white)
                .shadow(color: .black, radius: 2.0, x: 2.0, y: 2.0)
            
            Text("-A-")
                .font(font)
                .foregroundColor(.white)
                .shadow(color: .black, radius: 2.0, x: 2.0, y: 2.0)
            
            Text("Book")
                .font(font)
                .foregroundColor(.white)
                .shadow(color: .black, radius: 2.0, x: 2.0, y: 2.0)
        }
    }
}

