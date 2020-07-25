//
//  FloatingNavButton.swift
//  Lend-A-Book
//
//  Created by Brett Chapin on 7/23/20.
//

import SwiftUI

struct FloatingNavButton: View {
    
    var type: ButtonType
    var action: (ButtonType) -> Void
    
    var body: some View {
        Image(systemName: type.icon)
//            .frame(width: 35, height: 35, alignment: .center)
            .padding(10)
            .background(Color.blue)
            .clipShape(Circle())
            .scaledToFill()
            .foregroundColor(Color("Black"))
            .onTapGesture(count: 1, perform: {
                action(type)
            })
    }
}
