//
//  ContentView.swift
//  Lend-A-Book
//
//  Created by Brett Chapin on 7/20/20.
//

import SwiftUI
import MapKit
import GoogleMobileAds

struct ContentView: View {
    
    @EnvironmentObject var manager: AppEnvironment
    
    var body: some View {
        ZStack(alignment: .bottom) {
            NavigationView {
                ZStack(alignment: .top) {
                    
                    Map(coordinateRegion: $manager.mapRegion, showsUserLocation: true, annotationItems: place) { marker in
                        marker.location
                    }
                    .edgesIgnoringSafeArea(.bottom)
                    
                }
                .navigationBarTitle("Lend-A-Book", displayMode: .inline)
                .navigationBarItems(leading: FloatingNavButton(type: .settings, action: self.buttonPressed)
                                        .padding(.bottom, 10),
                                    trailing: FloatingNavButton(type: .profile, action: self.buttonPressed)
                                        .padding(.bottom, 10))
                .navigationBarColor(UIColor.red)                // TODO: Update colors when color scheme is decided
                .navigationBarTextColor(UIColor.green)          // TODO: Update colors when color scheme is decided
            }
            
            VStack {
                HStack {
                    FloatingButton(type: .location, action: self.buttonPressed(_:))
                        .padding(.leading, 15)
                    
                    Spacer()
                    
                    FloatingButton(type: .search, action: self.buttonPressed(_:))
                        .padding(.trailing, 15)
                }
                .padding(.bottom, 15)
                
//                BannerView()
//                    .frame(width: kGADAdSizeBanner.size.width, height: kGADAdSizeBanner.size.height)
            }
        }
        
    }
    
    private func buttonPressed(_ buttonType: ButtonType) {
        switch buttonType {
        case .search:
            searchButton()
        case .settings:
            settingsButton()
        case .profile:
            profileButton()
        case .location:
            relocateButton()
        }
    }
    
    private func profileButton() {
        print("\(#function) tapped")
    }
    
    private func settingsButton() {
        print("\(#function) tapped")
    }
    
    private func searchButton() {
        print("\(#function) tapped")
    }
    
    private func relocateButton() {
        manager.relocateUser()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(AppEnvironment())
    }
}
