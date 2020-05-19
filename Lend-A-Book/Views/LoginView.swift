//
//  LoginView.swift
//  Lend-A-Book
//
//  Created by Brett Chapin on 5/17/20.
//  Copyright © 2020 Black Rose Productions. All rights reserved.
//

import SwiftUI

struct LoginView: View {
    
    @ObservedObject var manager = LoginManager()
    
    var body: some View {
        VStack(spacing: 20) {
            
            LABTextField(placeholder: "Email Address", text: manager.$userName, keyboardType: .emailAddress)
            LABSecureTextField(placeholder: "Password", text: manager.$password, keyboardType: .alphabet)
            
            VStack(spacing: 20) {
                
                Button(action: {
                    // TODO: Login functionality for email and password
                }, label: {
                    Text(verbatim: "Login")
                        .font(.headline)
                        .frame(width: 180, height: 45, alignment: .center)
                })
                    .foregroundColor(.white)
                    .background(Color.black)
                    .cornerRadius(10)
                
                HStack {
                    FacebookLoginButton()
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .frame(minHeight: 40, idealHeight: 45, maxHeight: 50, alignment: .center)
                        .background(Color.facebook)
                        .cornerRadius(10)
                        .onTapGesture {
                            // TODO: Add login functionality for facebook
                        }
                    
                    AppleLoginButton()
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .frame(minHeight: 40, idealHeight: 45, maxHeight: 50, alignment: .center)
                        .cornerRadius(10)
                    
                }
            }
            .padding(.top, 50)
            .alert(isPresented: <#T##Binding<Bool>#>) { () -> Alert in
                // TODO: Present alert for for any errors in login
            }
        }
        .sheet(isPresented: <#T##Binding<Bool>#>) {
            Text("Signed in")
        }

    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
