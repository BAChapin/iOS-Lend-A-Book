//
//  FacebookLoginButton.swift
//  Lend-A-Book
//
//  Created by Brett Chapin on 5/16/20.
//  Copyright © 2020 Black Rose Productions. All rights reserved.
//

import SwiftUI
import Firebase
import FBSDKCoreKit
import FBSDKLoginKit

struct FacebookLoginButton: UIViewRepresentable {
    
    func makeUIView(context: Context) -> FBLoginButton {
        let button = FBLoginButton()
        let text = NSAttributedString(string: "Continue with Facebook")
        button.titleLabel?.font = button.titleLabel?.font.withSize(12)
        button.setAttributedTitle(text, for: .normal)
        button.delegate = context.coordinator
        button.permissions = ["public_profile", "email"]
        return button
    }
    
    func updateUIView(_ uiView: FBLoginButton, context: Context) {
        switch UIDevice.deviceType.category {
        case .iPhone:   uiView.titleLabel?.font = uiView.titleLabel?.font.withSize(8)
        case .iPhoneX:  uiView.titleLabel?.font = uiView.titleLabel?.font.withSize(12)
        case .iPad:     uiView.titleLabel?.font = uiView.titleLabel?.font.withSize(14)
        default: break
        }
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
}

extension FacebookLoginButton {
    final class Coordinator: NSObject, LoginButtonDelegate {
        
        var control: FacebookLoginButton
        
        init(_ control: FacebookLoginButton) {
            self.control = control
        }
        
        func loginButton(_ loginButton: FBLoginButton, didCompleteWith result: LoginManagerLoginResult?, error: Error?) {
            if let error = error {
                print("FacebookLoginButton - \(#function) encountered an error: \(error.localizedDescription)")
                return
            }
            
            let credential = FacebookAuthProvider.credential(withAccessToken: AccessToken.current!.tokenString)
            
            // TODO: Authentication with Firebase
        }
        
        func loginButtonDidLogOut(_ loginButton: FBLoginButton) {
            do {
                // TODO: Logging out of Firebase functionality
            } catch let error {
                print("FacebookLoginButton - \(#function) encountered an error: \(error.localizedDescription)")
            }
        }
    }
}
