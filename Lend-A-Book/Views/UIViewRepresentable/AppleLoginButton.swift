//
//  AppleIDButton.swift
//  Lend-A-Book
//
//  Created by Brett Chapin on 5/16/20.
//  Copyright © 2020 Black Rose Productions. All rights reserved.
//

import SwiftUI
import AuthenticationServices

struct AppleLoginButton: UIViewRepresentable {
    
    func makeUIView(context: Context) -> ASAuthorizationAppleIDButton {
        let button = ASAuthorizationAppleIDButton(authorizationButtonType: .continue, authorizationButtonStyle: .whiteOutline)
        return button
    }
    
    func updateUIView(_ uiView: ASAuthorizationAppleIDButton, context: Context) {
        // TODO: See if this needs anything.
    }
}
