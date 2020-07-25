//
//  Lend_A_BookApp.swift
//  Lend-A-Book
//
//  Created by Brett Chapin on 7/20/20.
//

import SwiftUI
import Firebase

@main
struct Lend_A_BookApp: App {
    
    init() {
        FirebaseApp.configure()
        GADMobileAds.sharedInstance().start(completionHandler: nil)
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(AppEnvironment())
        }
    }
}

struct Lend_A_BookApp_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
