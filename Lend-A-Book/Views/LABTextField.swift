//
//  LABTextField.swift
//  Lend-A-Book
//
//  Created by Brett Chapin on 5/16/20.
//  Copyright © 2020 Black Rose Productions. All rights reserved.
//

import SwiftUI

struct LABTextField: View {
    
    var placeholder: String
    @Binding var text: String
    var keyboardType: UIKeyboardType
    
    var body: some View {
        TextField(self.placeholder, text: $text)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .keyboardType(keyboardType)
            .opacity(text == "" ? 0.5 : 1.0)
            .animation(.easeIn(duration: 0.2))
    }
}

struct LABSecureTextField: View {
    var placeholder: String
    @Binding var text: String
    var keyboardType: UIKeyboardType
    
    var body: some View {
        SecureField(self.placeholder, text: self.$text)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .keyboardType(self.keyboardType)
            .opacity(text == "" ? 0.5 : 1.0)
            .animation(.easeIn(duration: 0.2))
    }
}
