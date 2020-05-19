//
//  LoginManager.swift
//  Lend-A-Book
//
//  Created by Brett Chapin on 5/17/20.
//  Copyright © 2020 Black Rose Productions. All rights reserved.
//

import SwiftUI
import Combine

class LoginManager: ObservableObject {
    
    static var app = LoginManager()
    
    @Binding var userName: String
    @Binding var password: String
    @State var showSignInAlert: Bool = false
    @State var showNewUserView: Bool = false
    @State var shouldDismiss: Bool = false
    @State var alertTitle: String = ""
    @State var alertMessage: String = ""
    
    // TODO: Computer Property to check logged-in status
    init() {
        userName = ""
        password = ""
    }
    
    // TODO: Login logic
}
