//
//  ContentView.swift
//  Lend-A-Book
//
//  Created by Brett Chapin on 9/18/19.
//  Copyright © 2019 Black Rose Productions. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var nextScreen: Bool = false
    
    var body: some View {
        NavigationView {
            
            Text("Hello World!")
            
                .navigationBarTitle("Lend-A-Book", displayMode: .inline)
                .navigationBarColor(.blue)
                .navigationBarTextColor(.white)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
